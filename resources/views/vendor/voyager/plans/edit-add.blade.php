@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .plan_prohibited_ingredients {
            display: block;
        }
        .add_remove_box {
            margin-bottom: 20px;
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
                                {{--<div id="ingredients_box" class="col-md-3 card">
                                    <div class="card-body">
                                    <h3 class="card-title">Plan Prohibited Ingredients</h3>
                                    <div class="add_remove_box">
                                        <a href="javascript:;" class="btn btn-danger" :disabled="this.selectedIngredient.id == 0" @click="addIngredient"><span class="glyphicon glyphicon-plus" style="font-size: 15px;text-decoration:none;"></span></a>
                                        <select class="form-control" style="display: inline;width: 250px" v-model="selectedIngredientId">
                                            <option v-for="(ingredient, index) in all_ingredients" :disabled="ingredientExists(ingredient.id)" :value="ingredient.id">@{{ingredient.name}}</option>
                                        </select>
                                    </div>
                                    <table class="table table-hover table-bordered" v-show="plan_prohibited_ingredients.length > 0">
                                        <thead>
                                        <tr>
                                            <th>Ingredient</th>
                                            <th><span class="glyphicon glyphicon-pencil"></span></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr v-for="(ingred, ind) in plan_prohibited_ingredients" :key="ind">
                                            <td>
                                                @{{ ingred.name }}
                                            </td>
                                            <td>
                                                <a href="javascript:;" @click="removeIngredient(ind)"><span class="glyphicon glyphicon-minus" style="font-size: 15px;text-decoration:none;"></span></a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <a href="javascript:;" :disabled="saveIngDisabled == true" class="btn btn-success" @click="saveIngredients">Save Prohibited Ingredients</a>

                                    </div>
                                </div>--}}

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



                @if(!is_null($dataTypeContent->getKey()))


                <div class="panel panel-primary">

                    <div class="">
                        <div class="panel-heading">
                            <h3 style="padding: 16px;color: #fff;">Excluded List</h3>
                        </div>
                        <div class="panel-body">
                            <div id="ingredients_box" class="col-md-12 panel">
                                <div id="accordion" v-for="(ingType, id) in customer_allergic_ingredients" >
                                    <div class="card card-default">
                                        <div class="card-header" >
                                            <h5 class="mb-0">
                                                <input type="checkbox"
                                                       :checked="allIngChecked(id)"
                                                       v-model="ingType.checked"
                                                       :indeterminate.prop="someIngChecked(id)"
                                                       @change="checkIng(id, false, $event)" >

                                                <a class="btn btn-link" href="javascript:;" data-toggle="collapse"
                                                   :data-target="'#ing_type_' + id" aria-expanded="true"
                                                   :aria-controls="'ing_type_' + id"
                                                   style="text-decoration: none;padding-left: 0px">

                                                    <div class="checkbox">
                                                        <span style="font-weight: 900">@{{ ingType.name }} </span>

                                                    </div>
                                                </a>
                                                <small>Checking this will automatically add future ingredients under <b><u>@{{ ingType.name }}</u></b> to the excluded ingredients list</small>
                                            </h5>
                                        </div>
                                        <div :id="'ing_type_' + id" class="collapse"
                                             :aria-labelledby="'ing_type_' + id"
                                             data-parent="#accordion">
                                            <div class="card-body" style="padding-left: 40px" :id="'ingredients_of_type_'+id">

                                                <div class="checkbox" v-for="ing in ingType.ingredients">
                                                    <label>
                                                        <input :disabled="ingType.checked" type="checkbox" :value="ing.id" v-model="ing.checked"  @change="checkIng(id, ing.id, $event)"  :checked="ing.checked"> @{{ ing.name }}
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                {{--<div class="add_remove_box">
                                    <a href="javascript:;" class="btn btn-danger" :disabled="this.selectedIngredient.id == 0" @click="addIngredient"><span class="glyphicon glyphicon-plus" style="font-size: 15px;text-decoration:none;"></span></a>
                                    <select class="form-control" style="display: inline;width: 250px" v-model="selectedIngredientId">
                                        <option v-for="(ingredient, index) in all_ingredients" :disabled="ingredientExists(ingredient.id)" :value="ingredient.id">@{{ingredient.name}}</option>
                                    </select>
                                </div>
                                <table class="table table-hover table-bordered" v-show="customer_allergic_ingredients.length > 0">
                                    <thead>
                                    <tr>
                                        <th>Ingredient</th>
                                        <th><span class="glyphicon glyphicon-pencil"></span></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(ingred, ind) in customer_allergic_ingredients" :key="ind">
                                        <td>
                                            @{{ ingred.name }}
                                        </td>
                                        <td>
                                            <a href="javascript:;" @click="removeIngredient(ind)"><span class="glyphicon glyphicon-minus" style="font-size: 15px;text-decoration:none;"></span></a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <a href="javascript:;" :disabled="saveIngDisabled == true" class="btn btn-success" @click="saveIngredients">Save Allergic Ingredients</a>--}}

                            </div>
                        </div>
                    </div>




            </div>
                @endif

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
    </script>
            <script>

        @if(!is_null($dataTypeContent->getKey()))

        /*const vu = new Vue({
                el: "#ingredients_box",
                data: {
                    all_ingredients: [],
                    plan_prohibited_ingredients: [],
                    saveIngDisabled: false,
                    selectedIngredientId: 0,
                    selectedIngredient: {id: 0, name: ''}
                },
                created(){
                    $.getJSON("{{route('all_ingredients')}}").done(function(data){
                        vu.all_ingredients = data;

                        $.getJSON("{{route('plan_prohibited_ingredients', ['plan_id' => $dataTypeContent->getKey()])}}").done(function(data){
                            vu.plan_prohibited_ingredients = data;

                            /!*if(vu.plan_prohibited_ingredients.length == 0) {
                                vu.plan_prohibited_ingredients.push({
                                    id: vu.all_ingredients[0].id,
                                    name: vu.all_ingredients[0].name,
                                });
                            }*!/
                        });

                    });


                },
            watch: {
                selectedIngredientId: function () {
                    this.selectedIngredient.id = this.selectedIngredientId;
                    this.selectedIngredient.name = this.all_ingredients.filter(ing => ing.id == this.selectedIngredient.id)[0].name;
                }
            },
            computed: {
                planProhibitedIngredients: function () {
                    if(this.plan_prohibited_ingredients.length == 0){
                        return [];
                    }

                    return this.plan_prohibited_ingredients;
                }
            },
            methods: {
                setIngData: function(ingredient) {
                  let ingData = this.getIngData(ingredient.id);
                  ingredient.name = ingData[0].name;
                },
                getIngData: function(ingred) {
                  let result = this.all_ingredients.filter(ing => ing.id == ingred);
                  return result;
                },
                addIngredient: function () {
                    let selectedIngredient_id = this.selectedIngredient.id;
                    let selectedIngredient_name = this.selectedIngredient.name;
                    if(this.ingredientExists(selectedIngredient_id) || selectedIngredient_id == 0) {
                        return false;
                    }
                    this.plan_prohibited_ingredients.push({id: selectedIngredient_id, name: selectedIngredient_name});
                    this.selectedIngredient.name = this.all_ingredients.filter(ing => ing.id == this.selectedIngredient.id)[0].name;
                },
                removeIngredient: function (index) {
                    this.plan_prohibited_ingredients.splice(index, 1);
                },
                saveIngredients: function () {
                    this.saveIngDisabled = true;
                    $.ajax({
                        url: '{{route("update_plan_prohibited_ingredients")}}',
                        method: 'POST',
                        data: {ingredients: vu.planProhibitedIngredients, plan_id: '{{$dataTypeContent->getKey()}}'},
                        success: function (data) {
                            toastr.success("Plan's prohibited ingredients updated successfully.");
                            this.saveIngDisabled = false;
                        }.bind(this)
                    });
                },
                ingredientExists: function (ingId) {
                    return this.plan_prohibited_ingredients.filter(ing => ing.id == ingId).length > 0;
                }
            }
            });*/
    </script>

            <script>
                const vu = new Vue({
                    el: "#ingredients_box",
                    data: {
                        customer_allergic_ingredients: [],
                        saveIngDisabled: false,
                        selectedIngredientId: 0,
                        selectedIngredient: {id: 0, name: ''},
                    },
                    created() {
                        $.getJSON("{{route('plan_prohibited_ingredients', ['customer_id' => $dataTypeContent->getKey()])}}").done(function (data) {
                            vu.customer_allergic_ingredients = data;
                        });


                    },
                    watch: {
                        selectedIngredientId: function () {
                            this.selectedIngredient.id = this.selectedIngredientId;
                            this.selectedIngredient.name = this.all_ingredients.filter(ing => ing.id == this.selectedIngredient.id)[0].name;
                        }
                    },
                    computed: {
                        customerAllergicIngredients: function () {
                            if (this.customer_allergic_ingredients.length == 0) {
                                return [];
                            }

                            return this.customer_allergic_ingredients;
                        }
                    },
                    methods: {
                        setIngData: function (ingredient) {
                            let ingData = this.getIngData(ingredient.id);
                            ingredient.name = ingData[0].name;
                        },
                        getIngData: function (ingred) {
                            let result = this.all_ingredients.filter(ing => ing.id == ingred);
                            return result;
                        },
                        addIngredient: function () {
                            let selectedIngredient_id = this.selectedIngredient.id;
                            let selectedIngredient_name = this.selectedIngredient.name;
                            if (this.ingredientExists(selectedIngredient_id) || selectedIngredient_id == 0) {
                                return false;
                            }
                            this.customer_allergic_ingredients.push({id: selectedIngredient_id, name: selectedIngredient_name});
                            this.selectedIngredient.name = this.all_ingredients.filter(ing => ing.id == this.selectedIngredient.id)[0].name;
                        },
                        removeIngredient: function (index) {
                            this.customer_allergic_ingredients.splice(index, 1);
                        },
                        saveIngredients: function (ingList, remove = false, ingTypeId = 0) {
                            this.saveIngDisabled = true;

                            console.log('ingTypeId => ' + ingTypeId);

                            $.ajax({
                                url: '{{route("update_plan_prohibited_ingredients")}}',
                                method: 'POST',
                                data: {
                                    ingredients: ingList,
                                    plan_id: '{{$dataTypeContent->getKey()}}',
                                    remove: remove ? 1 : 0,
                                    ingTypeId
                                },
                                success: function (data) {
                                    if(data.status !== 1) {
                                        toastr.error(data.message);
                                    }
                                    else {
                                        toastr.success(data.message);
                                    }
                                    this.saveIngDisabled = false;
                                }.bind(this)
                            });
                        },
                        ingredientExists: function (ingId) {
                            return this.customer_allergic_ingredients.indexOf(ingId) >= 0;
                        },
                        allIngChecked(ingTypeId) {
                            let ings_list = Object.values(vu.customerAllergicIngredients[ingTypeId]['ingredients']);
                            let filtered_ings_list = ings_list.filter(ing=> ing.checked == true);

                            return filtered_ings_list.length > 0 && filtered_ings_list.length == ings_list.length;
                        },
                        someIngChecked(ingTypeId) {
                            let ings_list = Object.values(vu.customerAllergicIngredients[ingTypeId]['ingredients']);
                            let filtered_ings_list = ings_list.filter(ing=> ing.checked == true);

                            return filtered_ings_list.length > 0 && filtered_ings_list.length < ings_list.length;
                        },
                        checkIng(ingTypeId, ingId = false, event){
                            if(ingId !== false) {
                                let ing_id_signed = this.customerAllergicIngredients[ingTypeId];
                                this.saveIngredients([ingId], this.customerAllergicIngredients[ingTypeId]['ingredients'][ingId]['checked']);

                            }
                            else {
                                let ingIdsList = Object.values(this.customerAllergicIngredients[ingTypeId]['ingredients']).map(item => item.id);
                                this.saveIngredients(ingIdsList, event.target.checked, ingTypeId);

                                ingIdsList.forEach(item => {
                                    this.customerAllergicIngredients[ingTypeId]['ingredients'][item].checked = event.target.checked;
                                });

                            }
                        }
                    }
                });
            </script>
    @endif

@stop
