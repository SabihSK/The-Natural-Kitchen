@extends('voyager::master')

@section('page_title', 'Customers Meals')


@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div id="customers_meals" class="row">

            <div class="col-md-12">


                <div class="card">
                    <div class="card-body">
                        <select class="form-control" v-model="selected" id="week_dropdown" @change="weekchanged">
                            <option v-for="(week, index) in weeks" :value="week.id">@{{ reformattedWeekName(week) }}
                            </option>
                        </select>
                    </div>
                    <div class="col-md-12" v-if="week_meals_count > 0 && page_loaded">

                        {{--<input type="text" class="form-control search_customers" placeholder="Search Customers">--}}
                        <div v-if="customers_meals_complete()" class="alert alert-success alert-dark" role="alert">
                            <h3 class="text-center text-success">Great! All Customers now have assigned Meals</h3>
                            <div class="text-center">
                                <button @click="publish_week_meals" :disabled="resetDisabled"
                                        class="btn btn-success btn-dark generate_meals_btn" type="button"
                                        data-toggle="modal"><span class="icon voyager-bolt"></span> @{{ generate_string
                                    }}
                                </button>
                            </div>
                        </div>

                        <div v-else>
                            <div class="col-md-12">
                                <div class="alert alert-danger alert-dark" role="alert">
                                    <h3 class="text-center text-danger">Some customers do not have assigned meals,
                                        please click any customer to view more details.</h3>
                                    <div class="text-center">
                                        <button @click="publish_week_meals" :disabled="resetDisabled"
                                                class="btn btn-danger btn-dark generate_meals_btn" type="button"
                                                data-toggle="modal"><span class="icon voyager-bolt"></span> @{{
                                            generate_string }}
                                        </button>
                                        <br><br>
                                        <div class="alert alert-info" style="margin-bottom: 4px;">
                                            Please note that Meal Types that marked as <strong>Extra Meal Type</strong>
                                            are not auto assigned/generated and you will have to pick them manually for
                                            the desired customers.
                                            <br>
                                            Extra Meal Types also do not affect the status of having complete meals list
                                            for customers
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <transition name="fade">
                            <div id="detailsTable" class="table-responsive col-md-12" v-show="showTable">
                                <table class="table table-hover table-bordered table-condensed table-striped"
                                       v-if="customer_meals.customer != undefined">
                                    <tbody>
                                    <tr>
                                        <td>Name</td>
                                        <td><a :href="get_edit_customer_url(customer_meals.customer.id)"
                                               target="_blank" style="text-decoration: none">@{{
                                                customer_meals.customer.fullname }}</a> <div class="label label-info">@{{ customer_meals.customer.plan.name }}</div></td>
                                    </tr>
                                    <tr>
                                        <td>Daily Consumable Calories</td>
                                        <td v-if="customer_meals.customer.consider_calories == 1">@{{
                                            customer_meals.customer.dailyCalories }}
                                        </td>
                                        <td v-else>No Restriction</td>
                                    </tr>
                                    <tr v-show="customer_meals.customer.consider_calories == 1"
                                        v-for="(mt, mt_id) in customer_meals.customer.meals_calories"
                                        v-if="hasMealType(mt_id)">
                                        <td>@{{ mt.name }} Consumable Calories</td>
                                        <td>@{{ mt.calories }}</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table class="table table-hover table-bordered table-condensed table-striped">
                                    <thead>
                                        <tr>
                                            <th colspan="2" class="text-center">Allergies</th>
                                        </tr>
                                    <tr>
                                        <th>Ingredient Types</th>
                                        <th>Ingredients</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-if="customer_meals.customer != undefined && (customer_meals.customer.allergic_ingredient_types.length > 0 || customer_meals.customer.allergic_ingredients.length > 0)">
                                       <td>
                                           <div v-if="customer_meals.customer.allergic_ingredient_types.length > 0">
                                            <div class="label label-info" v-for="ingType in customer_meals.customer.allergic_ingredient_types" style="margin-left: 5px">@{{ ingType.name }}</div>
                                           </div>
                                           <div v-else>--</div>
                                       </td>
                                       <td>
                                           <div v-if="customer_meals.customer.allergic_ingredients.length > 0">
                                               <div class="label label-info" v-for="ing in customer_meals.customer.allergic_ingredients" style="margin-left: 5px">@{{ ing.name }}</div>
                                           </div>
                                           <div v-else>--</div>
                                       </td>
                                    </tr>
                                    <tr v-else>
                                        <td colspan="2" class="text-center">
                                            No Allergies
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th v-for="(meal_type, index) in meal_types" v-if="hasMealType(meal_type.id)">
                                            @{{ meal_type.name }}
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>


                                    <tr v-for="(c_meal, index) in customer_meals.meals" v-if="hasDay(index)">
                                        <td>@{{ index }}</td>
                                        <td v-for="meal_type in meal_types" v-if="hasMealType(meal_type.id)">
                                            <div v-if="c_meal[meal_type.id].name != undefined">
                                                <div class="btn-group">
                                                    <a target="_blank" :href="get_meal_url(c_meal[meal_type.id].id)"
                                                       type="button" class="btn btn-default">@{{
                                                        c_meal[meal_type.id].name }}</a>
                                                    <a v-if="c_meal[meal_type.id].custom == 0" href="javascript:;"
                                                       type="button" class="btn btn-primary"
                                                       @click="mealModal(c_meal[meal_type.id].customer_meal_id, c_meal[meal_type.id].id, meal_type.id, index)">
                                                        <i class="glyphicon glyphicon-cog"></i>
                                                    </a>
                                                    <button v-else type="button"
                                                            class="btn btn-lg btn-primary custom_meal_btn"
                                                            data-trigger="focus" data-placement="left"
                                                            data-toggle="popover" title="Recipes"
                                                            :data-content="readableIngredientsText(c_meal[meal_type.id].notes)">
                                                        <i class="glyphicon glyphicon-exclamation-sign"></i>
                                                    </button>
                                                    <a href="javascript:;"
                                                       @click="deleteCustomerMeal(c_meal[meal_type.id].customer_meal_id, index, meal_type.id)"
                                                       type="button" class="btn btn-danger"><i
                                                            class="glyphicon glyphicon-remove"></i></a>
                                                </div>
                                                <span :ref="'cmeal_' + customer_meal.id"
                                                      v-if="meal_total_calories(c_meal[meal_type.id])"
                                                      {{--                                                          class="label label-default calories">@{{  float(c_meal[meal_type.id].customer_meal_total_calories) }} Cal</span>--}}
                                                      class="label label-default calories">@{{  meal_total_calories(c_meal[meal_type.id]) }} Cal</span>
                                            </div>
                                            <div v-else>
                                                <button class="btn btn-dark" @click="newMealModal(meal_type.id, index)">
                                                    Pickup Meal Manually
                                                </button>
                                                <div v-if="customer_meals['missing_meals'][index] != undefined && meal_type['extra'] == 0">
                                                    <span class="glyphicon glyphicon-info-sign text-warning">&nbsp;</span><span class="text-warning" v-html="customer_meals['missing_meals'][index][meal_type.id]"></span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td :colspan="meal_types.length + 1" style="text-align: left">
                                            <button class="btn btn-info btn-lg"
                                                    @click="generateCustomerMeals(customer_meals.customer.id, selected)">
                                                <h3 style="margin: 10px 0 10px 0">
                                                    Re-Generate Meals
                                                </h3>
                                            </button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                                <br>
                            </div>
                        </transition>

                        <div class="form-group col-md-12">
                            <input type="text" class="form-control input-lg" v-model="search_value"
                                   placeholder="Search Customers..">
                        </div>
                        <div class="form-group col-md-12">
                            <label class="container">Show only customers with missing meals (@{{
                                customers.customers_missing_meals_ids.length }} customers)
                                <input type="checkbox" class="form-control input-lg" v-model="show_missing_only">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div v-for="(customer, index) in customers['data']" class="col-lg-3 col-md-4 col-sm-4 col-xs-6"
                             v-show="search_value.trim() == '' || customers_arr[index].toLowerCase().indexOf(search_value.toLowerCase().trim()) > -1"
                             v-if="!show_missing_only || (show_missing_only && !customer[0].meals_complete)">
                            <a href="javascript:;" style="width: 100%"
                               @click="show_customer_meals(index)"
                               :class="['btn customer-btn', (customer[0].meals_complete ? 'btn-lightsuccess' : 'btn-lightwarning')]">@{{
                                customers_arr[index] }}</a>
                        </div>

                    </div>
                    <div v-else v-show="page_loaded" class="alert alert-warning alert-dark" role="alert">
                        <h3 class="text-center text-warning">This Week does not have associated Meals, please click <a
                                target="_blank" :href="week_url">Here</a> to update this week's meals</h3>
                    </div>


                    <!-- Modal -->
                    <div class="modal fade " id="customerModal" tabindex="-1" role="dialog"
                         aria-labelledby="customerModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    {{--<h5 class="modal-title" id="customerModalLabel">@{{ customer_meals.customer.fullname }} Week Meals</h5>--}}
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" v-if="customer_meal.week_meals != undefined">
                                    <div v-show="!calories_valid()" class="alert alert-warning">The total calories for
                                        this meal must be between @{{ calories_valid(true) }} calories
                                    </div>

                                    <div class="form-group">
                                        <select v-if="meals_list.length > 0" class="form-control"
                                                @change="customer_meal_changed" v-model="temp_selected_meal_id">
                                            <option v-for="ameal in meals_list" :value="ameal.id"
                                                    :selected="temp_selected_meal_id == ameal.id">@{{ ameal.name }}
                                            </option>
                                        </select>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th colspan="2">Additional Ingredients</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr v-for="ing in temp_selected_meal.additional_ingredients">
                                                <td>@{{ ing.name }}<br>
                                                    <small style="color: #ddd"><b>@{{ ing.calories }} cal/100gm</b>
                                                    </small>
                                                </td>
                                                <td>
                                                    <template>
                                                        <label class="sr-only" for="exampleInputAmount">Amount (in
                                                            grams)</label>
                                                        <div class="input-group">
                                                            <input type="number" min="0" class="form-control"
                                                                   id="exampleInputAmount" placeholder="Amount"
                                                                   v-model.number="ing.pivot.amount">
                                                            <div class="input-group-addon">gm</div>
                                                        </div>
                                                    </template>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <hr>
                                    <h3>Total Calories <span :ref="'cmeal_' + customer_meal.id"
                                                             :class="['label', calories_valid() ? 'label-success' : 'label-danger']">@{{ meal_total_calories() }}</span>
                                    </h3>
                                    <a href="javascript:;" @click="save_additionals" class="btn btn-default dtn-dark">Save</a>
                                    <div class="clearfix"></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Single delete modal --}}

