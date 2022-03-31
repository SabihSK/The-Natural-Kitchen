@extends('voyager::master')

@section('page_title', 'Meals Calendar')


@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="text-center">
                <h2 class="kitchen_heading">{{$kitchen->name}}</h2>
            </div>
            <div id="meals_calendar" class="col-md-12">
                <h3 class="month_name">@{{ months_list[currentDate.getMonth()]+' '+currentDate.getFullYear() }}</h3>
                <div class="text-center">
                    <div class="btn-group btn-group-lg" role="group" aria-label="...">
                        <button @click="changeMonth(-1)" type="button" class="btn btn-default"><i class="glyphicon glyphicon-menu-left"></i> Previous</button>
                        <button @click="changeMonth(0)" type="button" class="btn btn-default">Current</button>
                        <button @click="changeMonth(1)" type="button" class="btn btn-default">Next <i class="glyphicon glyphicon-menu-right"></i></button>
                    </div>
                </div>
                <div class="calendar">
                    <div class="calendar" data-toggle="calendar">
                        <table class="table table-bordered">
                            <tbody>
                            <tr class="row" v-for="(chunk, index) in chunkedDates()" style="width: 100%">
                                <td v-for="date in chunk" class="col-xs-12 calendar-day calendar-no-current-month" :style="'width: '+(100/7)+'%'">
                                    <div style="min-height: 200px">
                                        <time :datetime="date">@{{ getDay(date) }}</time>
                                        <div v-if="meals[date] != undefined" class="events">
                                            <ul>
                                                <li v-for="(week_meal, meal_id) in meals[date]">
                                                    <a @click="view_meals(week_meal[0])" data-toggle="modal" data-target="#myModal"><span class="badge badge-info" v-for="plan in week_meal[0].meal.plans">@{{ plan.name }}</span><br> @{{ week_meal[0].meal.name }}</a>: <i :class="['badge', all_prepared(week_meal[0].customers_meals) ? 'badge-success' : 'badge-warning']">@{{ preparedMeals(week_meal[0].customers_meals) }}/@{{ week_meal[0].customers_meals_count }}</i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                </div>

            </div>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" v-if="show_modal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">@{{ current_meal.meal.name }}</h4>
                                <a href="javascript:;" @click="bulkPrepareMeal" class="btn btn-info">Mark all as Prepared</a>
                                <a :href="getCustomerMealLabelUrl(current_cmeals_ids)" class="btn btn-info" target="_blank">Print all labels at once</a>
                                <a :href="getCustomerMealDataUrl(current_cmeals_ids)" class="btn btn-info" target="_blank">Print Customer Meals Data</a>
                            </div>
                            <div class="modal-body">
                                <table class="table table-bordered table-hover table-condensed table-striped">
                                    <thead>
                                        <tr>
                                            <th>Customer Name</th>
                                            <th>Prepared ?</th>
                                            <th>Additional Ingredients</th>
                                            <th>Allergies (Ingredient Types)</th>
                                            <th>Allergies (Ingredients)</th>
                                            <th>Custom Recipes</th>
                                            <th>Meal Label</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(customer_meal, index) in current_meal.customers_meals" :data-meal_id="current_meal.customers_meals[index].id">
                                            <td><a :href="get_edit_customer_url(customer_meal.customer.id)" target="_blank" style="text-decoration: none;">@{{ customer_meal.customer.fullname }}</a></td>
                                            <td>
                                                <div class="wrapper">
                                                    <div class="switch_box box_1">
                                                        <input type="checkbox" class="switch_1" :value="customer_meal.cooked ? 1 : 0" v-model="customer_meal.cooked" :checked="customer_meal.cooked ? 'checked' : 'false'" @click="prepareMeal(customer_meal.id, index)">
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <span v-if="customer_meal.additional_ingredients.length == 0">N/A</span>
                                                <div v-else>
                                                    <li v-for="ingredient in customer_meal.additional_ingredients">
                                                        +@{{ ingredient.pivot.amount }} <u><i>gm</i></u> of @{{ ingredient.name }}
                                                    </li>
                                                </div>
                                            </td>
                                            <td>
                                                <span v-if="customer_meal.customer.allergic_ingredient_types.length > 0">
                                                    <span v-for="(allIngType, index) in customer_meal.customer.allergic_ingredient_types">
                                                        @{{ allIngType.name}} @{{ index+1 < customer_meal.customer.allergic_ingredient_types.length ? ' + ' : ' ' }}
                                                    </span>
                                                </span>
                                                <span v-else>N/A</span>
                                            </td>
                                            <td>
                                                <span v-if="customer_meal.customer.allergic_ingredients.length > 0">
                                                    <span v-for="(allIng, index) in customer_meal.customer.allergic_ingredients">
                                                        @{{ allIng.name}} @{{ index+1 < customer_meal.customer.allergic_ingredients.length ? ' + ' : ' ' }}
                                                    </span>
                                                </span>
                                                <span v-else>N/A</span>
                                            </td>
                                            <td>
                                                <p>
                                                    @{{ readableIngredientsText(customer_meal.notes) }}
                                                </p>
                                            </td>
                                            <td>
                                                <a :href="getCustomerMealLabelUrl(customer_meal.id)" target="_blank" class="btn btn-default"><i class="voyager-receipt"></i></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>

