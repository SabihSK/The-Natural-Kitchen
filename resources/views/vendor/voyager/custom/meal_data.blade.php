<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width+initial-scale=1+shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>The Natural Kitchen - Meal Label - {{ $meals_info[0]->week_meals->meal->name }}</title>

    <!-- Bootstrap core CSS -->
    <link href="{{asset('css/app.css')}}" rel="stylesheet">

    <style>
        @media print {
            @page {
                size: auto;   /* auto is the initial value */
                margin: 0;  /* this affects the margin in the printer settings */
            }
            div{
                page-break-inside: avoid !important;
                page-break-after: auto !important;
            }
        }

        body{
            padding-top: 20px;
        }
        .meal_box{
            border: 1px solid #888;
        }
        .meal_box span {
            font-size: 12px;
        }
    </style>
</head>

<body>

<!-- Page Content -->
<div class="container-fluid">
    <div class="row">
        <h2 class="text-center">
            {{$meals_info[0]->week_meals->meal->name }}
        </h2>
        <table class="table table-bordered table-hover table-condensed table-striped">
            <thead>
            <tr>
                <th>Customer Name</th>
                @if($meals_info[0]->week_meals->meal->custom == 0)
                    <th>Additional Ingredients</th>
                @endif
                <th>Plan</th>
                <th>Allergies (Ingredient Types)</th>
                <th>Allergies (Ingredients)</th>
                @if($meals_info[0]->week_meals->meal->custom == 1)
                    <th>Custom Recipes</th>
                @endif
            </tr>
            </thead>
            <tbody>
            @foreach($meals_info as $key => $meal_info)
                <tr>
                    <td>{{$meal_info->customer->fullname}}</td>
                    @if($meal_info->week_meals->meal->custom == 0)
                        <td>
                            <ul>
                                @foreach($meal_info->additional_ingredients as $key => $add_ing)
                                    {{ $add_ing->pivot->amount }} <u><i>gm</i></u> of {{ $add_ing->name }}
                                @endforeach
                            </ul>
                        </td>
                    @endif
                    <td>
                        {{$meal_info->customer->plan->name}}
                    </td>
                    <td>
                        {{$meal_info->customer->allergicIngredientTypes->implode('name', ' & ')}}

                    </td>
                    <td>
                        {{$meal_info->customer->allergicIngredients->implode('name', ' & ')}}
                    </td>
                    @if($meals_info[0]->week_meals->meal->custom == 1)
                        <td>
                            <ul>
                                @if(json_decode($meal_info->notes))
                                    @foreach(json_decode($meal_info->notes) as $key => $note)
                                        {{$note->amount}} gm of {{$ing_types[$note->ingredient_type_id]->name}} {{$key+1 < count(json_decode($meal_info->notes)) ? ' + ' : ''}}
                                    @endforeach
                                @endif
                            </ul>
                        </td>
                    @endif
                </tr>
            @endforeach
            </tbody>
        </table>
        {{-- @foreach($meals_info as $key => $meal_info)
                 <div class="col-sm-3 text-center meal_box">
                     <span>{{ \Carbon\Carbon::parse($meal_info->week_meals->date)->format('d/m/Y')  }}</span><br>
                     <span>{{ $meal_info->week_meals->meal->name  }}</span><br>
                     <h5><strong>{{ $meal_info->customer->fullname. ' #'.$meal_info->customer->id }}</strong></h5>
                     @if($meal_info->custom_amounts->count() > 0)
                         @foreach($meal_info->custom_amounts as $custom_amount)
                                 <span>{{$custom_amount->name. ' ' .$custom_amount->pivot->amount. 'g'}}</span><br>
                         @endforeach
                     @else
                         <span>{{ 'Kcal '.$meal_info->total_calories }}</span><br>
                         <span>{{ 'Fat '.$meal_info->getTotalFats().'g/ Carb '.$meal_info->getTotalCarb().'g/ Protein '.$meal_info->getTotalProteins().'g' }}</span>
                     @endif
                 </div>
             @endforeach--}}
    </div>
</div>

<!-- Bootstrap core JavaScript -->
<script>
    window.onload = function(){
        window.print();
    };
</script>

</body>

</html>
