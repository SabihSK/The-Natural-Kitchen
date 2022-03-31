<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width+initial-scale=1+shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>The Natural Kitchen - Customers Meals report for {{ \Carbon\Carbon::createFromFormat('Y-m-d', $date)->format('d/m/y') }} </title>

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
            @page { size: landscape; }
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
        <h2 class="text-center" style="display: block;width: 100%">
            Customers Meals report for <strong>{{ \Carbon\Carbon::createFromFormat('Y-m-d', $date)->format('l jS F Y') }}</strong>
        </h2>
        <table id="reportTable" class="table table-hover table-bordered table-condensed table-striped">
            <thead>
            <tr>
                <th>Customer Name</th>
                @foreach($all_meal_types as $meal_type)
                    <th>{{$meal_type->name}}</th>
                @endforeach
            </tr>
            </thead>
            <tbody>
            @foreach($customers_meals as $customer_id => $customer_meals_arr)
            <tr>
                <td>{{ $customer_meals_arr[0]['customer']['fullname'] }} <div class="badge badge-info">{{$customer_meals_arr[0]['customer']['plan']['name']}}</div></td>
                @foreach($all_meal_types as $meal_type)
                    <td style="@if(in_array($meal_type->id, array_column($customer_meals_arr[0]['customer']->myMealTypes(), 'id'))) background: '#ddd' @endif">
                        {{$customer_meals_arr[0]['customer']->getCustomerMealNameFromCMArray($customer_meals_arr, $meal_type->id)}}
                    </td>
                @endforeach
            </tr>
            @endforeach
            </tbody>
        </table>
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