@stop

@section('css')

    <style>
        a {
            text-decoration: none !important;
        }

        .calories {
            float: right;
            /*font-weight: 900;*/
            /*padding-top: 14px;*/
        }

        #week_dropdown {
            background: {{config('voyager.primary_color')}};
            color: #fff;
            font-weight: 900;
        }

        .customer-btn {
            margin: 10px;
            font-size: 16px;
            border-radius: 0 !important;
            white-space: normal;
        }

        .fade-enter-active, .fade-leave-active {
            transition: opacity .5s;
        }

        .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */
        {
            opacity: 0;
        }

        .generate_meals_btn {
            font-size: 30px !important;
            color: #fff !important;
        }

        .overlay {
            position: absolute;
            background: rgba(255, 255, 255, 0.88);
            width: 100%;
            height: 100%;
            z-index: 99999;
        }

        .overlay h1 {
            text-align: center;
            width: 100%;
            height: 100%;
            padding-top: 10%;
            font-size: 130px;
        }

        .alert-dark {
            background-color: #263039 !important;
        }

        .btn-dark {
            background-color: #262d31 !important;
            border: 1px solid #7b737f !important;
        }

        .btn-lightwarning {
            color: {{config('voyager.primary_color')}};
            border: 2px solid #f96868;
            background-color: #eee;
        }

        .btn-lightsuccess {
            color: {{config('voyager.primary_color')}};
            border: 2px solid #2ecc71;
            background-color: #eee;
        }

        .btn-lightsuccess:hover {
            background-color: #00d166;
            color: #fff !important;
        }

        .btn-lightwarning:hover {
            background-color: #ff5b62;
            color: #fff !important;
        }

        .search_customers {
            margin: 20px 0;
            font-size: 31px;
            height: 50px;
            color: #777;
            padding: 12px;
            font-weight: 100;
        }

        .search_customers::placeholder {
            color: #aaa;
        }

        /* Customize the label (the container) */
        .container {
            display: block;
            position: relative;
            padding-left: 35px;
            margin-bottom: 12px;
            cursor: pointer;
            font-size: 22px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            margin-left: 0;
        }

        /* Hide the browser's default checkbox */
        .container input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
            height: 0;
            width: 0;
        }

        /* Create a custom checkbox */
        .checkmark {
            position: absolute;
            top: 0;
            left: 0;
            height: 25px;
            width: 25px;
            background-color: #eee;
        }

        /* On mouse-over, add a grey background color */
        .container:hover input ~ .checkmark {
            background-color: #ccc;
        }

        /* When the checkbox is checked, add a blue background */
        .container input:checked ~ .checkmark {
            background-color: #2196F3;
        }

        /* Create the checkmark/indicator (hidden when not checked) */
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }

        /* Show the checkmark when checked */
        .container input:checked ~ .checkmark:after {
            display: block;
        }

        /* Style the checkmark/indicator */
        .container .checkmark:after {
            left: 9px;
            top: 5px;
            width: 5px;
            height: 10px;
            border: solid white;
            border-width: 0 3px 3px 0;
            -webkit-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            transform: rotate(45deg);
        }
    </style>
