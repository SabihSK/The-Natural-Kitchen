<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class Customer extends Model
{
    protected $appends = ['dailyCalories'];

    protected $guarded = [];

    public const ACTIVATED = 1;
    public const DEACTIVATED = 0;
    public const PAUSED = 2;

    public function fcId()
    {
        return 'TNK-' . $this->customer_id;
    }

    public function generateCId()
    {
        $max_id = Customer::orderByDesc('customer_id')->first()->customer_id;
        if (empty($max_id) || is_null($max_id)) $max_id = 1;
        $new_id = intval($max_id) + 1;

        $this->customer_id = $new_id;
        $this->save();
    }

    public function cmId()
    {
        return 'TNK-' . $this->customer_id;
    }

    public function meals()
    {
        return $this->hasMany(CustomerMeal::class);
    }

    public function weeks()
    {
        return $this->belongsToMany(Week::class, 'customer_weeks', 'customer_id', 'week_id')->withPivot(['subscribed'])->withTimestamps();
    }

    public function getDailyCaloriesAttribute()
    {
        if ($this->consider_calories) {
            return $this->attributes['daily_calories'];
        }

        return 0;
    }

    public function getMealConsumableCalories($meal_type)
    {
        if (is_int($meal_type)) {
            $meal_type = MealType::find($meal_type);
        }

        if (!$meal_type) {
            return 0;
        }

        $calories = $this->getDailyCaloriesAttribute() * $meal_type['calories_percentage'] / 100;

        return round($calories);
    }

    public function calculateCalories()
    {
        if ($this->gender == 0) {
            $allowed_calories = (10 * $this->weight) + (6.25 * $this->height) - (5 * $this->age) - 161;
        } else {
            $allowed_calories = (10 * $this->weight) + (6.25 * $this->height) - (5 * $this->age) + 5;
        }
        $allowed_calories = $allowed_calories * $this->getActivityFactor();

        // Maintain Weight
        if ($this->weightchange == 2) {
            return $allowed_calories;
        } // Lose Weight
        else if ($this->weightchange == 0) {
            return $allowed_calories - 1000;
        } // Gain Weight
        else if ($this->weightchange == 1) {
            return $allowed_calories + 1000;
        }
    }

    public function reCalculateCalories()
    {
        $this->daily_calories = $this->calculateCalories();
    }

    private function getActivityFactor()
    {
        ;
        switch ($this->exercise_frequency) {
            case 0:
                return 1.21;
                break;

            case 1:
                return 1.53;
                break;

            case 2:
                return 1.76;
                break;

            default:
                return 1;
        }

    }

    public function allergicIngredients()
    {
        return $this->belongsToMany(Ingredient::class, 'customers_allergic_ingredients')->withTimestamps();
    }

    public function allergicIngredientTypes()
    {
        return $this->belongsToMany(IngredientType::class, 'customers_allergic_ingredient_types')->withTimestamps();
    }

    public function dislikedIngredients()
    {
        return $this->belongsToMany(Ingredient::class, 'customer_disliked_ingredients')->withTimestamps();
    }

    public function mealTypes()
    {
        return $this->belongsToMany(MealType::class, 'customer_meal_types')->withTimestamps();
    }

    public function ingredientTypesAmounts()
    {
        return $this->belongsToMany(IngredientType::class, 'customer_ingredients_amount')->withPivot('amount', 'meal_type_id')->withTimestamps();
    }

    public function program()
    {
        return $this->hasMany(CustomerProgram::class);
    }

    public function plan()
    {
        return $this->belongsTo(Plan::class);
    }

    public function allExcludedIngredients($all = true)
    {
        $excluded_ingredients_types = $this->allergicIngredientTypes->pluck('id')->toArray();
        $excluded_ingredients_types_ings = Ingredient::whereIn('ingredient_type_id', $excluded_ingredients_types)->get()->toArray();

//        if($this->plan === null) dd($this->plan);

        $this->plan->load('prohibitedIngredients');

        $excluded_ingredients = array_merge($this->allergicIngredients->toArray(), $excluded_ingredients_types_ings);
        $excluded_ingredients_ids = array_column($excluded_ingredients, 'id');
        return array_values(array_unique($excluded_ingredients_ids));

    }

    public function allDislikedIngredients()
    {
        return $this->dislikedIngredients->pluck('id')->toArray();

    }

    public function subscription_days()
    {
        return $this->belongsToMany(CustomerDay::class, 'customer_days')->withTimestamps();
    }

    public function pausedDays()
    {
        return $this->hasMany(CustomerExcludedDay::class);
    }

    public function getPausedDays()
    {
        return $this->pausedDays->pluck('date')->toArray();
    }

    /**
     * Check if day is NOT excluded
     * @param $date
     * @return bool
     */
    public function hasDay($date)
    {
        $formatted_date = date('Y-m-d', strtotime($date));
        $day_num = date('w', strtotime($formatted_date));
        $excluded_days = json_decode($this->excluded_days);
        $paused_days = $this->getPausedDays();
        if (($excluded_days == null || count($excluded_days) == 0) && ($paused_days == null || count($paused_days) == 0)) {
            return true;
        }

        return !in_array($day_num, !is_null($excluded_days) ? $excluded_days : []) && !in_array($formatted_date, !is_null($paused_days) ? $paused_days : []);
    }


    public function getWeekDays($days, $reformatted = false)
    {
        $reformat = function ($date) use ($reformatted) {
            return $reformatted ? date('Y-m-d', strtotime($date)) : $date;
        };

        foreach ($days as $k => $d) {
            if (!$this->hasDay($d)) {
                // Day is excluded
                unset($days[$k]);
            }

        }

        $days = array_map($reformat, $days);

        return array_values($days);
    }

    /**
     * @param Week $week
     * @param MealType $meal_types
     * @oaram boolean $attach
     * @return array
     */
    public function selectSetOfMeals($week, $meal_types, $attach = false)
    {
        $meal_types = $meal_types->toArray();
        $my_meal_types = $this->mealTypes->toArray();

        $main_meals_object = [];
        $mm = [];
        $consumable_cals = [];

        $disliked_ingredients = $this->allDislikedIngredients();

        $calories_plusminus = intval(setting('calories.tolerance', 100));

        /*if ($this->mealTypesCount($meal_types, $my_meal_types) > 0 && count($meal_types) != $this->mealTypesCount($meal_types, $my_meal_types)) {
            $meal_types = array_column($meal_types, 'id');
        }*/

        $meal_types = $this->myMealTypes($meal_types, $my_meal_types);
        $meal_types = collect($meal_types)->filter(function ($mt) {
            return $mt['extra'] == 0;
        });
        $meal_types = $meal_types->toArray();
        $meal_types_ids = array_column($meal_types, 'id');
        $programs = $this->program->groupBy('meal_type_id')->map(function ($item) {
            return $item[0];
        });

        $consider_cals = $this->consider_calories;

        if ($consider_cals == 1 && count($programs) == 0) {

            foreach ($meal_types_ids as $meal_type_id) {
                if ($consider_cals == 1) {
                    $consumable_cals[$meal_type_id] = round($this->getMealConsumableCalories($meal_type_id));
                } else {
                    $consumable_cals[$meal_type_id] = -1;
                }
            }
        }

        $valid_meals_set_arr = [];
//        $customer_ingredients = $this->ingredientTypesAmounts->groupBy('pivot.meal_type_id');

        if (count($programs) > 0) {
            $excluded_ingredients = $this->allExcludedIngredients();
            // Customer has Program
            foreach ($meal_types_ids as $mealTypeId) {
                if (isset($programs[$mealTypeId])) {
                    $program = $programs[$mealTypeId];
                    $options = $program->options;
                    $mealsArr = collect([]);
                    $plan_meals = collect([]);
                    foreach ($options as $option) {
                        $data = $option->data;
                        $programIngTypesIds = array_column($data, 'ingredient_type_id');
                        $this->plan->load(['meals' => function ($q) use ($mealTypeId, $programIngTypesIds, $excluded_ingredients) {
                            $q->where('meal_type_id', $mealTypeId);
                            $q->whereDoesntHave('ingredients', function ($qq) use ($excluded_ingredients) {
                                return $qq->where('removable', 0)->whereIn('id', $excluded_ingredients);
                            });
                            foreach ($programIngTypesIds as $ingTypeId) {
                                $q->whereHas('ingredients', function ($qq) use ($ingTypeId) {
                                    $qq->where('ingredient_type_id', $ingTypeId);
                                });
                            }
                        }]);
                        $plan_meals = $this->plan->meals;
                        $plan_meals->map(function (&$meal) use ($data) {
                            $meal->data = $data;
                        });
                        $mealsArr = $mealsArr->merge($plan_meals->all());
                    }

                    $mealsArrCount = $mealsArr->count();
                    $found = $mealsArrCount > 0;

                    /* Found a matching meal */
                    if ($found) {
                        $mealsArr = $mealsArr->toArray();
                        $index = 0;

                        $week_days = $week->days;
                        $week_days = $this->getWeekDays($week_days);

                        foreach ($week_days as $k => $day) {
                            // Looping Week Days

                            $index = isset($mealsArr[$index]) ? $index : 0;
                            $meal = $mealsArr[$index];

                            $formatted_day = date('Y-m-d', strtotime($day));
                            $week_meal = WeekMeal::where([
                                'meal_id' => $meal['id'],
                                'meal_type_id' => $mealTypeId,
                                'week_id' => $week->id,
                                'date' => $formatted_day
                            ]);

                            if ($attach && $week_meal->exists()) {
                                $week_meal = $week_meal->first();
                                $cmeal = CustomerMeal::create(['customer_id' => $this->id, 'week_meal_id' => $week_meal->id, 'notes' => json_encode($meal['data']), 'total_calories' => 0]);
                                $main_meals_object[$mealTypeId][] = $meal['name'];
                            }
                            /*
                            if(!isset($option->kitchen_id)) {
                                $kitchen_id = $default_kitchen;
                            }
                            else {
                                $kitchen_id = $option->kitchen_id;
                            }
                            $kitchen = Kitchen::find($kitchen_id);
                            $mealType = MealType::find($mealTypeId);

                             $meal = Meal::withoutGlobalScope('custom')->custom($mealTypeId, $kitchen_id)->first();

                            if(!$meal) {

                                $meal = Meal::create([
                                    'name' => 'Custom (Kitchen: ' . $kitchen->name. ' - Meal Type: ' . $mealType->name . ')',
                                    'kitchen_id' => $kitchen_id,
                                    'meal_type_id' => $mealTypeId,
                                    'custom' => 1,
                                ]);
                            }

                            $week_meal = WeekMeal::firstOrCreate([
                                'meal_id' => $meal->id,
                                'meal_type_id' => $mealTypeId,
                                'week_id' => $week->id,
                                'date'  =>  $formatted_day
                            ]);
                            if($attach) {
                                $meal = CustomerMeal::create(['customer_id' => $this->id, 'week_meal_id' => $week_meal->id, 'notes' => json_encode($data), 'total_calories' => 0]);
                                 $main_meals_object[] = $meal;
                            }*/
                            $index++;
                        }
                    }

                } else {
                    $this->plan->load('meals');
                    $plan_meals = $this->plan->meals->pluck('id');
                    $meals = WeekMeal::where(['week_id' => $week->id])->where(['meal_type_id' => $mealTypeId])->whereIn('date', $this->getWeekDays($week->days, true))
                        ->where('date', '>=', $week->startdate)->where('date', '<=', $week->enddate)
                        ->orderBy('date', 'ASC')->orderBy('meal_type_id', 'ASC')
                        ->whereHas('meal', function ($q) use ($mealTypeId, $consumable_cals, $calories_plusminus, $plan_meals) {
                            $q->whereIn('id', $plan_meals);
                            $q->whereCustom(0);
                            $q->whereMealTypeId($mealTypeId);
                            /*$consumable_calories = $consumable_cals[$meal_type_id];
                            if($this->consider_calories) {
                                $q->where('total_calories', '>=', ($consumable_calories - $calories_plusminus))->where('total_calories', '<', ($consumable_calories + $calories_plusminus));
                            }*/

                            return $q;
                        });

                    $meals = $meals->whereDoesntHave('meal.ingredients', function ($q) use ($excluded_ingredients) {
                        return $q->where('removable', 0)->whereIn('id', $excluded_ingredients);
                    });

                    $meals = $meals->with('meal')->get()->sortByDesc(function ($meal) {
                        return $meal->total_calories;
                    })->groupBy('date')->map(function ($week_meal) {
                        return $week_meal->map(function ($value) {
                            return $value;
                        });
                    });
                    foreach ($meals as $k => $weekmeals) {
                        $m = [];
                        // Disliked Ingredients filter
                        $valid_meals_set = $weekmeals->filter(function ($meal, $key) use ($disliked_ingredients) {
                            return count($meal->meal->ingredients->pluck('id')->intersect($disliked_ingredients)) == 0;
                        });

                        $m = $valid_meals_set->count() > 0 ? $valid_meals_set->random() : $weekmeals->random();
                        if ($attach) {
                            CustomerMeal::create(['customer_id' => $this->id, 'week_meal_id' => $m->id, 'total_calories' => $m->meal->total_calories]);
                        }
                        $main_meals_object[$mealTypeId][] = $m->meal->name;
                    }
                }
            }

//             dd($main_meals_object);

            return $main_meals_object;
        } else {
            // Customer DOES NOT have Program

            $excluded_ingredients = $this->allExcludedIngredients();
            foreach ($meal_types_ids as $meal_type_id) {
                $plan_meals = $this->plan->meals->pluck('id');

                $meals = WeekMeal::where(['week_id' => $week->id])->where(['meal_type_id' => $meal_type_id])
                    ->where('date', '>=', $week->startdate)->where('date', '<=', $week->enddate)->whereIn('date', $this->getWeekDays($week->days, true))
                    ->orderBy('date', 'ASC')->orderBy('meal_type_id', 'ASC')
                    ->whereHas('meal', function ($q) use ($meal_type_id, $consumable_cals, $calories_plusminus, $plan_meals) {
                        $q->whereCustom(0);
                        $q->whereMealTypeId($meal_type_id);
                        if ($this->consider_calories) {
                            $consumable_calories = $consumable_cals[$meal_type_id];
                            $q->where('total_calories', '<', $consumable_calories)->orWhere(function($qq) use($consumable_calories) {
                                $qq->where('total_calories', '>=', $consumable_calories - intval(setting('calories.tolerance', 200)))->where('total_calories', '<', $consumable_calories + intval(setting('calories.tolerance', 200)));
                            });
//                            $q->where('total_calories', '>=', $consumable_calories - intval(setting('calories.tolerance', 200)))->where('total_calories', '<', $consumable_calories + intval(setting('calories.tolerance', 200)));
                        }


                        return $q;
                    });

                $meals = $meals->whereDoesntHave('meal.ingredients', function ($q) use ($excluded_ingredients) {
                    return $q->where('removable', 0)->whereIn('id', $excluded_ingredients);
                });

                $meals = $meals->with(['meal' => function ($q) use ($calories_plusminus, $plan_meals)  {
                    $q->whereIn('id', $plan_meals);
                    $q->orderBy(\Illuminate\Support\Facades\DB::raw('ABS(total_calories-' . $calories_plusminus . ')'), 'ASC');
                }])->get();

                $meals = $meals->filter(function($week_meal){
                    return !empty($week_meal->meal);
                });

                $meals = $meals->sortByDesc(function ($meal) {
                    return $meal->total_calories;
                })->groupBy('date')->map(function ($week_meal) {
                    return $week_meal->map(function ($value) {
                        return $value;
                    });
                });

                $ind = 0;
                $k_arr = [];
                foreach ($meals as $k => &$m) {
                    $m = $m->take(count($week->days) * 2);

                    // Disliked Ingredients filter
//                    $valid_meals_set = $m->filter(function ($meal, $key) use ($disliked_ingredients) {
//                        return count($meal->meal->ingredients->pluck('id')->intersect($disliked_ingredients)) == 0;
//                    });

                    $valid_meals_set = $m;

                    if ($valid_meals_set->count() > 0) {
                        $m = $valid_meals_set;
                    }
                    $ind = isset($m[$ind]) ? $ind : 0;
                    $m = $m[$ind];
                    $ind++;

                    if ($attach) {
                        $cmeal = CustomerMeal::create(['customer_id' => $this->id, 'week_meal_id' => $m->id, 'total_calories' => $m->meal->total_calories]);
                        if ($this->consider_calories == 1) {
                            $extraAmount = CustomerMeal::completeMissingCalories($m, $consumable_cals, $calories_plusminus);
                            if (count($extraAmount) > 0) {
                                $cmeal->additional_ingredients()->sync($extraAmount);
                            }
                        }
                    }
                    $mm[$k][] = $m;
                }
                $main_meals_object[$meal_type_id][] = $meals->toArray();
            }
        }
//        foreach ($main_meals_object as &$item) {
//            $item = $item->toArray();
//        };

//        dd($mm);
        return $mm;
    }

    public function selectSetOfMealsNoLimitation($week_id, $day, $meal_type_id)
    {
        $meal_type = MealType::findOrFail($meal_type_id);

        // Fetch all (plan X mealtype) meals
        $meals = WeekMeal::where('week_id', $week_id)->where('date', Carbon::parse($day)->format('Y-m-d'))->where('meal_type_id', $meal_type_id);
        $meals = $meals->whereHas('meal', function ($q) {
            $q->whereHas('plans', function ($qq) {
                $qq->where('plan_id', $this->plan_id);
            });
        });

        if ($meals->exists()) {
            if($this->consider_calories) {
                $consumable_calories = $this->getMealConsumableCalories($meal_type_id);
                $consumable_calories = round($consumable_calories);
                $meals = $meals->whereHas('meal', function ($q) use ($consumable_calories) {
                    $q->where('total_calories', '<', $consumable_calories);
//                $q->where('total_calories', '>=', $consumable_calories - intval(setting('calories.tolerance', 200)))->where('total_calories', '<', $consumable_calories + intval(setting('calories.tolerance', 200)));
                    $q->whereHas('plans', function ($qq) {
                        $qq->where('plan_id', $this->plan_id);
                    });
                });
            }
            if ($meals->exists()) {

                $excluded_ingredients = $this->allExcludedIngredients();
                $meals->whereDoesntHave('meal.ingredients', function ($q) use ($excluded_ingredients) {
                    return $q->where('removable', 0)->whereIn('id', $excluded_ingredients);
                });

                if ($meals->exists()) {
                    $programs = $this->program->groupBy('meal_type_id')->map(function ($item) {
                        return $item[0];
                    });
                    if (isset($programs[$meal_type_id])) {
                        return "No meals matching any option from the customer's assigned program for {$meal_type->name}";
                        /*if (isset($programs[$meal_type_id])) {
                            $program = $programs[$meal_type_id];
                            $options = $program->options;
                            foreach ($options as $option) {
                                $data = $option->data;
                                $programIngTypesIds = array_column($data, 'ingredient_type_id');
                                $meals->whereHas(['meal' => function ($q) use ($meal_type_id, $programIngTypesIds) {
                                    foreach ($programIngTypesIds as $ingTypeId) {
                                        $q->whereHas('ingredients', function ($qq) use ($ingTypeId) {
                                            $qq->where('ingredient_type_id', $ingTypeId);
                                        });
                                    }
                                }]);
                            }

                        }
                        if ($meals->exists()) {
                            //meals exists after applying PROGRAM constraint
                            dd($meals->get());
                        } else {
                        return "PROGRAM ISSUE";
                        }*/
                    } else {
                        return "Please try the <b class='badge badge-info'>Re-Generate Meals</b> button to re-generate meals for that customer";
                    }
                } else {
                    return "Available meals have ingredients that the customer is allergic to, if these ingredients are marked as <b>Removable</b> from the edit meal page, these meals will be selectable";
                }

            } else {
                return "No meals matching allowed calories for this customer, please make sure to have meals with adjustable ingredients amounts so that the system can increase the adjustable ingredients' amounts to match the customer's allowed calories (Only for meals with calories less than the customer's allowed calories)";
            }
        } else {
            return "No meals found, please add/select <b class='badge badge-info'>{$meal_type->name}</b> meals for date: <b class='badge badge-info'>{$day}</b> for the <b class='badge badge-info'>{$this->plan->name}</b> plan from <a href='".route('voyager.weeks.edit', $week_id)."'>This Page</a>.";
        }
    }

    public function getAllValidMeals($week_id, $meal_type_id = 0)
    {
        $excluded_ingredients = $this->allExcludedIngredients();
        $excluded_and_disliked_ingredients = array_unique(array_merge($excluded_ingredients, $this->allDislikedIngredients()));

        $week_meal_query = WeekMeal::whereWeekId($week_id)->with('week');
        $week_meal_query->when($meal_type_id > 0, function ($q, $meal_type_id) {
            $q->whereMealTypeId($meal_type_id);
        });

        $meals = $week_meal_query->whereDoesntHave('meal.ingredients', function ($q) use ($excluded_ingredients, $excluded_and_disliked_ingredients) {
            return $q->where('removable', 0)->whereIn('id', $excluded_ingredients);
        })->get()->filter(function ($meal) {
            $consumable_calories = $this->getMealConsumableCalories($meal->meal_type_id);
            $consumable_calories = round($consumable_calories);
            return (($meal->meal->total_calories >= $consumable_calories - intval(setting('calories.tolerance', 200))) && ($meal->meal->total_calories < $consumable_calories + intval(setting('calories.tolerance', 200))));
        })->sortByDesc(function ($meal) {
            return $meal->total_calories;
        });

        return $meals;
    }

    public function customer_meals()
    {
        return $this->hasMany(CustomerMeal::class);
    }

    public function scopeActive($query)
    {
        return $query->whereStatus(static::ACTIVATED);
    }

    public function scopePaused($query)
    {
        return $query->whereStatus(static::PAUSED);
    }

    public function scopeExpiringSoon($query)
    {
        $date = \Carbon\Carbon::now()->format('Y-m-d');

        return $query->active()->whereHas('weeks', function ($q) use ($date) {
            $q->whereRaw(DB::raw('enddate - ' . $date . ')'), '<=', 10);
        });
    }

    public function scopeHavingWeek($query, $week_id)
    {
        return $query->whereHas('weeks', function ($q) use ($week_id) {
            $q->where('weeks.id', $week_id);
        })->whereDoesntHave('weeks', function ($q) use ($week_id) {
            $q->where(['weeks.id' => $week_id, 'subscribed' => 0]);
        })->doesntHave('weeks', 'or');
    }

    public function scopeHavingWeeks($query)
    {
        return $query->whereHas('weeks', function ($q) {
            $q->where('subscribed', 1);
            $q->where('enddate', '>=', date('Y-m-d'));
        });
    }

    public static function withMissingMeals($week, $week_days_count, $meal_types)
    {
        $meal_types_count = $meal_types->count();
        $week_id = $week->id;
        $week_meals_ids = WeekMeal::whereWeekId($week_id)->pluck('id');
        $customers_with_missing_meals_ids = [];
        $customers = static::active()->havingWeek($week_id)->with(['meals' => function ($q) use ($week_meals_ids, $week_days_count, $meal_types_count) {
            return $q->whereIn('week_meal_id', $week_meals_ids);
        }])->get()->map(function ($item) use ($week_days_count, $meal_types_count, &$customers_with_missing_meals_ids, $week, $meal_types) {
            $my_meal_types = $item->mealTypes;
            $complete = $item->hasCompleteWeekMeals($week, $item->myMealTypes($meal_types, $my_meal_types));
            $item->meals_complete = $complete;
            if (!$complete) {
                $customers_with_missing_meals_ids[] = $item->id;
            }

            return $item;
        })->groupBy('id');
        if ($customers->count() > 0) {
            return [
                'data' => $customers,
                'customers_missing_meals_ids' => $customers_with_missing_meals_ids
            ];
        } else {
            $customers_data = static::active()->get()->map(function ($item) {
                $item->meals_complete = false;
                return $item;
            })->groupBy('id');
            return [
                'data' => $customers_data,
                'customers_missing_meals_ids' => count(static::all()->map(function ($item) {
                    $item->meals_complete = false;
                    return $item;
                })->groupBy('id'))
            ];
        }

        /*  $customers_meals = CustomerMeal::whereIn('week_meal_id', $week_meals_ids);
          if($customers_meals->count() == 0) {
              dd(Customer::with('meals')->get()->groupBy('id')->toArray());
          }

          $customers_with_week_meals = $customers_meals->with('week_meals.meal')->get()->groupBy('customer_id')->filter(function($item) use ($week_days_count, $meal_types_count){
              return $item->count() < $week_days_count*$meal_types_count;
          });

          dd($customers_with_week_meals->toArray());*/
    }

    public function mealsTypesCalories()
    {
        $meals_types_cals = [];
        $meals_types = MealType::all();
        foreach ($meals_types as $mt) {
            $meals_types_cals[$mt->id] = [
                'name' => $mt->name,
                'calories' => $this->getMealConsumableCalories($mt->id)
            ];
        }

        $this->meals_calories = $meals_types_cals;
    }

    public function hasCompleteWeekMeals($week, $myMealTypes = null)
    {
        if (is_null($myMealTypes)) $myMealTypes = $this->myMealTypes();

        $myMealTypes = !is_array($myMealTypes) ? $myMealTypes : collect($myMealTypes);
        $meals_count = CustomerMeal::whereCustomerId($this->id)->whereHas('week_meals', function ($q) use ($week) {
            $q->whereWeekId($week->id);
            $q->whereHas('meal_type', function ($qq) {
                $qq->main();
            });
        })->count();

        $meal_types_count = MealType::whereIn('id', $myMealTypes->pluck('id')->toArray())->main()->count();
        $week_days_count = count($this->getWeekDays($week->days));

        return $meals_count == $week_days_count * $meal_types_count;
    }

    public function scopeNewlyAdded($q, $days = 15)
    {
        $date = new Carbon();

        $date->subDays($days);

        return $this->where('created_at', '>', $date->toDateTimeString());
    }

    public function getAllergiesListAttribute()
    {
        return $this->allExcludedIngredients();
    }

    public function mealTypesCount($all_meal_types, $my_meal_types)
    {
        return count($this->myMealTypes($all_meal_types, $my_meal_types));
    }

    public function myMealTypes($all_meal_types = null, $my_meal_types = null)
    {
        if (is_null($all_meal_types))
            $all_meal_types = MealType::all()->toArray();

        if (is_null($my_meal_types))
            $my_meal_types = $this->mealTypes->toArray();

        $meal_types_count = count($all_meal_types);
        $my_meal_types_count = count($my_meal_types);
        if ($my_meal_types_count == 0 || $my_meal_types_count == $meal_types_count) {
            return $all_meal_types;
        }

        return $my_meal_types;
    }

    public function getCustomerMealNameFromCMArray($customerMealsArray, $meal_type_id)
    {
        foreach ($customerMealsArray as $customer_meal) {
            if ($customer_meal->week_meals->meal_type_id == $meal_type_id) {
                return $customer_meal->week_meals->meal->name;
            }
        }

        if (in_array($meal_type_id, array_column($customerMealsArray[0]['customer']->myMealTypes(), 'id'))) {
            return 'No assigned meals';
        }

        return '';
    }
}
