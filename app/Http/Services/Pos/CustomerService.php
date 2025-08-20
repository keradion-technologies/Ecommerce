<?php

namespace App\Http\Services\Pos;

use App\Enums\StatusEnum;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class CustomerService
{
    
    public function getCustomerList()
    {
        $customers = User::search()->latest()
                            ->with(['billingAddress'])
                            ->get();


        return $customers;
    }

    public function getCustomer($id)
    {
        $customer = User::with(['billingAddress'])
                        ->findOrFail($id);

        return $customer;
    }

    public function createCustomer($request)
    {
        
        $customer = User::create([
            'name'      => $request->input('name'),
            'phone'     => $request->input('phone'),
            'email'     => $request->input('email'),
            'address'   => $request->input('address'),
            'password'  => Hash::make('123123'),
            'status'    => $request->input('status', StatusEnum::true->status())
        ]);

        return $customer;
    }
}