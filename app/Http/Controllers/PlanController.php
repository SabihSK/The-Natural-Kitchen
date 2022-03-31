<?php

namespace App\Http\Controllers;

use App\Ingredient;
use App\IngredientType;
use App\Plan;
use Illuminate\Http\Request;

class PlanController extends Controller
{
    public function all()
    {
        return Plan::all();
    }

    public function getProhibitedIngredients($plan_id) {
        $plan = Plan::find($plan_id);
        $prohibitedIngredients = $plan->prohibitedIngredients->load('ingredient_type');
        $prohibitedIngredientTypes = $plan->prohibitedIngredientTypes;

        $ingIds = $prohibitedIngredients->pluck('id')->toArray();
        $ingTIds = $prohibitedIngredientTypes->pluck('id')->toArray();

        $ings_with_types = IngredientType::with('ingredients')->get();

        $allIngredientsWithTypes = $ings_with_types->groupBy(function($item) use($ingIds, $ingTIds){
            return $item->id;
        })->map(function(&$ingType, $ingTypeId) use($ingIds, $ingTIds){

            $ingType[0]->checked = in_array($ingTypeId, $ingTIds);

            foreach($ingType[0]->ingredients as &$ing) {
                $ing->checked = in_array($ing->id, $ingIds);
            }

            return $ingType[0];
        });

        $allIngredientsWithTypes->each(function(&$item){
            $ingredients = $item->ingredients->groupBy('id')->map(function($ing) {

                return $ing[0];
            });

            unset($item->ingredients);
            $item->ingredients = $ingredients;

        });

        return $allIngredientsWithTypes;
    }

    public function updatePlanProhibitedIngredients(Request $request) {
        /*$plan_ingredients_data = $request->get('ingredients');
        $plan_id = $request->get('plan_id');
        $plan = Plan::find($plan_id);

        if(empty($plan_ingredients_data)) {
            $plan->prohibitedIngredients()->detach();
            return [];
        }

        $ingredients_ids = array_column($plan_ingredients_data, 'id');
        $plan->prohibitedIngredients()->sync($ingredients_ids);

        return $plan;*/

        $plan_ingredients_data = $request->get('ingredients');
        $plan_id = $request->get('plan_id');
        $remove = $request->get('remove');
        $plan = Plan::find($plan_id);
        $ingTypeId = $request->get('ingTypeId');

        /*if(empty($plan_ingredients_data)) {
            $plan->prohibitedIngredients()->detach();
            return [];
        }*/

        $message = '';

//        dd($remove == 1 ? ' Remove => True' : 'Remove => False');

        if($remove == 0) {
            if($ingTypeId != 0) {
                $plan->prohibitedIngredientTypes()->detach($ingTypeId);
                $message = __("Plan's Prohibited ingredient Type removed successfully.");
            }
            else {
                $plan->prohibitedIngredients()->detach($plan_ingredients_data);
                $message = __("Plan's Prohibited ingredient removed successfully.");
            }
        }
        else {
            if($ingTypeId != 0) {
                $ingIds = Ingredient::whereIngredientTypeId($ingTypeId)->get()->pluck('id');
                $plan->prohibitedIngredients()->detach($ingIds);
                $plan->prohibitedIngredientTypes()->sync($ingTypeId, false);
                $message = __("Plan's Prohibited ingredient Type added successfully.");
            }
            else {
                $plan->prohibitedIngredients()->sync($plan_ingredients_data, false);
                $message = __("Plan's Prohibited ingredient added successfully.");
            }
        }

        return [
            'status' => 1,
            'message' => $message
        ];
    }
}
