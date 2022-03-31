@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>
        .btn btn-default.active-btn {
            color: #fff;
        }
        .btn-group.special {
            display: flex;
        }

        .special .btn {
            flex: 1
        }
        .plan-meals .card-header {
            font-size: 18px;
            padding: 10px;
        }
        .voyager .nav-tabs > li.active > a:hover {
            background-color: {{config('voyager.primary_color')}};
            color: #fff !important;
        }

        #accordion .card {
            margin-bottom: 10px;
        }
        #accordion .card .card-header {
            background: {{config('voyager.primary_color')}};
            color: #fff !important;
        }
        #accordion .card-header h5 a {
            color: {{ config('voyager.primary_color') }} !important;
            font-weight: 900;
        }

        .voyager .btn.btn-default {
            background-color: #f0f0f0;
            border-color: #eaeaea;
            font-size: 12px;
        }
        .meal_btn {
            margin: 3px;
        }

        .meal_btn.selected {
            border: 1px solid #272e35 !important;
            border-radius: 0px;
        }
        .meal_type_match {
            /*font-weight: 900;*/
        }

        .active-btn {
            background: {{config('voyager.primary_color')}} !important;
            color: #fff;
        }

        .btn-dark {
            background-color: #fff !important;
            color: {{config('voyager.primary_color')}} !important;
            border-color: {{config('voyager.primary_color')}} !important;
        }


        .select_meals_btn {
            background-color: #fff !important;
        }
        div#accordion .card-header a:not(.select_meals_btn) {
            color: #fff !important;
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

                                <div class="clearfix"></div>
                                @if(!is_null($dataTypeContent->getKey()))
                                    <div class="col-md-12">
                                        <div id="week_days" class="d-flex flex-row mt-2">
                                            {{--<ul class="nav nav-tabs" id="myTab" role="tablist">--}}
                                                {{--<li v-for="(day, index) in week.days" :class="'nav-item' + (index==0 ? ' active' : '')">--}}
                                                    {{--<a :class="'nav-link' + (index==0 ? ' active' : '')" :id="'week_' + index + '-tab'" data-toggle="tab" :href="'#week_' + index" role="tab" :aria-controls="'week_' + index" :aria-expanded="index == 0">@{{ day }}</a>--}}
                                                {{--</li>--}}
                                            {{--</ul>--}}
                                            <div class="btn-group btn-group-lg special" role="group" aria-label="Justified button group">
                                                    <button v-for="(day, index) in week.days" @click="set_current_day(day)" type="button" :class="['btn btn-default', (current_day == day ? 'active-btn' : '')]">@{{ day }}</button>
                                            </div>
                                            <br>
                                            <div v-show="current_day !== ''" class="btn-group btn-group-lg special" role="group" aria-label="Justified button group">
                                                    <button v-for="meal_type in meal_types" @click="set_current_meal_type(meal_type.id)" type="button" :class="['btn btn-info', (current_meal_type_id == meal_type.id ? 'active-btn' : '')]">@{{ meal_type.name }}</button>
                                            </div>
                                            <br>
                                            <div v-show="current_meal_type_id !== 0" class="btn-group special" role="group" aria-label="Justified button group">
                                                    <button v-for="plan in all_plans" @click="set_current_plan(plan.id)" type="button" :class="['btn btn-success', (current_plan_id == plan.id ? 'active-btn' : '')]">@{{ plan.name }}</button>
                                            </div>
                                            <br>
{{--                                            <a href="javascript:;" @click="select_all_meals" class="btn btn-success btn-dark">Select All meals</a>--}}
                                            <br>
                                            <div id="accordion">
                                                <div class="card">
                                                    <div class="card-header" :id="current_day+current_meal_type_id">
                                                        <h5 class="mb-0 text-center" style="padding: 7px;font-size: 27px;">
                                                            Meals Menu
                                                        </h5>
                                                    </div>
                                                        <div class="card-body">
                                                            <div v-if="current_plan_id !== 0 && current_meal_type_id !== 0">
                                                                <div v-if="meals_list.length > 0">
                                                                    <div class="alert alert-info">
                                                                        Please click on the desired meal to add to <strong style="font-weight: 900;background: #666;padding: 4px;border-radius: 6px;font-size: 12px;">@{{ current_day }}</strong> menu {{--or <a href="javascript:;" @click="select_all_meals" class="btn btn-success btn-dark">Select All below meals</a>--}}
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control form-control-lg" placeholder="Search..." v-model="searchTxt">
                                                                    </div>
                                                                    <button v-for="meal in meals_list"
                                                                            :data-meal-id="meal.id"
                                                                            :ref="meal_selected(meal.id, current_meal_type_id, current_day) ? 'selected_meal' : 'deselected_meal'"
                                                                            @click="add_remove_week_meal(week.id, meal.id, current_meal_type_id, current_day, meal_selected(meal.id, current_meal_type_id, current_day))"
                                                                            type="button"
                                                                            v-show="searchTxt.trim() == '' || meal.name.toLowerCase().indexOf(searchTxt.toLowerCase().trim()) > -1"
                                                                            :class="['meal_'+current_meal_type_id+'_'+current_day, (meal_selected(meal.id, current_meal_type_id, current_day) ? 'meal_btn selected btn btn-dark' : 'meal_btn btn btn-default'), (current_meal_type_id === meal.meal_type_id ? ' meal_type_match' : '')]">
                                                                        @{{ meal.name }}
                                                                    </button>
                                                                </div>
                                                                <div class="alert alert-info" v-else>
                                                                    No meals matching current filter selection
                                                                </div>
                                                            </div>
                                                            <div class="alert alert-info" v-else>
                                                                Please select a Meal Type and a Plan
                                                            </div>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                    <h4 class="modal-title"><i class="voyager-dark"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
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

        @if(!is_null($dataTypeContent->getKey()))
            $('input[name="startdate"], input[name="name"]').closest('.form-group').append($('<div>').addClass('alert alert-info').text('You cannot edit week start and end dates, you can delete this week and create a new one'));
            $('input[name="startdate"], input[name="enddate"]').closest('.form-group').hide();
        @endif

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

        const vu = new Vue({
            el: '#week_days',
            data: {
                week: {},
                meals_list: [],
                all_plans: [],
                day_meals: [],
                current_day: '',
                current_meal_type_id: 0,
                current_plan_id: 0,
                meal_types: [],
                deselected_meals: [],
                searchTxt: ''
            },
            created() {

                $.getJSON('{{route('get_week', ['week_id' => $dataTypeContent->getKey()])}}').done(function(data){
                    vu.week = data;
                    vu.current_day = vu.week.days[0];
                    vu.get_day_meals(vu.week.id, vu.current_day);
                });

                $.getJSON('{{route('all_plans')}}').done(data => {this.all_plans = data;});
                $.getJSON('{{route('all_meal_types_only')}}').done(data => {this.meal_types = data;});
            },
            updated(){
                this.refresh_deselected_meals();
            },
            methods: {
                fetchMealsList(){
                    let url = '{{route('filtered_meals_list', ['meal_type_id' => ':_meal_type_id', 'plan_id' => ':_plan_id'])}}';
                    url = url.replace(':_meal_type_id', this.current_meal_type_id);
                    url = url.replace(':_plan_id', this.current_plan_id);

                    $.getJSON(url).done(data => {this.meals_list = data;});
                },
                db_date_format(date) {
                    let new_date = date.split("-").reverse().join("-");
                    return new_date;
                },

                refresh_deselected_meals() {
                    this.deselected_meals = Array.from($('.meal_btn:not(.selected)')).map(item => item.getAttribute('data-meal-id'));
                },
                add_remove_week_meal(week_id, meal_id, meal_type_id, day, add_remove) {
                    if(!add_remove) {
                        $.post('{{route('add_week_meal')}}', {week_id, meal_id, meal_type_id, date: vu.db_date_format(day)}, function(data){
                            vu.week.meals = data;
                        });
                    }
                    else {
                        $.post('{{route('remove_week_meal')}}', {week_id, meal_id, meal_type_id, date: vu.db_date_format(day)}, function(data){
                            vu.week.meals = data;
                        });
                    }

                    this.refresh_deselected_meals();
                },
                meals_selection(week_id, date, meal_type_id) {
                    let deselected_meals = Array.from($('.meal_'+meal_type_id+'_'+date+'.meal_btn:not(.selected)')).map(item => item.getAttribute('data-meal-id'));
                    $.post('{{route('bulk_add_week_meals')}}', {week_id, meal_type_id, date, meals: deselected_meals}, function (data) {
                        vu.week.meals = data;
                        console.log(data);
                        // vu.get_day_meals(vu.week.id, vu.current_day);
                     });
                },
                set_current_day(day) {
                    vu.current_day = day;
                    this.refresh_deselected_meals();
                    if(vu.current_meal_type_id !== 0 && vu.current_plan_id !== 0) {
                        this.fetchMealsList(vu.current_plan_id, vu.current_plan_id);
                    }
                },
                set_current_meal_type(id) {
                    vu.current_meal_type_id = id;
                    if(vu.current_meal_type_id !== 0 && vu.current_plan_id !== 0) {
                        this.fetchMealsList(vu.current_plan_id, vu.current_plan_id);
                    }
                },
                set_current_plan(id) {
                    vu.current_plan_id = id;
                    if(vu.current_meal_type_id !== 0 && vu.current_plan_id !== 0) {
                        this.fetchMealsList(vu.current_plan_id, vu.current_plan_id);
                    }
                },
                get_meal_type_name(meal_type_id) {
                    /*if(this.meal_types.filter(mt => {return mt.id == meal_type_id;})[0] != undefined)
                    {
                        return this.meal_types.filter(mt => {return mt.id == meal_type_id;})[0].name;
                    } */

                    return this.meal_types[meal_type_id].name;
                },
                meal_selected(meal_id, meal_type_id, day) {
                    if(this.week.meals != undefined)
                    {
                        let result = this.week.meals.filter(meal => {
                            return (meal.pivot.meal_id == meal_id && meal.pivot.date == this.db_date_format(day) && meal.pivot.meal_type_id == meal_type_id);
                        });

                        return result.length  > 0;
                    }
                },

                get_day_meals(week_id, day) {
                    let url = '{{ route("get_week_day_meals", [":week_id", ":day"]) }}';
                    url = url.replace(':week_id', week_id);
                    url = url.replace(':day', day);

                    $.getJSON(url).done(function(data){
                        vu.day_meals = data;
                    });
                },

                select_all_meals() {
                    $('.meal_btn:not(".selected")').click();
                    // for(var i=0;i<$('.select_meals_button').length;i++) {$('.select_meals_btn')[i].click();}
                }
            }
        })
    </script>
@stop
