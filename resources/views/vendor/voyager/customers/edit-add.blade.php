	@extends('voyager::master')

	@section('css')
		<meta name="csrf-token" content="{{ csrf_token() }}">
		<link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'>
		<style>
.card {
position: relative;
display: -webkit-box;
display: -ms-flexbox;
display: flex;
-webkit-box-orient: vertical;
-webkit-box-direction: normal;
-ms-flex-direction: column;
flex-direction: column;
min-width: 0;
word-wrap: break-word;
background-color: #fff;
background-clip: border-box;
border: 1px solid rgba(0, 0, 0, 0.125);
border-radius: 0.25rem;
}		
			.customer_allergic_ingredients {
				display: block;
			}
			.datepicker.dropdown-menu {
				z-index: 999999 !important;
			}
			.datepicker { 
    z-index: 999999 !important;
}

			.bootstrap-datetimepicker-widget.dropdown-menu {
				z-index: 999999 !important;
			}
			.add_remove_box {
				margin-bottom: 20px;
			}
			.new_box {
				border: 1px dashed #aaa;
			}
			.add_btn {
				font-size: 23px;
			}
			.list-group.control a.list-group-item {
				padding: 2px 13px;
				border-radius: 0px;
			}
		</style>
	@stop

	@section('page_title', __('voyager::generic.'.(!is_null($dataTypeContent->getKey()) ? 'edit' : 'add')).' '.$dataType->display_name_singular . ' #'.$dataTypeContent->id)

	@section('page_header')
		<h1 class="page-title">
			<i class="{{ $dataType->icon }}"></i>
			{{ __('voyager::generic.'.(!is_null($dataTypeContent->getKey()) ? 'edit' : 'add')).' '.$dataType->display_name_singular . ' #'.$dataTypeContent->id }}
		</h1>
		@include('voyager::multilingual.language-selector')
	@stop

	@section('content')
		<div class="page-content edit-add container-fluid">
			<div class="row">
				<div class="col-md-12">


					<div class="panel panel-primary {{ !is_null($dataTypeContent->getKey()) ? 'col-md-6' : ''}}">
						<div class="panel-heading">
							<h3 style="padding: 16px;color: #fff;">Customer Info</h3>
						</div>
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
										<legend class="text-{{isset($row->details->legend->align) ? $row->details->legend->align : 'center'}}"
												style="background-color: {{isset($row->details->legend->bgcolor) ? $row->details->legend->bgcolor : '#f0f0f0'}};padding: 5px;">{{$row->details->legend->text}}</legend>
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


							</div><!-- panel-body -->

							<div class="panel-footer">
								<button type="submit"
										class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
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
						<div class="panel panel-primary col-md-6">
								<div class="panel-heading">
									<h3 style="padding: 16px;color: #fff;">Subscribed Weeks</h3>
								</div>
								<div class="panel-body">
									<div id="subscriptions_box" class="col-md-12 panel" >
										<div class="card card-default">
											<div class="card-body" style="position:relative;">

												<div class="row">
													<div class="alert alert-info" v-show="anySelectedMT() == false">
														By default, the customer is subscribed to all current and future weeks, if you want a customer to be subscribed to only specific weeks, select from the below list
													</div>

													<div class="checkbox" v-for="week in weeks">
														<label>
															<input type="checkbox"
																   :value="week.id" v-model="week.checked"
																   @change="checkWeek(week.id, $event)"
																   :checked="isWeekChecked(week.id)"> @{{ reformattedWeekName(week) }}
														</label>
													</div>
												</div><!-- /.row -->
												
												<div class="row">
												    <div class="col-md-2" style="margin-left:-3% !important;width:1% !important;">
												        <input  @change="checkCustomWeek($event)" class="d-inline" type="checkbox"/>
												    </div>
												    
													<div class="col-md-5">
														<label>Start Date  </label>
														
														<input type="text"  class="form-control"  id="datetimepicker1">
														
													</div>
													<div class="col-md-5">
													<label>End Date
														 </label>
														   <input  class="form-control"   type="text"  id="datetimepicker2">                                             
													</div>												
												</div>
												<div class="checkbox"  v-for="cweek in customweek" >
													
													@{{ customWeekName(cweek) }}
												</div>
											</div>
										</div>
									</div>
								</div>

							<div class="panel-heading">
								<h3 style="padding: 16px;color: #fff;">Paused Weeks</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="alert alert-info">
										Please note that this option overwrites the week subscription option above
									</div>
								</div>
								<div id="paused_weeks_box" class="col-md-12 panel">
									<div class="card card-default">
										<div class="card-body">

											<div class="row">
												<div class="checkbox" v-for="week in weeks">
													<label>
														<input type="checkbox"
															   :value="week.id" v-model="week.checked"
															   @change="checkWeek(week.id, $event)"
															   :checked="isWeekChecked(week.id)"> @{{ reformattedWeekName(week) }}
													</label>
												</div>
											</div><!-- /.row -->
										</div>
									</div>
								</div>
							</div>

								<div class="panel-heading">
									<h3 style="padding: 16px;color: #fff;">Paused Days</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="alert alert-info">
											Please note that pausing days will remove all meals assigned to <strong>{{$dataTypeContent->fullname}}</strong> for the paused day (only if these meals are not marked as <strong>Cooked</strong>)
										</div>
									</div>

									<div id="paused_days_box" class="col-md-12 panel">
										<div class="card card-default">
											<div class="card-body">

												<div class="row">
													<v-calendar @dayclick="dayClicked" :formats='formats' :attributes='attrs' :disabled-dates='{ weekdays: @json($dataTypeContent->excluded_days) }'></v-calendar>
														@foreach($dataTypeContent->getPausedDays() as $date)
															<div class="label label-primary">{{\Carbon\Carbon::parse($date)->format('D, d M Y')}}</div>
														@endforeach

												</div><!-- /.row -->
											</div>
										</div>
									</div>
								</div>


	{{--                            <div class="panel-heading">
								   <h3 style="padding: 16px;color: #fff;">Excluded Days</h3>
							   </div>
							   <div class="panel-body">
								   <div id="excluded_days" class="col-md-12 panel">
									   <div class="card card-default">
										   <div class="card-body">

											   <div class="row">
												   <div class="checkbox" v-for="day in days">
													   <label>
														   <input type="checkbox"
																  :value="day.number" v-model="day.checked"
																  @change="checkDay(day.number, $event)"
																  :checked="isDayChecked(day.number)"> @{{ day.name }}
													   </label>
												   </div>
											   </div><!-- /.row -->
										   </div>
									   </div>
								   </div>
							   </div>--}}


								<div class="panel-heading">
									<h3 style="padding: 16px;color: #fff;">Desired Daily Meal Types</h3>
								</div>
								<div class="panel-body">
									<div id="meal_types_box" class="col-md-12 panel">
											<div class="card card-default">
												<div class="card-body">

													<div class="row">
														<div class="alert alert-info" v-if="anySelectedMT() == false">
															By default, all meal types will be considered in meal selection, if there is no specific meals types desired, <b><u>DO NOT</u></b> select any meal types
														</div>
														<div class="alert alert-info" v-else>
															If you make any change to the selected meal types, you should re-generate this customer's meals list for the current active week to refresh the list of assigned meals
														</div>

														<div class="checkbox" v-for="mt in meal_types">
															<label>
																<input type="checkbox"
																	   :value="mt.id" v-model="mt.checked"
																	   @change="checkMealType(mt.id, $event)"
																	   :checked="isMealTypeChecked(mt.id)"> @{{ mt.name }}
															</label>
														</div>
													</div><!-- /.row -->
												</div>
										</div>
									</div>
								</div>


								<div class="panel-heading">
									<h3 style="padding: 16px;color: #fff;">Calories Settings</h3>
								</div>
								<div class="panel-body">
									<div id="calories_box" class="col-md-12 panel">
											<div class="card card-default">
												<div class="card-body">

													<div class="row">
															<div class="input-group">
																<span class="input-group-addon" id="sizing-addon1">
																	Consider Calories in meal selection?
																</span>
																<span class="input-group-addon">
																<input type="checkbox"
																	   :checked="customer.consider_calories"
																	   v-model="customer.consider_calories"
																	   @change="checkCal($event)">
															  </span>
																<input v-show="customer.consider_calories" type="number" @blur="dailyCaloriesSet" class="form-control" v-model="customer.daily_calories" placeholder="Daily Calories">
																<span v-show="customer.consider_calories" class="input-group-addon" id="basic-addon2">Daily Calories</span>


															</div><!-- /input-group -->
														<small>
															If Calories Consideration is <b>OFF</b>, ingredient amounts for selected meals will be set to the default values
														</small>

													</div><!-- /.row -->
												</div>
										</div>
									</div>
								</div>


								<div class="panel-heading">
									<h3 style="padding: 16px;color: #fff;">Allergies List</h3>
								</div>
								<div class="panel-body">
									<div id="ingredients_box" class="col-md-12 panel">
										<div id="accordion" v-for="(ingType, id) in customer_allergic_ingredients" >
											<div class="card card-default">
												<div class="card-header">
													<h5 class="mb-0">
														<input type="checkbox"
															   :checked="allIngChecked(id)"
															   v-model="ingType.checked"
															   :indeterminate.prop="someIngChecked(id)"
															   @change="checkIng(id, false, $event)">

														<a class="btn btn-link" href="javascript:;" data-toggle="collapse"
														   :data-target="'#ing_type_' + id" aria-expanded="true"
														   :aria-controls="'ing_type_' + id"
														   style="text-decoration: none;padding-left: 0px">

															<div class="checkbox">
																<span style="font-weight: 900">@{{ ingType.name }} </span>

															</div>
														</a>
														<small>Checking this will automatically add future ingredients under
															<b><u>@{{ ingType.name }}</u></b> to the allergies list
														</small>
													</h5>
												</div>
												<div :id="'ing_type_' + id" class="collapse"
													 :aria-labelledby="'ing_type_' + id"
													 data-parent="#accordion">
													<div class="card-body" style="padding-left: 40px"
														 :id="'ingredients_of_type_'+id">

														<div class="checkbox" v-for="ing in ingType.ingredients">
															<label>
																<input :disabled="ingType.checked" type="checkbox"
																	   :value="ing.id" v-model="ing.checked"
																	   @change="checkIng(id, ing.id, $event)"
																	   :checked="ing.checked"> @{{ ing.name }}
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




							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 style="padding: 16px;color: #fff;">Customer Disliked Ingredients</h3>
								</div>
								<div class="panel-body">

									<div id="disliked_ingredients_box" class=" panel">
										<div class="add_remove_box">
											<a href="javascript:;" class="btn btn-danger"
											   :disabled="this.selectedIngredient.id == 0" @click="addIngredient"><span
														class="glyphicon glyphicon-plus"
														style="font-size: 15px;text-decoration:none;"></span></a>
											<select class="form-control" style="display: inline;width: 250px"
													v-model="selectedIngredientId">
												<option v-for="(ingredient, index) in all_ingredients"
														:disabled="ingredientExists(ingredient.id)" :value="ingredient.id">
													@{{ingredient.name}}
												</option>
											</select>
										</div>
										<table class="table table-hover table-bordered"
											   v-show="customer_disliked_ingredients.length > 0">
											<thead>
											<tr>
												<th>Ingredient</th>
												<th><span class="glyphicon glyphicon-pencil"></span></th>
											</tr>
											</thead>
											<tbody>
											<tr v-for="(ingred, ind) in customer_disliked_ingredients" :key="ind">
												<td>
													@{{ ingred.name }}
												</td>
												<td>
													<a href="javascript:;" @click="removeIngredient(ind)">
														<span class="glyphicon glyphicon-minus" style="font-size: 15px;text-decoration:none;"></span>
													</a>
												</td>
											</tr>
											</tbody>
										</table>
										<a href="javascript:;" :disabled="saveIngDisabled == true" class="btn btn-success"
										   @click="saveIngredients">Save Disliked Ingredients</a>

									</div>
								</div>
							</div>

							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 style="padding: 16px;color: #fff;">Custom Program</h3>
								</div>
								<div class="panel-body">
									<div id="ingredient_types_amounts_box" class=" panel">
										<div class="row">
											{{--<div class="col-md-4 form-group">
												<select class="form-control" v-model="entry_values.meal_type_id">
													<option value="0">Please select a meal type...</option>
													<option v-for="(meal_type, index) in meal_types" :value="meal_type.id">
														@{{meal_type.name}}
													</option>
												</select>
											</div>--}}
											<div class="col-md-8 form-group">
												<label>Ingredient Type</label>
												<select class="form-control" v-model="entry_values.ingredient_type_id">
													<option value="0">Please select an ingredient type...</option>
													<option v-for="(ingredient_type, index) in all_ingredient_types"
															:value="ingredient_type.id">@{{ingredient_type.name}}
													</option>
												</select>
											</div>
											<div class="col-md-4 form-group">
												<label>Amount in <u><i>gm</i></u></label>
												<input type="number" min="0" class="form-control" v-model="entry_values.amount"
													   placeholder="amount in gm">
											</div>
										</div>
										<div class="clearfix"></div>
										<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
											<div class="panel panel-default" v-for="(mealType, mealTypeId) in meal_types">
												<div class="panel-heading" role="tab" :id="'heading_'+mealTypeId">
													<h4 class="panel-title">
														<a role="button" data-toggle="collapse" data-parent="#accordion"
														   :href="'#collapse_'+mealTypeId" aria-expanded="true"
														   :aria-controls="'collapse_'+mealTypeId">
															@{{ mealType.name }}
														</a>
													</h4>
												</div>
												<div :id="'collapse_'+mealTypeId" class="panel-collapse collapse in"
													 role="tabpanel" :aria-labelledby="'heading_'+mealTypeId">
													<div class="panel-body">

														<div class="list-group control" v-if="customer_program[mealTypeId] != undefined">
															<span v-for="(entry, meal_type_id) in customer_program" v-if="meal_type_id == mealTypeId">
																<li  class="list-group-item" v-for="(ent, index) in entry[0].options">
																	<h4 class="list-group-item-heading">Option #@{{ index+1 }}</h4>
																	<p class="list-group-item-text" style="padding-right: 50px;">
																		<span v-for="(e, ind) in ent.data" class="text-primary">
																			@{{ e.amount }} gm of @{{ all_ingredient_types[e.ingredient_type_id].name }} <strong v-if="ind+1 < ent.data.length"> + </strong>
																		</span>
																	<div class="list-group" style="position: absolute;top: 10px;right: 10px;">
																	  <a href="javascript:;" :disabled="emptyEntries()" @click="addToOption(mealTypeId, index)" type="button" :class="['list-group-item', 'list-group-item-success', emptyEntries() || entryExists(mealTypeId, index) ? ' disabled' : '']">
																			<span class="glyphicon glyphicon-plus-sign"></span>
																		</a>
																	  <a href="javascript:;" @click="removeOption(mealTypeId, index)" type="button" class="list-group-item list-group-item-danger">
																		  <span class="glyphicon glyphicon-minus-sign"></span>
																	  </a>
																	</div>
																		<div class="clearfix"></div>
																	</p>
																	<br>
																	<div class="form-group">
																		<label class="col-xs-2">Kitchen</label>
																		<div class="col-xs-10">
																		<select class="form-control" @change="saveKitchen($event, mealTypeId, index)" v-model="ent.kitchen_id">
																			<option :value="kitchen_id" v-for="(kitchen_name, kitchen_id) in kitchens">@{{ kitchen_name }}</option>
																		</select>
																	</div>
																		<div class="clearfix"></div>
																		<button class="btn btn-info" @click="fetchMatchingMeals({{$dataTypeContent->plan_id}}, mealTypeId, ent.data)">View Matching Week Meals</button>
																	</div>

																</li>
															</span>
														</div>

														<div class="new_box col-xs-12 text-right">
															<button class="btn btn-success" @click="addToOption(mealTypeId)">
																<span class="glyphicon glyphicon-plus-sign add_btn"></span>
															</button>
														</div>
														<div class="clearfix"></div>

														<div class="alert alert-primary">
															<span style="color: #888">
																Please don't forget to <strong><u>select the kitchen</u></strong> for each Program Meal Option.
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>



										<div class="modal fade modal-danger" id="program_meals">
											<div class="modal-dialog">
												<div class="modal-content">
													<table class="table table-hover">
														<thead>
														<tr>
															<th>Week</th>
															<th>Meals</th>
														</tr>
														</thead>
														<tbody>
														<tr v-for="(meals, week_name) in matching_meals">
															<td>@{{ week_name }}</td>
															<td>
																<a :href="'/admin/meals/'+meal.id+'/edit'" target="_blank" v-if="meals.length > 0" v-for="meal in meals" style="display: block">
																	@{{ meal.name }}
																</a>
																<div class="alert alert-danger" v-else>
																	There is no matching meals for this program option in this week's meals list
																</div>
															</td>
														</tr>
														</tbody>
													</table>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>

					@endif
				</div>
			</div>
		</div>



		<div class="modal fade modal-danger" id="confirm_delete_modal">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;
						</button>
						<h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}
						</h4>
					</div>

					<div class="modal-body">
						<h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'
						</h4>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default"
								data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
						<button type="button" class="btn btn-danger"
								id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
					</div>
				</div>
			</div>
		</div>
		<!-- End Delete File Modal -->
	@stop


	@section('javascript')
		<!--3. Link VCalendar Javascript (Plugin automatically installed)-->
		<script src='https://unpkg.com/v-calendar'></script>
		<!--4. Create the Vue instance-->
		<script>
			const pausedVue = new Vue({
				el: '#paused_days_box',
				data: {
					// Data used by the date picker
					formats: {
						title: 'MMMM YYYY',
						weekdays: 'W',
						navMonths: 'MMM',
						input: ['L', 'YYYY-MM-DD', 'YYYY/MM/DD'], // Only for `v-date-picker`
						dayPopover: 'L', // Only for `v-date-picker`
					},
					dates: @json($dataTypeContent->getPausedDays()),
					selectedDate: '',
					selectedValue: '',
					mode: 'single',
					attrs: [
						{
							dates: @json($dataTypeContent->getPausedDays()),
							key: 'today',
							highlight: {
								backgroundColor: '#ff8080',
								// Other properties are available too, like `height` & `borderRadius`
							},
							popover: {
								label: 'This day is paused',
							}

						}
					],

				},
				watch:{
					selectedDate(val, old) {
						console.log('Selected day changed');
					}
				},
				computed: {
					inputState() {
						if (!this.selectedValue) {
							return {
								type: 'is-danger',
								message: 'Date required.',
							};
						}
						return {
							type: 'is-primary',
							message: '',
						};
					},
				},
				methods: {
					updatePausedDays(date) {
						$.post('{{route('customer.paused-days.update')}}', {date, customer_id: '{{$dataTypeContent->getKey()}}'}, function(data){
							if(data.success) {
								pausedVue.attrs[0].dates = data.data;
								toastr.success(data.message);
								window.location.reload();
							}
							else {
								toastr.error('Error updating paused days!');
							}
						});
					},
					dayClicked(day){
						this.selectedDate = day.date;
						this.updatePausedDays(this.formatDate(day.date));
					},
					formatDate(date) {
						var d = new Date(date),
							month = '' + (d.getMonth() + 1),
							day = '' + d.getDate(),
							year = d.getFullYear();

						if (month.length < 2)
							month = '0' + month;
						if (day.length < 2)
							day = '0' + day;

						return [year, month, day].join('-');
					}
				}
			})
		</script>
		<script>
			var params = {};
			var $file;

			function deleteHandler(tag, isMulti) {
				return function () {
					$file = $(this).siblings(tag);

					params = {
						slug: '{{ $dataType->slug }}',
						filename: $file.data('file-name'),
						id: $file.data('id'),
						field: $file.parent().data('field-name'),
						multi: isMulti,
						_token: '{{ csrf_token() }}'
					}

					$('.confirm_delete_name').text(params.filename);
					$('#confirm_delete_modal').modal('show');
				};
			}

			$('document').ready(function () {
			    $('.select2-ajax').attr('required',1);
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

				$('.side-body input[data-slug-origin]').each(function (i, el) {
					$(el).slugify();
				});

				$('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
				$('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
				$('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
				$('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

				$('#confirm_delete').on('click', function () {
					$.post('{{ route('voyager.media.remove') }}', params, function (response) {
						if (response
							&& response.data
							&& response.data.status
							&& response.data.status == 200) {

							toastr.success(response.data.message);
							$file.parent().fadeOut(300, function () {
								$(this).remove();
							})
						} else {
							toastr.error("Error removing file.");
						}
					});

					$('#confirm_delete_modal').modal('hide');
				});
				$('[data-toggle="tooltip"]').tooltip();
				
		
			$(function () {
                $('#datetimepicker1').datetimepicker({
					format: 'YYYY/MM/DD',
					widgetPositioning: {
						horizontal: 'right',
						vertical: 'top'
					}
				});
                $('#datetimepicker2').datetimepicker({
					format: 'YYYY/MM/DD',
					widgetPositioning: {
						horizontal: 'right',
						vertical: 'top'
					}

				});
            });		
		
			
			});

			@if(!is_null($dataTypeContent->getKey()))
		</script>

		{{--------------------------------------------------------------------------------------------------- VUE SECTION ---------------------------------------------------------------------------------------------------}}

		<script>
			const vu = new Vue({
				el: "#ingredients_box",
				data: {
					customer_allergic_ingredients: [],
					saveIngDisabled: false,
					selectedIngredientId: 0,
					selectedIngredient: {id: 0, name: ''}
				},
				created() {
					$.getJSON("{{route('customer_allergic_ingredients', ['customer_id' => $dataTypeContent->getKey()])}}").done(function (data) {
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


						$.ajax({
							url: '{{route("update_customer_allergic_ingredients")}}',
							method: 'POST',
							data: {
								ingredients: ingList,
								customer_id: '{{$dataTypeContent->getKey()}}',
								remove: remove ? 1 : 0,
								ingTypeId
							},
							success: function (data) {
								if (data.status !== 1) {
									toastr.error(data.message);
								} else {
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
						let filtered_ings_list = ings_list.filter(ing => ing.checked == true);

						return filtered_ings_list.length > 0 && filtered_ings_list.length == ings_list.length;
					},
					someIngChecked(ingTypeId) {
						let ings_list = Object.values(vu.customerAllergicIngredients[ingTypeId]['ingredients']);
						let filtered_ings_list = ings_list.filter(ing => ing.checked == true);

						return filtered_ings_list.length > 0 && filtered_ings_list.length < ings_list.length;
					},
					checkIng(ingTypeId, ingId = false, event) {
						if (ingId !== false) {
							let ing_id_signed = this.customerAllergicIngredients[ingTypeId];
							this.saveIngredients([ingId], this.customerAllergicIngredients[ingTypeId]['ingredients'][ingId]['checked']);

						} else {
							let ingIdsList = Object.values(this.customerAllergicIngredients[ingTypeId]['ingredients']).map(item => item.id);
							this.saveIngredients(ingIdsList, event.target.checked, ingTypeId);

							ingIdsList.forEach(item => {
								this.customerAllergicIngredients[ingTypeId]['ingredients'][item].checked = event.target.checked;
							});

						}
					}
				}
			});

			const vusw = new Vue({
				el: "#subscriptions_box",
				data: {
					weeks: [],
					customweek:[] ,
				
				},
				created() {
					$.getJSON('{{route('customer.subscriptions', ['id' => $dataTypeContent->getKey(), 'subscribed' => 1])}}').done(data => vusw.weeks = data);
					
					$.getJSON('{{route('customer.custom.subscriptions', ['id' => $dataTypeContent->getKey(), 'subscribed' => 1])}}').done(data => vusw.customweek = data);					
					
				},
				watch: {
					//
				},
				computed: {
					//
				},
				methods: {
					fetchData(){
						$.getJSON('{{route('customer.custom.subscriptions', ['id' => $dataTypeContent->getKey(), 'subscribed' => 1])}}').done(data => vusw.customweek = data);	
					},
					checkWeek(week_id, event) {
						let checked = event.target.checked;
						let vars = {
							checked: checked ? 1 : 0,
							week_id,
							customer_id: '{{$dataTypeContent->getKey()}}',
							subscribed: '1'
						};

						$.ajax({
							url: '{{route("customer.subscriptions.update")}}',
							method: 'POST',
							data: vars,
							success: function (data) {
								if(data.success) {
									toastr.success(data.message);
								}
								else {
									toastr.error(data.message);
								}
							}.bind(this)
						});
					},
					checkCustomWeek(event) {
					 	$('#datetimepicker1').val()
						$('#datetimepicker2').val()
						
						if($('#datetimepicker1').val() == ''){
							toastr.error('Please Select Start Date');
						}
						if($('#datetimepicker2').val() == ''){
							toastr.error('Please Select End Date');
						}						
						let checked = event.target.checked;
						let vars = {
							checked: checked ? 1 : 0,
							startdate: $('#datetimepicker1').val(),
							enddate: $('#datetimepicker2').val(),
							customer_id: '{{$dataTypeContent->getKey()}}',
						};	
                      if(checked==true)
                      {
						$.ajax({
							url: '{{route("customer.custom.subscriptions.update")}}',
							method: 'POST',
							data: vars,
							success: function (data) {
								if(data.success) {
									toastr.success(data.message);
									this.fetchData();
								}
								else {
									toastr.error(data.message);
								}
							}.bind(this)
						});
                      }
						
					},
					isWeekChecked(w_id){
						return this.weeks.filter(w => {w.id == w_id && w.checked && w.subscribed == 1} ).length > 0;
					},
					anySelectedMT(){
						return this.weeks.filter(w => {w.checked == true && w.subscribed == 1} ).length > 0;
					},
					reformattedWeekName(week_obj) {
						let sd = new Date(week_obj.startdate);
						let ed = new Date(week_obj.enddate);
						sd = sd.getDate() + '/' + (sd.getMonth() + 1) + '/' + sd.getFullYear();
						ed = ed.getDate() + '/' + (ed.getMonth() + 1) + '/' + ed.getFullYear();

						return week_obj.name + ' <<  ' + sd + ' ~ ' + ed + ' >>';
					},
					customWeekName(week_obj) {
						let sd = new Date(week_obj.startdate);
						let ed = new Date(week_obj.enddate);
						sd = sd.getDate() + '/' + (sd.getMonth() + 1) + '/' + sd.getFullYear();
						ed = ed.getDate() + '/' + (ed.getMonth() + 1) + '/' + ed.getFullYear();

						return ' Custom Dates From  ' + sd + ' To ' + ed + ' ';
					}					
					
					
				}
			});



			const vupw = new Vue({
				el: "#paused_weeks_box",
				data: {
					weeks: [],
				},
				created() {
					$.getJSON('{{route('customer.subscriptions', ['id' => $dataTypeContent->getKey(), 'subscribed' => 0])}}').done(data => vupw.weeks = data);
				},
				watch: {
					//
				},
				computed: {
					//
				},
				methods: {
					checkWeek(week_id, event) {
						let checked = event.target.checked;
						let vars = {
							checked: checked ? 1 : 0,
							week_id,
							customer_id: '{{$dataTypeContent->getKey()}}',
							subscribed: '0'
						};

						$.ajax({
							url: '{{route("customer.subscriptions.update")}}',
							method: 'POST',
							data: vars,
							success: function (data) {
								if(data.success) {
									toastr.success(data.message);
								}
								else {
									toastr.error(data.message);
								}
							}.bind(this)
						});
					},
					isWeekChecked(w_id){

						return this.weeks.filter(w => {w.id == w_id && w.checked && w.subscribed == 0} ).length > 0;
					},
					anySelectedMT(){
						return this.weeks.filter(w => {w.checked == true && w.checked && w.subscribed == 0} ).length > 0;
					},
					reformattedWeekName(week_obj) {
						let sd = new Date(week_obj.startdate);
						let ed = new Date(week_obj.enddate);
						sd = sd.getDate() + '/' + (sd.getMonth() + 1) + '/' + sd.getFullYear();
						ed = ed.getDate() + '/' + (ed.getMonth() + 1) + '/' + ed.getFullYear();

						return week_obj.name + ' <<  ' + sd + ' ~ ' + ed + ' >>';
					}
				}
			});




			{{--
			const vuxd = new Vue({
				el: "#excluded_days",
				data: {
					days: [],
				},
				created() {
					$.getJSON('{{route('customer.excluded-days', ['id' => $dataTypeContent->getKey(), 'excluded' => 1])}}').done(data => vupw.days = data);
				},
				watch: {
					//
				},
				computed: {
					//
				},
				methods: {
					checkDay(week_id, event) {
						let checked = event.target.checked;
						let vars = {
							checked: checked ? 1 : 0,
							week_id,
							customer_id: '{{$dataTypeContent->getKey()}}',
							excluded: '0'
						};

						$.ajax({
							url: '{{route("customer.excluded-days.update")}}',
							method: 'POST',
							data: vars,
							success: function (data) {
								if(data.success) {
									toastr.success(data.message);
								}
								else {
									toastr.error(data.message);
								}
							}.bind(this)
						});
					},
					isDayChecked(w_id){

						return this.weeks.filter(w => {w.id == w_id && w.checked && w.subscribed == 0} ).length > 0;
					},
					anySelectedMT(){
						return this.weeks.filter(w => {w.checked == true && w.checked && w.subscribed == 0} ).length > 0;
					},
					reformattedDayName(week_obj) {
						let sd = new Date(week_obj.startdate);
						let ed = new Date(week_obj.enddate);
						sd = sd.getDate() + '/' + (sd.getMonth() + 1) + '/' + sd.getFullYear();
						ed = ed.getDate() + '/' + (ed.getMonth() + 1) + '/' + ed.getFullYear();

						return week_obj.name + ' <<  ' + sd + ' ~ ' + ed + ' >>';
					}
				}
			});
	--}}


			const vuc = new Vue({
				el: "#calories_box",
				data: {
					customer: {},
				},
				created() {
					$.getJSON("{{route('customer.get', ['id' => $dataTypeContent->getKey()])}}").done(function (data) {
						vuc.customer = data;
					});


				},
				watch: {
					//
				},
				computed: {
					//
				},
				methods: {
					checkCal(event) {
						this.dailyCaloriesSet();
					},
					dailyCaloriesSet() {
						$.ajax({
							url: '{{route("customer.update", ['id' => $dataTypeContent->getKey()])}}',
							method: 'POST',
							data: {
								daily_calories: this.customer.daily_calories,
								consider_calories: this.customer.consider_calories ? 1 : 0
							},
							success: function (data) {
								if(data.success) {
									toastr.success(data.message);
								}
								else {
									toastr.error(data.message);
								}
							}.bind(this)
						});
					},
				}
			});



			const vumt = new Vue({
				el: "#meal_types_box",
				data: {
					meal_types: [],
				},
				created() {
					$.getJSON('{{route('customer.mealtypes', ['id' => $dataTypeContent->getKey()])}}').done(data => vumt.meal_types = data);
				},
				watch: {
					//
				},
				computed: {
					//
				},
				methods: {
					checkMealType(meal_type_id, event) {
						let checked = event.target.checked;
						let vars = {
							checked: checked ? 1 : 0,
							meal_type_id,
							customer_id: '{{$dataTypeContent->getKey()}}'
						};

						$.ajax({
							url: '{{route("customer.mealtype.add")}}',
							method: 'POST',
							data: vars,
							success: function (data) {
								if(data.success) {
									toastr.success(data.message);
								}
								else {
									toastr.error(data.message);
								}
							}.bind(this)
						});
					},
					isMealTypeChecked(mt_id){
						return this.meal_types.filter(mt => {mt.id == mt_id && mt.checked} ).length > 0;
					},
					anySelectedMT(){
						return this.meal_types.filter(mt => mt.checked == true ).length > 0;
					}
				}
			});


			const vud = new Vue({
				el: "#disliked_ingredients_box",
				data: {
					all_ingredients: [],
					customer_disliked_ingredients: [],
					saveIngDisabled: false,
					selectedIngredientId: 0,
					selectedIngredient: {id: 0, name: ''}
				},
				created() {
					$.getJSON("{{route('all_ingredients')}}").done(function (data) {
						vud.all_ingredients = data;

						$.getJSON("{{route('customer_disliked_ingredients', ['customer_id' => $dataTypeContent->getKey()])}}").done(function (data) {
							vud.customer_disliked_ingredients = data;

							/*if(vud.customer_disliked_ingredients.length == 0) {
								vud.customer_disliked_ingredients.push({
									id: vud.all_ingredients[0].id,
									name: vud.all_ingredients[0].name,
								});
							}*/
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
					customerDislikedIngredients: function () {
						if (this.customer_disliked_ingredients.length == 0) {
							return [];
						}

						return this.customer_disliked_ingredients;
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
						this.customer_disliked_ingredients.push({id: selectedIngredient_id, name: selectedIngredient_name});
						this.selectedIngredient.name = this.all_ingredients.filter(ing => ing.id == this.selectedIngredient.id)[0].name;
					},
					removeIngredient: function (index) {
						this.customer_disliked_ingredients.splice(index, 1);
					},
					saveIngredients: function () {
						this.saveIngDisabled = true;
						$.ajax({
							url: '{{route("update_customer_disliked_ingredients")}}',
							method: 'POST',
							data: {
								ingredients: vud.customerDislikedIngredients,
								customer_id: '{{$dataTypeContent->getKey()}}'
							},
							success: function (data) {
								toastr.success("Customer's disliked ingredients updated successfully.");
								this.saveIngDisabled = false;
							}.bind(this)
						});
					},
					ingredientExists: function (ingId) {
						return this.customer_disliked_ingredients.filter(ing => ing.id == ingId).length > 0;
					}
				}
			});


			/*
			 Ingredient Types Amounts
			 */

			const vuit = new Vue({
				el: "#ingredient_types_amounts_box",
				data: {
					all_ingredient_types: [],
					customer_ingredient_types_amounts: [],
					saveIngDisabled: false,
					selectedIngredientId: 0,
					selectedIngredient: {id: 0, name: '', amount: 0},
					meal_types: [],
					selectedMealTypeId: 0,
					selectedMealType: {id: 0, name: ''},
					entry_values: {ingredient_type_id: 0, amount: 0},
					customer_program: {},
					kitchens: '{!! \App\Kitchen::all()->pluck('name', 'id') !!}',
					matching_meals: []

				},
				created() {
					$.getJSON("{{route('all_ingredient_types')}}").done(function (data) {
						vuit.all_ingredient_types = data;

						$.getJSON("{{route('customer_ingredient_types', ['customer_id' => $dataTypeContent->getKey()])}}").done(function (data) {
							vuit.customer_ingredient_types_amounts = data;
						});

					});

					$.getJSON('{{route('all_meal_types_only')}}').done(data => vuit.meal_types = data);
					$.getJSON('{{route('get_customer_program', ['id' => $dataTypeContent->getKey()])}}').done(data => {
						let my_data = data;
						vuit.customer_program = my_data;
					});

					this.kitchens = JSON.parse(this.kitchens);

				},
				watch: {
					selectedIngredientId: function () {
						this.selectedIngredient.id = this.selectedIngredientId;
						this.selectedIngredient.name = this.all_ingredient_types.filter(ing => ing.id == this.selectedIngredient.id)[0].name;
					},
					selectedMealTypeId: function () {
						this.selectedMealType.id = this.selectedMealTypeId;
						this.selectedMealType.name = this.meal_types.filter(ing => ing.id == this.selectedMealType.id)[0].name;
					}
				},
				computed: {
					customerIngredientTypesAmounts: function () {
						if (this.customer_ingredient_types_amounts.length == 0) {
							return [];
						}

						return this.customer_ingredient_types_amounts;
					}
				},
				methods: {
					setIngData: function (ingredient) {
						let ingData = this.getIngData(ingredient.id);
						ingredient.name = ingData[0].name;
					},
					getIngData: function (ingred) {
						let result = this.all_ingredient_types.filter(ing => ing.id == ingred);
						return result;
					},
					addIngredient: function () {
						let selectedIngredient_id = this.selectedIngredient.id;
						let selectedIngredient_name = this.selectedIngredient.name;
						let selectedMealType_id = this.selectedMealType.id;
						let selectedMealType_name = this.selectedMealType.name;
						let selectedIngredient_amount = 0;
						if (this.ingredientTypeExists() || (selectedIngredient_id == 0 || selectedMealType_id == 0)) {
							return false;
						}
						this.customer_ingredient_types_amounts.push({
							ingredient_type: {
								id: selectedIngredient_id,
								name: selectedIngredient_name
							},
							meal_type: {
								id: selectedMealType_id,
								name: selectedMealType_name
							},
							amount: selectedIngredient_amount
						});

						this.selectedIngredient.name = this.all_ingredient_types.filter(ing => ing.id == this.selectedIngredient.id)[0].name;
						this.selectedMealType.name = this.meal_types.filter(ing => ing.id == this.selectedMealType.id)[0].name;
					},
					removeIngredient: function (index) {
						this.customer_ingredient_types_amounts.splice(index, 1);
					},
					saveIngredients: function () {
						this.saveIngDisabled = true;
						$.ajax({
							url: '{{route("update_customer_ingredient_types_amounts")}}',
							method: 'POST',
							data: {
								ingredient_types_amounts: vuit.customerIngredientTypesAmounts,
								customer_id: '{{$dataTypeContent->getKey()}}'
							},
							success: function (data) {
								toastr.success("Customer's custom ingredient types amounts updated successfully.");
								this.saveIngDisabled = false;
							}.bind(this)
						});
					},
					ingredientTypeExists: function () {
						return this.customer_ingredient_types_amounts.filter(ing_type => ing_type.ingredient_type.id == this.selectedIngredient.id && ing_type.meal_type.id == this.selectedMealType.id).length > 0;
					},
					emptyEntries() {
						// console.log(Object.values(this.entry_values).indexOf(0) >= 0);
						return Object.values(this.entry_values).indexOf(0) >= 0;
					},
					entryExists(meal_type_id, index) {
						let ingredient_type_id = this.entry_values.ingredient_type_id;

						if(this.customer_program[meal_type_id] == undefined) {
							return false;
						}

						if(this.customer_program[meal_type_id][index] == undefined) {
							return false;
						}

						return this.customer_program[meal_type_id][0]['options'][index]['data'].filter(opt => opt.ingredient_type_id == ingredient_type_id).length > 0;
					},
					saveProgramData(meal_type_id){
						let url = '{{route('add_program_option')}}';
						let data = {
							customer_id: '{{$dataTypeContent->getKey()}}',
							meal_type_id: meal_type_id,
							options: this.customer_program[meal_type_id][0]['options']
						};

						console.log(data.options);
						$.ajax({
							type: "POST",
							url: url,
							data: {data},
							success: function(data){
								toastr.success('Customer program updated successfully!');
								vuit.customer_program = data;
							},
							dataType: 'json'
						});
					},
					addToOption(meal_type_id, index = -1) {
						let customer_id = '{{$dataTypeContent->getKey()}}';
						let ingredient_type_id = this.entry_values.ingredient_type_id;

						if(this.emptyEntries() || this.entryExists(meal_type_id, index)) {
							return false;
						}

						if(ingredient_type_id === 0) {
							alert('Please select an ingredient type');
							return false;
						}

						if(this.customer_program[meal_type_id] != undefined) {
							console.log('IF');
							console.log('index => ' + index);
							if(index === -1) {
								this.customer_program[meal_type_id][0]['options'].push(
									{
										"data": [
											{
												ingredient_type_id: ingredient_type_id,
												amount: parseInt(this.entry_values.amount+'')
											}
										]
									}
								);
							}
							else {
								console.log('IF => ELSE');
								this.customer_program[meal_type_id][0]['options'][index]['data'].push({
									ingredient_type_id: ingredient_type_id,
									amount: parseInt(this.entry_values.amount+'')
								});
							}
						}
						else {
							console.log('ELSE');
							this.customer_program[meal_type_id] = [{
								customer_id,
								meal_type_id,
								options: [
									{
										"data": [
											{
												ingredient_type_id: ingredient_type_id,
												amount: parseInt(this.entry_values.amount+'')
											}
										]
									}
								]}];
						}

						this.saveProgramData(meal_type_id);

					},
					removeOption(meal_type_id, index){
						let ingredient_type_id = this.entry_values.ingredient_type_id;
						let options = this.customer_program[meal_type_id][0]['options'][index]['data'];

						if(ingredient_type_id === 0) {
							alert('Please select an ingredient type');
							return false;
						}

						var found = false;
						this.customer_program[meal_type_id][0]['options'][index]['data'].forEach((v, i) => {
							if(v.ingredient_type_id == ingredient_type_id) {
								found = true;
								this.customer_program[meal_type_id][0]['options'][index]['data'].splice(i, 1);
								if(this.customer_program[meal_type_id][0]['options'][index]['data'].length == 0) {
									this.customer_program[meal_type_id][0]['options'].splice(index, 1);
								}
							}
						});
						if(!found) {
							alert('The selected ingredient type does not exist in option #' + (index+1));
							return false;
						}

						this.saveProgramData(meal_type_id);
					},
					saveKitchen(event, meal_type_id, index) {
						this.customer_program[meal_type_id][0]['options'][index]['kitchen_id'] = parseInt(event.target.value);
						console.log(this.customer_program[meal_type_id][0]['options'][index]['data']);
						this.saveProgramData(meal_type_id);
					},
					fetchMatchingMeals(plan_id, mealTypeId, data) {
						this.matching_meals = [];
						let obj = {
							plan_id,
							mealTypeId,
							data
						};
						$.ajax({
							type: "POST",
							url: '{{route('customer.program.meals')}}',
							data: obj,
							dataType: 'json',
							success: function(data){
								console.log(data);
								vuit.matching_meals = data;
								$('#program_meals').modal('show');
							},
						});
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
