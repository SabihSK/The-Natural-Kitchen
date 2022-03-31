<?php

namespace App\Http\Controllers;

use App\Customer;
use App\Week;
use DateTime;
use App\CustomSubscription;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class CustomerSubscriptionController extends Controller
{
    public function getWeeksSubscriptions($id, $subscribed = 1)
    {
        $customer = Customer::find($id);
        $customer->load(['weeks' => function ($q) use ($subscribed) {
            $q->where('subscribed', $subscribed);
        }]);
        $customer_weeks = $customer->weeks->groupBy('id')->map(function ($item) {
            return $item[0];
        });;
        $weeks = Week::all()->map(function ($w) use ($customer_weeks) {
            $w->checked = isset($customer_weeks[$w->id]);
            $w->subscribed = isset($customer_weeks[$w->id]) ? $customer_weeks[$w->id]['pivot']['subscribed'] : 0;
            return $w;
        });

        return response()->json($weeks);
    }

    public function addWeekSubscription(Request $request)
    {
        $customer_id = $request->get('customer_id');
        $week_id = $request->get('week_id');
        $checked = $request->get('checked');
        $subscribed = $request->get('subscribed');

        $customer = Customer::find($customer_id);

        try {
            if ($checked == 1) {
                $customer->weeks()->detach($week_id);
                $customer->weeks()->attach([$week_id => ['subscribed' => $subscribed]]);
                $message = 'Customer Week Subscription <b><u>added</u></b> successfully';
            } else {
                $customer->weeks()->detach($week_id);
                $message = 'Customer Week Subscription <b><u>removed</u></b> successfully';
            }

            return response()->json([
                'success' => true,
                'message' => $message
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error updating customer meal types'
            ]);
        }

    }

    public function updatePausedDays(Request $request)
    {
        $date = $request->date;
        $customer_id = $request->customer_id;

        $customer = Customer::findOrFail($customer_id);
        $exists = $customer->pausedDays()->where('date', $date)->exists();

        try {
            DB::beginTransaction();
            if(!$exists) {
                $customer->pausedDays()->create(['date' => $date]);
            }
            else {
                $customer->pausedDays()->where(['date' => $date])->delete();
            }
            DB::commit();

            return [
                'success' => 1,
                'message' => "Day has been " . (!$exists ? 'added to' : 'removed from') . " paused days list successfully",
                'data' => $customer->getPausedDays()
            ];
        }
        catch (\Exception $e) {
            Log::error($e->getMessage());
            DB::rollback();
            return [
                'success' => 0,
                'message' => "Error happened while " . (!$exists ? 'Adding' : 'Removing from') . " paused days list",
                'data' => $customer->getPausedDays()
            ];
        }
    }
	
	/*
		Get Single user Custom Subscription
	*/
	
	public function getCustomSubscription($id, $subscribed = 1){
		$customer_subscription =  CustomSubscription::where('customer_id', $id)->get();
		return response()->json($customer_subscription);
	}
	
	
	/*
	Get all user Custom Subscription
	*/	

	public function getCustomSubscriptionall(){
		$customer_subscription =  CustomSubscription::where('checked',1)->orderBy('updated_at', 'desc')->get();
		return response()->json($customer_subscription);
	}
	
	/*
	addCustomSubscription
	*/
	public function addCustomSubscription(Request $request){
        $checked = $request->get('checked');
		$startdate = $request->get('startdate');	
        $enddate = $request->get('enddate');
		$s_time = strtotime($startdate);
		$e_time = strtotime($enddate);
			if($s_time > $e_time){
				  return response()->json([
					'success' => false,
					'message' => 'Invalid Date Range'
				]);
			}


				  
				  
			if(!isset($startdate)){
				  return response()->json([
					'success' => false,
					'message' => 'Please Select Date'
				]);
			}
        $customer_id = $request->get('customer_id');	
		$customsubscription = 	new  CustomSubscription;
		$customsubscription->checked = $checked;
		$customsubscription->startdate = $startdate;
		$customsubscription->enddate = $enddate;
		$customsubscription->customer_id = $customer_id;
	
		if($customsubscription->save()){
		      return response()->json([
                'success' => true,
                'message' => 'Updated'
            ]);	
		}
	}
	
}
