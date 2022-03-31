<div class="row">
    <div class="col-md-12 text-center">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="font-size: 34px;width: 100%;padding: 30px;box-shadow: 0px 0px 80px inset rgba(0, 0, 0, .25 );border-radius: 84px;">
            View Today's Meals List
        </button>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width: 70%;min-width: 1200px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Today's Customers Meals</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="form-group">
                        <label for="#date" class="col-md-2">Date</label>
                        <div class="input-group date" data-provide="datepicker">
                            <input id="date" class="datepicker" data-date-format="DD/MM/YYYY" :value="date" @change="fetchMeals">
                            <a href="{{route('customers_meals_report', ['date' => date('Y-m-d')])}}" id="printReportBtn" target="_blank" class="btn btn-info">Print</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table id="reportTable" class="table table-hover table-bordered table-condensed table-striped">
                            <thead>
                            <tr>
                                <th>Customer Name</th>
                                <th v-for="meal_type in all_meal_types">@{{ meal_type.name }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(customer_meals_arr, customer_id) in customers_meals">
                                <td><a style="text-decoration: none" :href="get_edit_customer_url(customer_meals_arr[0].customer.id)">@{{ customer_meals_arr[0].customer.fullname }}</a> <div class="badge badge-info">@{{ customer_meals_arr[0].customer.plan.name }}</div></td>
                                <td v-for="meal_type in all_meal_types" :style="[(!customer_has_meal_type(customer_id, meal_type.id) ? {background: '#ddd'} : {})]">
                                    <span v-html="get_customer_meal_name(customer_id, meal_type.id)"></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


@section('javascript')
<script>
    let vu = new Vue({
        el: '#reportTable',
        data: {
            customers_meals: [],
            all_meal_types: [],
            date: '{{\Carbon\Carbon::today()->format('d/m/Y')}}'
        },
        created() {
            $("#date").val(this.date);

            $("#date").on("dp.change", function(e) {
                vu.date = vu.reformattedDate($("#date").val());
            });
        },
        methods: {
            fetchMeals(){
                console.log('Fetching meals for: ', this.date);

                let url = '{{route('customers_meals_list', ':date')}}';
                url = url.replace(':date', this.date);

                $.getJSON(url).done(response => {
                    vu.customers_meals = response;
                });

                $.getJSON('{{route('all_meal_types_only')}}').done(response => {
                    vu.all_meal_types = response;
                });
            },
            get_edit_customer_url(customer) {
                let url = '{{route('voyager.customers.edit', ':customer')}}';
                url = url.replace(':customer', customer);

                return url;
            },
            get_customer_meal_name(customer_id, meal_type_id) {
                let index = this.customers_meals[customer_id].findIndex(cm => cm.week_meals.meal_type_id == meal_type_id);
                let exists = index >= 0;

                if(exists) {
                    return this.customers_meals[customer_id][index].week_meals.meal.name;
                }
                else {
                    return this.customer_has_meal_type(customer_id, meal_type_id) ? '<span class="text-danger">No Meal assigned</span>' : '';
                }
            },
            customer_has_meal_type(customer_id, meal_type_id) {
                let meal_types = this.customers_meals[customer_id][0].customer.meal_types;
                if(meal_types.length == 0) {
                    return true;
                }
                else {
                    return meal_types.findIndex(mt => mt.id == meal_type_id) >= 0;
                }
            },
            reformattedDate(date) {
                let dateArr = date.split('/');

                return [dateArr[2], dateArr[1], dateArr[0]].join('-');
            }
        },
        watch: {
            date(){
                this.fetchMeals();
                let url = '{{route('customers_meals_report', ':date')}}';
                url = url.replace(':date', this.date);

                $('#printReportBtn').attr('href', url);
            }
        }
    });

    window.onload = function () {
        // $('.datepicker').datepicker();
    };

    @if(env('APP_ENV') == 'local')
    // Before you create app
    Vue.config.devtools = true;

    // After you create app
    window.__VUE_DEVTOOLS_GLOBAL_HOOK__.Vue = vu.constructor;

    @endif
</script>
@endsection