@stop

@section('javascript')


    <script>
        const vu = new Vue({
            el: "#customers_meals",
            data: {
                weeks: [],
                customers: [],
                customers_arr: [],
                selected: '',
                meal_types: [],
                meals_list: [],
                customer_meals: [],
                customer_meal: [],
                resetDisabled: false,
                showTable: false,
                week_meals_count: 0,
                week_edit_url: '{{route('voyager.weeks.edit', 'week_id')}}',
                generate_string: 'Generate / Reset Customers Meals',
                page_loaded: false,
                temp_selected_meal_id: 0,
                temp_selected_meal: {},
                current_customer_meal_id: 0,
                current_customer_id: 0,
                all_ingredient_types: {},
                search_value: '',
                show_missing_only: 0
            },
            beforeCreate() {
                $('#voyager-loader').show();
                $.getJSON('{{route('all_meals_types')}}').done(data => {
                    this.meal_types = data;
                });


            },
            created() {
                $('#voyager-loader').show();
                $.getJSON('{{route('all_weeks')}}').done(data => {
                    this.weeks = data;
                    this.selected = this.weeks[0].id;

                    this.weekchanged();
                });


                $.getJSON('{{route('customers_simple_format')}}').done(data => {
                    vu.customers_arr = data;
                });

                $.getJSON('{{route('all_ingredient_types')}}').done(data => {
                    vu.all_ingredient_types = data;
                });


                $('#voyager-loader').hide();


            },
            mounted() {

                $('#customerModal').on('hidden.bs.modal', function () {
                    vu.temp_selected_meal = {};
                });
            },
            computed: {
                week_url() {
                    return this.week_edit_url.replace('week_id', this.selected);
                }
            },
            watch: {
                showTable(newV, oldV) {
                    if (newV) {
                        $('html,body').animate({
                            scrollTop: $("#detailsTable").offset().top
                        }, 'slow');

                        $('button.custom_meal_btn').popover();
                    }
                }
            },
            updated() {
                $('button.custom_meal_btn').popover();
            },
            methods: {
                meal_total_calories(cmeal = undefined) {
                    // console.log("calculating meal total calories for cmeal#: " + cmeal.id);

                    if (this.temp_selected_meal != undefined && Object.keys(this.temp_selected_meal).length > 0) {
                        let current_calories = this.temp_selected_meal.total_calories;
                        let additional_calories = 0;
                        this.temp_selected_meal.additional_ingredients.forEach(function (add_ingred) {
                            additional_calories += add_ingred.pivot.amount * add_ingred.calories / 100;
                        });

                        return Math.round(additional_calories + current_calories);
                    } else if (cmeal != undefined) {
                        let current_calories = cmeal.total_calories;
                        let additional_calories = 0;
                        cmeal.additional_ingredients.forEach(function (add_ingred) {
                            additional_calories += add_ingred.pivot.amount * add_ingred.calories / 100;
                        });

                        if (this.temp_selected_meal != {}) {
                            // this.temp_selected_meal = {};
                        }
                        return Math.round(additional_calories + current_calories);

                    }

                    return false;
                },
                customers_meals_complete() {
                    if (this.customers['customers_missing_meals_ids'] == undefined) {
                        return false;
                    }
                    return this.customers['customers_missing_meals_ids'].length === 0;
                },
                weekchanged() {
                    this.showTable = false;
                    this.get_week_meals_count(this.selected);

                    this.get_customers_with_missing_meals(this.selected);
                },
                reformattedWeekName(week_obj) {
                    let sd = new Date(week_obj.startdate);
                    let ed = new Date(week_obj.enddate);
                    sd = sd.getDate() + '/' + (sd.getMonth() + 1) + '/' + sd.getFullYear();
                    ed = ed.getDate() + '/' + (ed.getMonth() + 1) + '/' + ed.getFullYear();

                    return week_obj.name + ' <<  ' + sd + ' ~ ' + ed + ' >>';
                },
                publish_week_meals() {
                    let customers_ids = this.customers['customers_missing_meals_ids'];
                    let str = 'This will reset all meals for customers with missing meals\n Are you sure you want to continue ?';
                    if (customers_ids.length == 0) {
                        str = 'This will reset all customers\' meals \n Are you sure ?\n Please not this will take some time.';
                    }
                    if (confirm(str)) {
                        this.resetDisabled = true;
                        this.showTable = false;
                        this.generate_string = 'Generating...! Please wait';
                        let url = '{{ route("set_customers_meals", ":week_id") }}';
                        url = url.replace(':week_id', this.selected);
                        if (customers_ids.length == 0) {
                            customers_ids = Object.keys(this.customers_arr);
                        }
                        $('#voyager-loader').show();
                        $.ajax({
                            url: url,
                            data: {week_id: vu.selected, customers_ids},
                            method: 'POST',
                            success: function (data) {
                                vu.customers = data;
                                vu.resetDisabled = false;
                                vu.generate_string = 'Generate Customers Meals';
                                $('#voyager-loader').hide();
                            }
                        });
                    }
                },
                {{--fetch_week_meals(week_id) {--}}
                    {{--let url = '{{ route("get_missing_customer_meals", ":week_id") }}';--}}
                    {{--url = url.replace(':week_id', week_id);--}}

                    {{--$.ajax({--}}
                    {{--url: url,--}}
                    {{--method: 'GET',--}}
                    {{--success: function (data) {--}}
                    {{--vu.get_customers_with_missing_meals(week_id);--}}
                    {{--}--}}
                    {{--});--}}
                    {{--},--}}
                get_customers_with_missing_meals(week_id) {
                    let url = '{{route('get_missing_customer_meals', ':week_id')}}';
                    url = url.replace(':week_id', week_id);
                    this.page_loaded = false;
                    $.getJSON(url).done(data => {
                        vu.customers = data;
                        vu.page_loaded = true;
                    });

                },
                get_edit_customer_url(customer) {
                    let url = '{{route('voyager.customers.edit', ':customer')}}';
                    url = url.replace(':customer', customer);

                    return url;
                },
                show_customer_meals(customer_id) {
                    this.current_customer_id = customer_id;
                    this.showTable = false;
                    let url = '{{route('get_customer_week_meals', [':customer_id', ':week_id'])}}';
                    url = url.replace(':week_id', this.selected);
                    url = url.replace(':customer_id', customer_id);


                    $.getJSON(url).done(data => {
                        vu.customer_meals = data;
                        //$('#customerModal').modal('show');
                        vu.showTable = true;
                    });

                },
                get_week_meals_count(week_id) {
                    let current_week = this.weeks.filter(week => week.id == week_id)[0];
                    this.week_meals_count = current_week.meals_count;
                    return this.week_meals_count;
                },
                get_meal_url(meal_id) {
                    let url = '{{route('voyager.meals.edit', ':meal')}}';
                    url = url.replace(':meal', meal_id);

                    return url;
                },
                mealModal(customer_meal_id, meal_id, meal_type_id, day) {
                    let url = '{{route('customer_meal_ingredients', 'cmeal')}}';
                    url = url.replace('cmeal', customer_meal_id);
                    this.current_customer_meal_id = customer_meal_id;

                    $.getJSON(url).done(data => {
                        vu.customer_meal = data;
                        vu.temp_selected_meal_id = vu.customer_meal.week_meals.meal.id;

                        let url_ = '{{ route("get_week_day_meals_by_meal_type", [":week_id", ":day", ":meal_type_id"]) }}';

                        url_ = url_.replace(':week_id', this.selected);
                        url_ = url_.replace(':day', vu.reformatted_date(day));
                        url_ = url_.replace(':meal_type_id', meal_type_id);
                        $.getJSON(url_).done(function (data) {
                            vu.meals_list = data;

                        });


                        vu.set_meal_ingredients(meal_type_id, day, false);


                        $('#customerModal').modal('show');


                    });

                },
                newMealModal(meal_type_id, day) {
                    let week_id = this.selected;

                    let url = '{{route('meal_type_day_meals', [":week_id", ":date", ":meal_type_id"])}}';
                    url = url.replace(':meal_type_id', meal_type_id);
                    url = url.replace(':week_id', week_id);
                    url = url.replace(':date', this.reformatted_date(day));

                    $.getJSON(url).done(data => {
                        vu.meals_list = data;
                        vu.set_meal_ingredients(meal_type_id, day, true, true);
                        $('#customerModal').modal('show');
                    });
                },
                set_meal_ingredients(meal_type_id, day, changed = false, init = false) {
                    if (changed === false) {
                        let meal = vu.customer_meals.meals[day][meal_type_id];
                        let add_ing_temp = meal.additional_ingredients;

                        let new_add_ings = [];
                        let meal_ings = meal.ingredients;

                        for (let i = 0; i < meal_ings.length; i++) {
                            var add_ing = add_ing_temp.filter(ing => ing.id == meal_ings[i].id);
                            if (add_ing[0] != undefined) {
                                new_add_ings.push({
                                    id: add_ing[0].id,
                                    name: add_ing[0].name,
                                    calories: add_ing[0].calories,
                                    pivot: {amount: add_ing[0].pivot.amount, ingredient_id: add_ing[0].id}
                                });
                            } else {
                                new_add_ings.push({
                                    id: meal_ings[i].id,
                                    name: meal_ings[i].name,
                                    calories: meal_ings[i].calories,
                                    pivot: {amount: 0, ingredient_id: meal_ings[i].id}
                                });
                            }
                        }
                        vu.temp_selected_meal = meal;
                        vu.temp_selected_meal.additional_ingredients = new_add_ings;
                    } else {
                        /*Changed => true */
                        let current_meal = init === true ? vu.meals_list[0] : vu.meals_list.filter(meal => meal.id == vu.temp_selected_meal_id)[0];
                        let add_ing_temp = [];

                        let new_add_ings = [];
                        let meal_ings = current_meal.ingredients;

                        for (let i = 0; i < meal_ings.length; i++) {
                            var add_ing = add_ing_temp.filter(ing => ing.id == meal_ings[i].id);
                            if (add_ing[0] != undefined) {
                                new_add_ings.push({
                                    id: add_ing[0].id,
                                    name: add_ing[0].name,
                                    calories: add_ing[0].calories,
                                    pivot: {amount: add_ing[0].pivot.amount, ingredient_id: add_ing[0].id}
                                });
                            } else {
                                new_add_ings.push({
                                    id: meal_ings[i].id,
                                    name: meal_ings[i].name,
                                    calories: meal_ings[i].calories,
                                    pivot: {amount: 0, ingredient_id: meal_ings[i].id}
                                });
                            }
                        }
                        vu.temp_selected_meal = current_meal;
                        vu.temp_selected_meal_id = current_meal.id;
                        vu.temp_selected_meal.additional_ingredients = new_add_ings;
                        vu.customer_meal = current_meal;
                    }

                },
                reformatted_date(date) {
                    return date.split("-").reverse().join("-");
                },
                save_additionals() {


                    let week_meal_id = 0;
                    if (this.temp_selected_meal.week_meals[0] != undefined) {
                        week_meal_id = this.temp_selected_meal.week_meals[0].id;
                    } else {
                        week_meal_id = this.temp_selected_meal.week_meals.id;
                    }
                    let add_ing = this.temp_selected_meal.additional_ingredients;
                    let total_calories = this.meal_total_calories();
                    let customer_meal_id = this.current_customer_meal_id;
                    let customer_id = this.customer_meals.customer.id;

                    $.post('{{route('save_additional_ingredients')}}', {
                        week_meal_id,
                        add_ing,
                        total_calories,
                        customer_meal_id,
                        customer_id
                    }, function (data) {
                        if (data.status == 1) {
                            let meal_date = vu.get_customer_meal_week_meal().date;
                            meal_date = vu.reformatted_date(meal_date);
                            let new_customer_meal = data.customer_meal;
                            new_customer_meal.customer_meal_total_calories = data.customer_meal.customer_meal_total_calories;
                            vu.customer_meals['meals'][meal_date][vu.get_customer_meal_week_meal().meal_type_id] = new_customer_meal;

                            vu.current_customer_meal_id = 0;
                            $('#customerModal').modal('hide');
                            if (data.complete_meals === true) {
                                vu.customers['data'][data.customer_meal.customer_id][0].meals_complete = true;
                                let result = vu.customers['customers_missing_meals_ids'].filter(id => id != data.customer_meal.customer_id);
                                vu.customers.customers_missing_meals_ids = result;
                                vu.showTable = false;
                            }

                            vu.customer_meal = [];
                            toastr.success("Customer meal updated successfully!");
                        } else {
                            toastr.error("Error updating customer meal");
                        }
                    });
                },
                get_customer_meal_week_meal() {
                    return this.customer_meal.week_meals.length > 0 ? this.customer_meal.week_meals[0] : this.customer_meal.week_meals;
                },
                calories_valid(range_string) {
                    /*TODO: Calories range must be between (90% of TOTAL_CALORIES ~ 110% of TOTAL CALORIES)*/
                    if (this.customer_meal != undefined && this.customer_meals != undefined) {
                        let week_meal_type = this.get_customer_meal_week_meal().meal_type_id;
                        let available_cals = this.customer_meals.customer.meals_calories[week_meal_type].calories;
                        let calories_tolerance = "{{ intval(setting('calories.tolerance', 200)) }}";

                        if (range_string != undefined) {
                            return '( ' + parseInt(parseInt(available_cals) - parseInt(calories_tolerance)) + ' ~ ' + parseInt(parseInt(available_cals) + parseInt(calories_tolerance)) + ' )';
                        } else {
                            return Math.abs(this.meal_total_calories() - available_cals) < calories_tolerance;
                        }
                    }
                },
                customer_meal_changed() {
                    let current_week = vu.weeks.filter(week => week.id == vu.selected)[0];
                    let day = this.get_customer_meal_week_meal().date;
                    let new_meal = vu.meals_list.filter(meal => meal.id == vu.temp_selected_meal_id);

                    if (new_meal.length > 0) {
                        let new_meal_type_id = new_meal[0].meal_type_id;
                        this.set_meal_ingredients(new_meal_type_id, day, true);
                    }
                },
                deleteCustomerMeal(cmid, date, meal_type_id) {
                    if (confirm('This will delete that customer\'s meal \n Are you sure ?')) {
                        let url = '{{route('delete_customer_meal', 'cmid')}}';
                        url = url.replace('cmid', cmid);
                        $.ajax({
                            url,
                            type: 'DELETE',
                            data: {cmid},
                            success: function (result) {
                                if (result == 1) {
                                    vu.customer_meals.meals[date][meal_type_id] = [];
                                    if (vu.customers.customers_missing_meals_ids.indexOf(vu.current_customer_id) < 0) {
                                        vu.customers.customers_missing_meals_ids.push(vu.current_customer_id);
                                    }
                                    toastr.success('Customer Meal deleted successfully!');
                                } else {
                                    toastr.error('Error deleting Customer Meal!');
                                }
                            }
                        });
                    }
                },
                readableIngredientsText(notes) {

                    let text = '';
                    notes = JSON.parse(notes);

                    if (notes === null) return '';

                    notes.forEach((v, i) => {
                        text += v.amount + ' gm of ' + this.all_ingredient_types[v.ingredient_type_id].name + (i + 1 == notes.length ? '' : ' + ');
                    });

                    return text;
                },
                hasMealType(meal_type_id) {
                    if (this.customer_meals.customer == undefined) {
                        return true;
                    }
                    if (this.customer_meals.customer.mealTypes.length == 0) {
                        return true;
                    }

                    return this.customer_meals.customer.meal_types.filter(mt => mt.id == meal_type_id).length > 0
                        || this.customer_meals.customer.meal_types.length == this.meal_types.length
                },
                generateCustomerMeals(customer_id, week_id) {
                    this.resetDisabled = true;
                    this.showTable = false;
                    this.generate_string = 'Generating meals for ' + this.customer_meals.customer.fullname + '...! Please wait';
                    let url = '{{ route("set_customers_meals", ":week_id") }}';
                    url = url.replace(':week_id', week_id);
                    let customers_ids = [customer_id];
                    $('#voyager-loader').show();
                    $.ajax({
                        url: url,
                        data: {week_id, customers_ids},
                        method: 'POST',
                        success: function (data) {
                            vu.customers = data;
                            vu.resetDisabled = false;
                            vu.generate_string = 'Generate Customers Meals';
                            $('#voyager-loader').hide();
                        }
                    });
                },
                getDayNum(date) {
                    return new Date(this.reformatted_date(date)).getDay();
                },
                hasDay(date) {
                    let day_num = this.getDayNum(date);
                    let formatted_date = date.split('-').reverse().join('-');
                    if (this.customer_meals.customer != undefined) {

                        let customer_days = JSON.parse(this.customer_meals.customer.excluded_days);
                        // console.log('customer_days => ', customer_days);
                        let paused_days = this.customer_meals.customer.paused_days;
                        // console.log('paused_days => ', paused_days);
                        let paused_day_exists = paused_days.length == 0 ? false : paused_days.findIndex(c_d => c_d['date'] == formatted_date) > -1;
                        // console.log('date => ' + formatted_date + (paused_day_exists ? ' --------> yessssssss' : ' ---------> noooooooooo'));

                        if (this.customer_meals.customer.excluded_days == null && !paused_day_exists) {
                            // console.log('this.customer_meals.customer.excluded_days == null && !paused_day_exists');
                            return true;
                        }

                        if (customer_days.length == 0 && paused_days.length == 0) {
                            // console.log('customer_days.length == 0 && paused_days.length == 0');
                            return true;
                        }
                        let excluded_day_exists = customer_days.length == 0 ? false : (customer_days.length > 0 ? customer_days.indexOf(day_num + "") > -1 : false);
                        // console.log('day_num => ' + day_num + (excluded_day_exists ? ' --------> yessssssss' : ' ---------> noooooooooo'));

                        console.log('excluded_day_exists ====> ', (excluded_day_exists ? 'TRUE' : 'FALSE'));
                        console.log('paused_day_exists ====> ', (paused_day_exists ? 'TRUE' : 'FALSE'));
                        console.log("FOR DAY: " + formatted_date + ((!excluded_day_exists && !paused_day_exists) ? "DAY AVAILABLE" : "DAY NOOOOT AVAILABLE"));
                        return !excluded_day_exists && !paused_day_exists;
                    }
                },
                float(val) {
                    return parseFloat(Math.round(val * 100) / 100).toFixed(2);
                }
            }

        });

        @if(env('APP_ENV') == 'local')
        // Before you create app
        Vue.config.devtools = true;

        // After you create app
        //window.__VUE_DEVTOOLS_GLOBAL_HOOK__.Vue = vu.constructor;

        @endif
    </script>
@stop
