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
            padding: 20px;
        }
        .meal_box{
            border: 1px dotted #aaa;
            width: 10cm;
            height: 3cm;
        }
        .meal_box span {
            font-size: 12px;
        }
    </style>
</head>

<body>

<!-- Page Content -->
<div class="container-fluid">
        @foreach($meals_info  as $meal_info)
        <div class="row">
            <div class="text-center meal_box">
                    <span>{{ \Carbon\Carbon::parse($meal_info->week_meals->date)->format('d/m/Y')  }}</span><br>
                    <span>{{ $meal_info->week_meals->meal->name  }}</span><br>
                    <h6><strong>{{ $meal_info->customer->fullname. ' #'.$meal_info->customer->cmId() }}</strong></h6>
                    @if(json_decode($meal_info->notes))
                            @foreach(json_decode($meal_info->notes) as $key => $note)
                                {{$note->amount}} gm of {{$ing_types[$note->ingredient_type_id]->name}} {{$key+1 < count(json_decode($meal_info->notes)) ? ' + ' : ''}}
                            @endforeach
                    @else
                        <span>{{ 'Kcal '.$meal_info->total_calories }}/</span>
                        <span>{{ 'Fat '.$meal_info->getTotalFats().'g/ Carb '.$meal_info->getTotalCarb().'g/ Protein '.$meal_info->getTotalProteins().'g' }}</span>
                    @endif
                </div>
            </div>
            @endforeach
</div>

<!-- Bootstrap core JavaScript -->
<script>
    window.onload = function(){
        window.print();
    };
</script>

</body>

</html>