@stop

@section('css')
    <style>
        @media print {
            .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
                float: left;
            }
            .col-sm-12 {
                width: 100%;
            }
            .col-sm-11 {
                width: 91.66666667%;
            }
            .col-sm-10 {
                width: 83.33333333%;
            }
            .col-sm-9 {
                width: 75%;
            }
            .col-sm-8 {
                width: 66.66666667%;
            }
            .col-sm-7 {
                width: 58.33333333%;
            }
            .col-sm-6 {
                width: 50%;
            }
            .col-sm-5 {
                width: 41.66666667%;
            }
            .col-sm-4 {
                width: 33.33333333%;
            }
            .col-sm-3 {
                width: 25%;
            }
            .col-sm-2 {
                width: 16.66666667%;
            }
            .col-sm-1 {
                width: 8.33333333%;
            }
        }
        @media (min-width: 992px){
            .modal-lg {
                width: 1600px;
            }
        }
        .wrapper{
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            /* width: 400px; */
            margin: 3vh auto 0;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        .switch_box{
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            max-width: 70px;
            /* min-width: 200px; */
            /* height: 70px; */
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
        }

        /* Switch 1 Specific Styles Start */

        .box_1{
            /*background: #eee;*/
        }

        input[type="checkbox"].switch_1{
            font-size: 30px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            width: 40px;
            height: 25px;
            background: #ddd;
            border-radius: 3em;
            position: relative;
            cursor: pointer;
            outline: none;
            -webkit-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
        }

        input[type="checkbox"].switch_1:checked{
            background: #0ebeff;
        }

        input[type="checkbox"].switch_1:after{
            position: absolute;
            content: "";
            width: 25px;
            height: 25px;
            border-radius: 50%;
            background: #fff;
            -webkit-box-shadow: 0 0 0.25em rgba(0,0,0,.3);
            box-shadow: 0 0 0.25em rgba(0,0,0,.3);
            -webkit-transform: scale(.7);
            transform: scale(.7);
            left: 0;
            -webkit-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
        }

        input[type="checkbox"].switch_1:checked:after{
            left: calc(100% - 25px);
        }

        /* Switch 1 Specific Style End */


        /* Switch 2 Specific Style Start */

        .box_2{
            background: #666;
        }

        input[type="checkbox"].switch_2{
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            width: 100px;
            height: 8px;
            background: #444;
            border-radius: 5px;
            position: relative;
            outline: 0;
            cursor: pointer;
        }

        input[type="checkbox"].switch_2:before,
        input[type="checkbox"].switch_2:after{
            position: absolute;
            content: "";
            -webkit-transition: all .25s;
            transition: all .25s;
        }

        input[type="checkbox"].switch_2:before{
            width: 40px;
            height: 40px;
            background: #ccc;
            border: 5px solid #666;
            border-radius: 50%;
            top: 50%;
            left: 0;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        input[type="checkbox"].switch_2:after{
            width: 30px;
            height: 30px;
            background: #666;
            border-radius: 50%;
            top: 50%;
            left: 10px;
            -webkit-transform: scale(1) translateY(-50%);
            transform: scale(1) translateY(-50%);
            -webkit-transform-origin: 50% 50%;
            transform-origin: 50% 50%;
        }

        input[type="checkbox"].switch_2:checked:before{
            left: calc(100% - 35px);
        }

        input[type="checkbox"].switch_2:checked:after{
            left: 75px;
            -webkit-transform: scale(0);
            transform: scale(0);
        }

        /* Switch 2 Specific Style End */


        /* Switch 3 Specific Style Start */

        .box_3{
            background: #19232b;
        }

        .toggle_switch{
            width: 100px;
            height: 45px;
            position: relative;
        }

        input[type="checkbox"].switch_3{
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
            outline: 0;
            z-index: 1;
        }

        svg.checkbox .outer-ring{
            stroke-dasharray: 375;
            stroke-dashoffset: 375;
            -webkit-animation: resetRing .35s ease-in-out forwards;
            animation: resetRing .35s ease-in-out forwards;
        }

        input[type="checkbox"].switch_3:checked + svg.checkbox .outer-ring{
            -webkit-animation: animateRing .35s ease-in-out forwards;
            animation: animateRing .35s ease-in-out forwards;
        }

        input[type="checkbox"].switch_3:checked + svg.checkbox .is_checked{
            opacity: 1;
            -webkit-transform: translateX(0) rotate(0deg);
            transform: translateX(0) rotate(0deg);
        }

        input[type="checkbox"].switch_3:checked + svg.checkbox .is_unchecked{
            opacity: 0;
            -webkit-transform: translateX(-200%) rotate(180deg);
            transform: translateX(-200%) rotate(180deg);
        }


        svg.checkbox{
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        svg.checkbox .is_checked{
            opacity: 0;
            fill: yellow;
            -webkit-transform-origin: 50% 50%;
            transform-origin: 50% 50%;
            -webkit-transform: translateX(200%) rotate(45deg);
            transform: translateX(200%) rotate(45deg);
            -webkit-transition: all .35s;
            transition: all .35s;
        }

        svg.checkbox .is_unchecked{
            opacity: 1;
            fill: #fff;
            -webkit-transform-origin: 50% 50%;
            transform-origin: 50% 50%;
            -webkit-transform: translateX(0) rotate(0deg);
            transform: translateX(0) rotate(0deg);
            -webkit-transition: all .35s;
            transition: all .35s;
        }

        @-webkit-keyframes animateRing{
            to{
                stroke-dashoffset: 0;
                stroke: #b0aa28;
            }
        }

        @keyframes  animateRing{
            to{
                stroke-dashoffset: 0;
                stroke: #b0aa28;
            }
        }

        @-webkit-keyframes resetRing{
            to{
                stroke-dashoffset: 0;
                stroke: #233043;
            }
        }

        @keyframes  resetRing{
            to{
                stroke-dashoffset: 0;
                stroke: #233043;
            }
        }

        /* Switch 3 Specific Style End */


        /* Switch 4 Specific Style Start */

        .box_4{
            background: #eee;
        }

        .input_wrapper{
            width: 80px;
            height: 40px;
            position: relative;
            cursor: pointer;
        }

        .input_wrapper input[type="checkbox"]{
            width: 80px;
            height: 40px;
            cursor: pointer;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background: #315e7f;
            border-radius: 2px;
            position: relative;
            outline: 0;
            -webkit-transition: all .2s;
            transition: all .2s;
        }

        .input_wrapper input[type="checkbox"]:after{
            position: absolute;
            content: "";
            top: 3px;
            left: 3px;
            width: 34px;
            height: 34px;
            background: #dfeaec;
            z-index: 2;
            border-radius: 2px;
            -webkit-transition: all .35s;
            transition: all .35s;
        }

        .input_wrapper svg{
            position: absolute;
            top: 50%;
            -webkit-transform-origin: 50% 50%;
            transform-origin: 50% 50%;
            fill: #fff;
            -webkit-transition: all .35s;
            transition: all .35s;
            z-index: 1;
        }

        .input_wrapper .is_checked{
            width: 18px;
            left: 18%;
            -webkit-transform: translateX(190%) translateY(-30%) scale(0);
            transform: translateX(190%) translateY(-30%) scale(0);
        }

        .input_wrapper .is_unchecked{
            width: 15px;
            right: 10%;
            -webkit-transform: translateX(0) translateY(-30%) scale(1);
            transform: translateX(0) translateY(-30%) scale(1);
        }

        /* Checked State */
        .input_wrapper input[type="checkbox"]:checked{
            background: #23da87;
        }

        .input_wrapper input[type="checkbox"]:checked:after{
            left: calc(100% - 37px);
        }

        .input_wrapper input[type="checkbox"]:checked + .is_checked{
            -webkit-transform: translateX(0) translateY(-30%) scale(1);
            transform: translateX(0) translateY(-30%) scale(1);
        }

        .input_wrapper input[type="checkbox"]:checked ~ .is_unchecked{
            -webkit-transform: translateX(-190%) translateY(-30%) scale(0);
            transform: translateX(-190%) translateY(-30%) scale(0);
        }

        /* Switch 4 Specific Style End */
        .calendar-day ul {
            padding: 2px;
        }
        .calendar-day ul li {
            list-style-type: none;
            font-size: 12px;
            padding: 10px 6px;
            background: #fefefe;
            margin: 4px auto;
            border: 1px solid #eee;
        }
        .calendar-day ul li a {
            text-decoration: none;
            cursor: pointer;
            font-size: 10px;
        }
        .meal_box {
            background: #eee;
            display: inline-block;
            width: 25px;
            margin: 4px;
            height: 25px;
            text-align: center;
            border-radius: 20px;
            padding-top: 3px;
            box-shadow: 2px 3px 0px #aaa;
            font-weight: 600;
        }
        .kitchen_heading {
            font-size: 60px;
            margin: 0 0 41px 0;
            font-weight: 900;
            text-transform: uppercase;
            text-shadow: 1px 1px 4px {{config('voyager.primary_color')}};
        }
        .month_name {
            font-size: 25px;
            margin: 0 0 41px 0;
            font-weight: 900;
            text-transform: uppercase;
            text-shadow: 1px 1px 4px {{config('voyager.primary_color')}};
            text-align: center;
        }
        h1.title {
            font-family: 'Roboto', sans-serif;
            font-weight: 900;
        }
        .calendar {
            margin: 0px 40px;
        }
        .popover.calendar-event-popover {
            font-family: 'Roboto', sans-serif;
            font-size: 12px;
            color: rgb(120, 120, 120);
            border-radius: 2px;
            max-width: 300px;
        }
        .popover.calendar-event-popover h4 {
            font-size: 14px;
            font-weight: 900;
        }
        .popover.calendar-event-popover .location,
        .popover.calendar-event-popover .datetime {
            font-size: 14px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        .popover.calendar-event-popover .location > span,
        .popover.calendar-event-popover .datetime > span {
            margin-right: 10px;
        }
        .popover.calendar-event-popover .space,
        .popover.calendar-event-popover .attending {
            margin-top: 10px;
            padding-bottom: 5px;
            border-bottom: 1px solid rgb(160, 160, 160);
            font-weight: 700;
        }
        .popover.calendar-event-popover .space > .pull-right,
        .popover.calendar-event-popover .attending > .pull-right {
            font-weight: 400;
        }
        .popover.calendar-event-popover .attending {
            margin-top: 5px;
            font-size: 18px;
            padding: 0px 10px 5px;
        }
        .popover.calendar-event-popover .attending img {
            border-radius: 50%;
            width: 40px;
        }
        .popover.calendar-event-popover .attending span.attending-overflow {
            display: inline-block;
            width: 40px;
            background-color: rgb(200, 200, 200);
            border-radius: 50%;
            padding: 8px 0px 7px;
            text-align: center;
        }
        .popover.calendar-event-popover .attending > .pull-right {
            font-size: 28px;
        }
        .popover.calendar-event-popover a.btn {
            margin-top: 10px;
            width: 100%;
            border-radius: 3px;
        }
        [data-toggle="calendar"] > .row > .calendar-day {
            font-family: 'Roboto', sans-serif;
            width: 14.28571428571429%;
            border: 1px solid rgb(235, 235, 235);
            border-right-width: 0px;
            min-height: 200px;
            margin-bottom: 0;
        }
        [data-toggle="calendar"] > .row:not(:first-child) > .calendar-day {
            border-top-width: 0px;
        }
        [data-toggle="calendar"] > .row > .calendar-day.calendar-no-current-month {
            color: rgb(200, 200, 200);
        }
        [data-toggle="calendar"] > .row > .calendar-day:last-child {
            border-right-width: 1px;
        }

        [data-toggle="calendar"] > .row:last-child > .calendar-day {
            border-bottom-width: 1px;
        }

        .calendar-day > time {
            position: absolute;
            display: block;
            bottom: 0px;
            left: 0px;
            font-size: 12px;
            font-weight: 300;
            width: 100%;
            padding: 10px 10px 3px 0px;
            text-align: right;
        }
        .calendar-day > .events {
            cursor: pointer;
        }
        .events .badge-info {
            font-size: 7px;
            margin-right: 2px;
        }
        .calendar-day > .events > .event h4 {
            font-size: 12px;
            font-weight: 700;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            margin-bottom: 3px;
        }
        .calendar-day > .events > .event > .desc,
        .calendar-day > .events > .event > .location,
        .calendar-day > .events > .event > .datetime,
        .calendar-day > .events > .event > .attending {
            display: none;
        }
        .calendar-day > .events > .event > .progress {
            height: 10px;
        }
        td.calendar-day {
            border: 1px solid #eee !important;
        }
    </style>
@stop


@section('javascript')

    <script>
        var vu = new Vue({
           el: '#meals_calendar',

           data: {
               months_list: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
               date_range: {},
               dates_list: [],
               meals: [],
               currentDate: new Date(),
               year: new Date().getFullYear(),
               kitchen_id: '{{$kitchen->id}}',
               events: [],
               current_meal: [],
               show_modal: false,
               all_ingredient_types: {},
               all_ingredient: {}
           },
            created(){
                this.changeMonth(0);

                $.getJSON('{{route('all_ingredient_types')}}').done(data => {
                    vu.all_ingredient_types = data;
                });

                $.getJSON('{{route('all_ingredients_grouped')}}').done(data => {
                    vu.all_ingredients_grouped = data;
                });
            },
            updated(){
                $('#myModal').on('hide.bs.modal', function () {
                    this.show_modal = false;
                });
            },
            computed: {
                current_cmeals_ids() {
                    let c_ids = [];
                    $.each(vu.current_meal.customers_meals, function(k,v){c_ids.push(v.id);});

                    return c_ids.join('+');
                }
            },
            methods: {
                getCustomerMealLabelUrl(customer_meal_id) {
                    let url = '{{route('customer_meal_label', ':customer_meal_id')}}';
                    url = url.replace(':customer_meal_id', customer_meal_id);

                    return url;
                },
                getCustomerMealDataUrl(customer_meal_id) {
                    let url = '{{route('customer_meal_data', ':customer_meal_id')}}';
                    url = url.replace(':customer_meal_id', customer_meal_id);

                    return url;
                },
                setDateRange() {
                    let firstDay = new Date( this.currentDate.getFullYear(),  this.currentDate.getMonth(), 1);
                    let lastDay = new Date( this.currentDate.getFullYear(),  this.currentDate.getMonth() + 1, 0);

                    this.date_range = {firstDay: this.formattedDateDigit(firstDay.getDate()+""), lastDay: this.formattedDateDigit(lastDay.getDate()+"")};
                    this.setDatesList();
                },
                setDatesList() {
                    this.dates_list = [];
                    for(let i=parseInt(this.date_range.firstDay);i<=parseInt(this.date_range.lastDay);i++) {
                        this.dates_list.push(this.currentDate.getFullYear()+ "-" +(this.formattedDateDigit(this.currentDate.getMonth()+1)) + "-" + this.formattedDateDigit(i));
                    }
                },
                chunkedDates() {
                    let dates_list = this.dates_list;
                    let dates_chunks = [];
                    let chunk = [];
                    let index = 0;
                    while (dates_list[index] != undefined) {
                        chunk = [];
                        for (let i=0; i<=6; i++) {
                            if(dates_list[index] == undefined) {
                                break;
                            }
                            chunk.push(dates_list[index]);
                            index++;
                        }
                        dates_chunks.push(chunk);
                    }
                    if(index == 100) {
                        return false;
                    }
                    return dates_chunks;
                },
                formattedDateDigit(date, digit = 1){
                    let day;
                    if((date+"").indexOf("-") >= 0) {
                        day = date.split("-")[digit];
                    }
                    else {
                        day = date;
                    }
                    let day_str = ("0" + day);
                    return day_str.slice(-2);
                },
                getDay(date){
                    return date.split("-")[2];
                },
                formattedDate(date){
                    let the_date = date.split("-");
                    the_date[1] = this.formattedDateDigit(date, 1);
                    the_date[2] = this.formattedDateDigit(date, 2);
                    return the_date.join("-");
                },
                goToNextMonth() {
                    let now = this.currentDate;
                    let current;
                    if (now.getMonth() == 11) {
                        current = new Date(now.getFullYear() + 1, 0, 1);
                    } else {
                        current = new Date(now.getFullYear(), now.getMonth() + 1, 1);
                    }

                    let date = current.getFullYear()+'-'+(current.getMonth()) + '-' + current.getDate();
                    date = current.getFullYear()+'-'+ this.formattedDateDigit(date) + '-' + current.getDate();
                    this.currentDate = new Date(date.split("-")[0], date.split("-")[1], date.split("-")[2]);
                },
                goToLastMonth() {
                    let now = this.currentDate;
                    let current;
                    if (now.getMonth() == 0) {
                        current = new Date(now.getFullYear() - 1, 11, 1);
                    } else {
                        current = new Date(now.getFullYear(), now.getMonth() - 1, 1);
                    }

                    let date = current.getFullYear()+'-'+(current.getMonth()) + '-' + current.getDate();
                    date = current.getFullYear()+'-'+ this.formattedDateDigit(date) + '-' + current.getDate();
                    this.currentDate = new Date(date.split("-")[0], date.split("-")[1], date.split("-")[2]);
                },
                goToCurrentMonth() {
                    this.currentDate = new Date();
                },
                changeMonth(dir) {
                    if(dir === -1) {
                        this.goToLastMonth();
                    }
                    else if(dir === 1) {
                        this.goToNextMonth();
                    }
                    else {
                        this.goToCurrentMonth();
                    }
                    this.setDateRange();
                    this.refreshMeals();
                },
                refreshMeals() {
                    $('#voyager-loader').show();
                    let start_date = this.currentDate.getFullYear() + '-' + this.formattedDateDigit(this.currentDate.getMonth()+1, 2) + '-' + this.date_range.firstDay;
                    let end_date = this.currentDate.getFullYear() + '-' + this.formattedDateDigit(this.currentDate.getMonth()+1, 2) + '-' + this.date_range.lastDay;

                    let url = '{{route('duration_meals', [':kitchen_id', ':start_date', ':end_date'])}}';
                    url = url.replace(':kitchen_id', this.kitchen_id).replace(':start_date', start_date).replace(':end_date', end_date);
                    $.getJSON(url).done(response => {
                        this.meals = response;
                    });
                    $('#voyager-loader').hide();
                },
                view_meals(week_meal) {
                    this.show_modal = true;
                    this.current_meal = week_meal;
                },
                prepareMeal(customer_meal_id, index) {
                    let prepared = this.current_meal.customers_meals[index].cooked == 0 ? 1 : 0;
                    let prepared_string = prepared == 1 ? 'Prepared' : 'Unprepared';
                    $.post('{{route('prepare_meal')}}', {customer_meal_id, prepared}).done(data => {
                       toastr.success("Meal marked as "+prepared_string+" Successfully");
                    });
                },
                bulkPrepareMeal() {
                    let cm_ids = this.current_cmeals_ids;
                    $.post('{{route('bulk_prepare_meal')}}', {cm_ids}).done(data => {
                        toastr.success("Meals marked as prepared Successfully");
                        for(let i=0; i<vu.current_meal.customers_meals.length; i++) {
                            vu.current_meal.customers_meals[i].cooked = 1;
                        }
                    });
                },
                preparedMeals(customers_meals) {
                    return customers_meals.filter(customer_meal => customer_meal.cooked == 1).length;
                },
                all_prepared(customers_meals) {
                    let unprepared = customers_meals.filter(meal => meal.cooked == 0);
                    if(unprepared.length > 0) {
                        return false;
                    }

                    return true;
                },
                get_edit_customer_url(customer) {
                    let url = '{{route('voyager.customers.edit', ':customer')}}';
                    url = url.replace(':customer', customer);

                    return url;
                },
                filtered_custom_amounts(custom_amounts_list, meal_type_id) {
                    return custom_amounts_list.filter(item => item.pivot.meal_type_id == meal_type_id);
                },
                readableIngredientsText(notes) {

                    let text = '';
                    if(notes.length == 0) return 'N/A';
                    notes = JSON.parse(notes);
                    if(notes == undefined) return 'N/A';
                    notes.forEach((v, i) => {
                        text+= v.amount + ' gm of ' + this.all_ingredient_types[v.ingredient_type_id].name+(i+1 == notes.length ? '' : ' + ');
                    });

                    return text;
                }
            }
        });


        @if(env('APP_ENV') == 'local')
        // Before you create app
        Vue.config.devtools = true;

        // After you create app
        window.__VUE_DEVTOOLS_GLOBAL_HOOK__.Vue = vu.constructor;

        @endif
    </script>
@stop
