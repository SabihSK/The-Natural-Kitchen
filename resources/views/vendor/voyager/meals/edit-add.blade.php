@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .wrapper{
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            /* width: 400px; */
            margin: 1vh auto 0;
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
        .meal_ingredients {
            display: block;
        }
    </style>
@stop

@section('page_title', __('voyager::generic.'.(!is_null($dataTypeContent->getKey()) ? 'edit' : 'add')).' '.$dataType->display_name_singular)

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.(!is_null($dataTypeContent->getKey()) ? 'edit' : 'add')).' '.$dataType->display_name_singular }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                    <!-- form start -->
                    <form role="form"
                          class="form-edit-add"
                          action="@if(!is_null($dataTypeContent->getKey())){{ route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) }}@else{{ route('voyager.'.$dataType->slug.'.store') }}@endif"
                          method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                    @if(!is_null($dataTypeContent->getKey()))
                        {{ method_field("PUT") }}
                    @endif

                    <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">

                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                        <!-- Adding / Editing -->
                            @php
                                $dataTypeRows = $dataType->{(!is_null($dataTypeContent->getKey()) ? 'editRows' : 'addRows' )};
                            @endphp

                            @foreach($dataTypeRows as $row)
                            <!-- GET THE DISPLAY OPTIONS -->
                                @php
                                    $display_options = isset($row->details->display) ? $row->details->display : NULL;
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                    <legend class="text-{{isset($row->details->legend->align) ? $row->details->legend->align : 'center'}}" style="background-color: {{isset($row->details->legend->bgcolor) ? $row->details->legend->bgcolor : '#f0f0f0'}};padding: 5px;">{{$row->details->legend->text}}</legend>
                                @endif
                                @if (isset($row->details->formfields_custom))
                                    @include('voyager::formfields.custom.' . $row->details->formfields_custom)
                                @else
                                    <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ isset($display_options->width) ? $display_options->width : 12 }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                        {{ $row->slugify }}
                                        <label for="name">{{ $row->display_name }}</label>
                                        @include('voyager::multilingual.input-hidden-bread-edit-add')
                                        @if($row->type == 'relationship')
                                            @include('voyager::formfields.relationship', ['options' => $row->details])
                                        @else
                                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                        @endif

                                        @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                            {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                        @endforeach
                                    </div>
                                @endif
                            @endforeach
                            @if(!is_null($dataTypeContent->getKey()))
                                <div class="clearfix"></div>
                                @if($dataTypeContent->custom == 0)
                                <div id="ingredients_box" class="card bg-primary border-primary">
                                    <div class="card-body">
                                        <div class="add_remove_box">
                                            <a href="javascript:;" class="btn btn-primary" @click="addIngredient"><span class="glyphicon glyphicon-plus" style="font-size: 15px;text-decoration:none;"></span></a>
                                        </div>
                                        <table class="table table-hover table-bordered">
                                            <thead>
                                            <tr>
                                                <th>Ingredient</th>
                                                <th>Amount in gm</th>
                                                <th>Fats</th>
                                                <th>Calories</th>
                                                <th>Carbohydrates</th>
                                                <th>Protein</th>
                                                <th>Cost</th>
                                                <th>Removable</th>
                                                <th>Editable Amount</th>
                                                <th><span class="glyphicon glyphicon-pencil"></span></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr   v-for="(ingred, ind) in meal_ingredients" :key="ind">
                                                <td>
                                                    <select class="form-control ingredients_dropdown" @change="setIngData(ingred)" v-model="ingred.id">
                                                        <option v-for="(ing, index) in all_ingredients" :disabled="ingredientAlreadySelected(ing.id)" :selected="ing.id === ingred.id" :value="ing.id">@{{ ing.name }}</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <input class="form-control" type="number" step="0.01" min="0" v-model="ingred.pivot.amount">
                                                </td>
                                                <td v-if="ingred.id != undefined">@{{ Math.round(ingred.fat*ingred.pivot.amount/100) }} </td>
                                                <td v-else>--</td>
                                                <td v-if="ingred.id != undefined">@{{ Math.round(ingred.calories*ingred.pivot.amount/100) }} </td>
                                                <td v-else>--</td>
                                                <td v-if="ingred.id != undefined">@{{ Math.round(ingred.carbohydrates*ingred.pivot.amount/100) }} </td>
                                                <td v-else>--</td>
                                                <td v-if="ingred.id != undefined">@{{ Math.round(ingred.protein*ingred.pivot.amount/100) }}</td>
                                                <td v-else>--</td>
												<td v-if="ingred.products != undefined && ingred.pivot.amount >= 1 " class="xx" >@{{  roundToTwo(ingred.products.unitprice/ingred.products.productunit * ingred.pivot.amount)}}																								</td>												<td v-else-if="ingred.products != undefined && ingred.pivot.amount < 1 " class="xy" >@{{  roundToTwo(ingred.products.unitprice/ingred.products.productunit * 1)}}																								</td>												
												 <td v-else>--</td>
                                                <td>
                                                    <div class="wrapper">
                                                        <div class="switch_box box_1">
                                                            <input type="checkbox" class="switch_1" :true-value="1" :false-value="0" v-model="ingred.pivot.removable" :checked="ingred.removable ? 'checked' : 'false'">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="wrapper">
                                                        <div class="switch_box box_1">
                                                            <input type="checkbox" class="switch_1" :true-value="1" :false-value="0" v-model="ingred.pivot.editable" :checked="ingred.editable ? 'checked' : 'false'">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <a v-show="meal_ingredients.length > 1" href="javascript:;" @click="removeIngredient(ind)"><span class="glyphicon glyphicon-minus" style="font-size: 15px;text-decoration:none;"></span></a>
                                                </td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            <tr style="background: #888;color: #fff;font-weight: 900">
                                                 <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="input-group" style="width: 120px;">
                                                        <input style="width: 80px;" type="number" min="0" class="form-control" v-model="meal.total_fats">
                                                        <span class="input-group-addon">@{{ total_fats }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group" style="width: 120px;">
                                                        <input style="width: 80px;" type="number" min="0" class="form-control" v-model="meal.total_calories">
                                                        <span class="input-group-addon">@{{ total_calories }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group" style="width: 120px;">
                                                        <input style="width: 80px;" type="number" min="0" class="form-control" v-model="meal.total_carbs">
                                                        <span class="input-group-addon">@{{ total_carbohydrates }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group" style="width: 120px;">
                                                        <input style="width: 80px;" type="number" min="0" class="form-control" v-model="meal.total_proteins">
                                                        <span class="input-group-addon">@{{ total_proteins }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group" style="width: 120px;">
                                                        <input style="width: 80px;" type="number" min="0" class="form-control" v-model="meal.total_cost">
                                                        <span class="input-group-addon">@{{ total_cost }}</span>
                                                    </div>
                                                </td>												
                                                <td></td>
                                                <td></td>
                                            </tr>


                                            </tfoot>
                                        </table>
                                        <a href="javascript:;" :disabled="saveIngDisabled == true" class="btn btn-success" @click="saveIngredients">Save Meal Ingredients</a>
                                    </div>

                                </div>
                                    @else
                                    <div class="alert alert-info">
                                        This meal is a custom one and is used for customers with specific amounts of ingredient types e.g (Customers requiring 100gm of vegetables + 150 gm of chicken at lunch)
                                    </div>
                                    @endif

                            @endif
                        </div><!-- panel-body -->

                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                        </div>
                    </form>

                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                          enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                               onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
            return function() {
                $file = $(this).siblings(tag);

                params = {
                    slug:   '{{ $dataType->slug }}',
                    filename:  $file.data('file-name'),
                    id:     $file.data('id'),
                    field:  $file.parent().data('field-name'),
                    multi: isMulti,
                    _token: '{{ csrf_token() }}'
                }

                $('.confirm_delete_name').text(params.filename);
                $('#confirm_delete_modal').modal('show');
            };
        }

        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.type != 'date' || elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
            $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });

        @if(!is_null($dataTypeContent->getKey()) && $dataTypeContent->custom == 0)
            const vu = new Vue({
                el: "#ingredients_box",
                data: {
                    meal: {},
                    all_ingredients: [],
                    meal_ingredients: [],
                    saveIngDisabled: false,
                    dataFetched: false,					total_cost : {}
                },
                created(){


                    $.getJSON("{{route('all_ingredients')}}").done(function(data){
                        vu.all_ingredients = data;

                        $.getJSON("{{route('meal_ingredients', ['meal_id' => $dataTypeContent->getKey()])}}").done(function(data){
                            vu.meal = data;
                            vu.meal_ingredients = data.ingredients;

                            if(vu.meal_ingredients.length == 0) {
                                vu.meal_ingredients.push({
                                    id: vu.all_ingredients[0].id,
                                    name: vu.all_ingredients[0].name,
                                    protein: vu.all_ingredients[0].protein,									                                    products: vu.all_ingredients[0].products,
                                    fat: vu.all_ingredients[0].fat,
                                    carbohydrates: vu.all_ingredients[0].carbohydrates,
                                    calories: vu.all_ingredients[0].calories,
                                    pivot: {
                                        amount: 0,
                                        removable: 0,
                                        editable: 0,
                                        meal_id: '{{$dataTypeContent->getKey()}}',
                                        ingredient_id: vu.all_ingredients[0].id
                                    }
                                });
                            }
                        });

                    });


                },
                updated(){
                    this.dataFetched = true;
                },
                computed: {
                    total_fats(){
                        let value = this.meal_ingredients.reduce(function(prev, item){
                            if(item.id == undefined) {return prev; }
                            return Math.round(prev + (item.fat*item.pivot.amount/100));
                        },0);

                        return value;

                    },
                    total_carbohydrates(){
                        let value = this.meal_ingredients.reduce(function(prev, item){
                            if(item.id == undefined) {return prev; }
                            return Math.round(prev + (item.carbohydrates*item.pivot.amount/100));
                        },0);


                        return value;

                    },
                    total_calories(){
                        let value = this.meal_ingredients.reduce(function(prev, item){
                            if(item.id == undefined) {return prev; }
                            return Math.round(prev + (item.calories*item.pivot.amount/100));
                        },0);

                        return value;
                    },
                    total_proteins(){
                        let value = this.meal_ingredients.reduce(function(prev, item){
                            if(item.id == undefined) {return prev; }
                            return Math.round(prev + (item.protein*item.pivot.amount/100));
                        },0);
						this.total_cost_method();
                        return value;

                    },
                    total_cost(){
                        let value = this.meal_ingredients.reduce(function(prev, item){
                            if(item.products == null) {return prev; }							var amount = item.pivot.amount;							if(amount < 1){								amount = 1;							}
                            return prev + item.products.unitprice/item.products.productunit * amount	;
                        },0);
                        return roundToTwo(value);

                    },					
                    meal_ingredients_ids: function () {
                        let ids = [];
                        JSON.stringify(this.meal_ingredients, (key, value) => {
                            if(value!=38){
                              if (key === 'id') ids.push(value);
                            }
                            return value;
                        });

                        return ids;
                    }
                },
            watch: {
                total_calories(newVal) {
                        if(this.dataFetched) {
                            this.meal.total_calories = newVal;
                        }

                    },
                total_fats(newVal) {
                        if(this.dataFetched) {
                            this.meal.total_fas  = newVal;
                        }

                    },
                total_carbohydrates(newVal) {
                        if(this.dataFetched) {
                            this.meal.total_carbs  = newVal;
                        }

                    },
                total_proteins(newVal) {
                        if(this.dataFetched) {
                            this.meal.total_proteins  = newVal;
                        }

                    },
                total_cost(newVal) {
                        if(this.dataFetched) {
                            this.meal.total_cost  = newVal;
                        }

                    },					
            },
            methods: {				 total_cost_method(){                        let value = this.meal_ingredients.reduce(function(prev, item){                            if(item.products == null) {return prev; }							var amount = item.pivot.amount;							if(amount < 1){								amount = 1;							}                            return prev + item.products.unitprice/item.products.productunit * amount ;                        },0);						this.meal.total_cost = this.roundToTwo(value);						this.total_cost = this.roundToTwo(value);                        return value;												 },
                newIngObj: function(newIng) {
                    let ingData = this.getIngData(newIng.id);
                    let newIngObj = {
                        id: ingData.id,
                        name: ingData.name,
                        protein: ingData.protein,
                        fat: ingData.fat,
                        carbohydrates: ingData.carbohydrates,
                        calories: ingData.calories,
                        pivot: {
                            amount: 0,
                            removable: 0,
                            editable: 0,
                            meal_id: '{{$dataTypeContent->getKey()}}',
                            ingredient_id: ingData.id
                        },
                    };
                    return newIngObj;
                },
                setIngData: function(ingredient) {
                  let ingData = this.getIngData(ingredient.id);
                  ingredient.name = ingData[0].name;
                  ingredient.protein = ingData[0].protein;                  ingredient.products = ingData[0].products;
                  ingredient.fat = ingData[0].fat;
                  ingredient.carbohydrates = ingData[0].carbohydrates;
                  ingredient.calories = ingData[0].calories;
                },
                getIngData: function(ingred) {
                  let result = this.all_ingredients.filter(ing => ing.id == ingred);
                  return result;
                },
                addIngredient: function () {
                    let newIng = vu.meal_ingredients[vu.meal_ingredients.length-1];
                    vu.meal_ingredients.push(this.newIngObj(newIng));
                },
                removeIngredient: function (index) {
                    vu.meal_ingredients.splice(index, 1);
                },				roundToTwo(num) {    					return +(Math.round(num + "e+3")  + "e-3");				},
                saveIngredients: function () {
                    if(this.meal_ingredients_ids.indexOf(undefined) >= 0) {
                        return ;
                    }
                    this.saveIngDisabled = true;
                    let meal_cals = this.meal.total_calories != 0 ? this.meal.total_calories : this.total_calories;
                    let meal_fats = this.meal.total_fats != 0 ? this.meal.total_fats : this.total_fats;
                    let meal_proteins = this.meal.total_proteins != 0 ? this.meal.total_proteins : this.total_proteins;
                    let meal_total_cost = this.meal.total_cost != 0 ? this.meal.total_cost : this.total_cost;
                    let meal_carbs = this.meal.total_carbs != 0 ? this.meal.total_carbs : this.total_carbohydrates;
                    $.ajax({
                        url: '{{route("update_ingredients")}}',
                        method: 'POST',
                        data: {ingredients: vu.meal_ingredients, meal_id: '{{$dataTypeContent->getKey()}}', meal_cals, meal_fats, meal_proteins,meal_total_cost, meal_carbs},
                        success: function (data) {
                            toastr.success("Meal ingredients updated successfully.");
                            this.saveIngDisabled = false;
                        }.bind(this)
                    });
                },				
                ingredientAlreadySelected: function (index) {
                    return this.meal_ingredients_ids.indexOf(index) >= 0;
                }
            }
            });
        @endif

    @if(env('APP_ENV') == 'local')
        // Before you create app
        Vue.config.devtools = true;

        // After you create app
        window.__VUE_DEVTOOLS_GLOBAL_HOOK__.Vue = vu.constructor;

    @endif
    </script>
@stop
