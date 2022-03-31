<?php

namespace App\Http\Controllers;

use App\CustomerProgram;
use Illuminate\Http\Request;

class CustomerProgramController extends Controller
{
    public function getCustomerProgram($id)
    {
        $program = CustomerProgram::whereCustomerId($id)->get()->groupBy('meal_type_id');

        return $program;
    }

    public function addOption(Request $request)
    {
        $request->validate([
            'data.customer_id' => 'required|exists:customers,id',
            'data.meal_type_id' => 'required|exists:meal_types,id',
        ]);


        $data = $request->get('data');
        $customer_id = $data['customer_id'];
        $meal_type_id = $data['meal_type_id'];
        $options = isset($data['options']) ? $data['options'] : [];

        $customer_program = CustomerProgram::firstOrNew([
            'customer_id' => $customer_id,
            'meal_type_id' => $meal_type_id
        ]);

        if($customer_program->id) {
            if(count($options) == 0) {
                $customer_program->delete();
            }
            else {
                $customer_program->options = $options;
                $customer_program->save();
            }
        }
        else {
            $customer_program->options = $options;
            $customer_program->save();
        }

        return $this->getCustomerProgram($customer_id);
    }
}
