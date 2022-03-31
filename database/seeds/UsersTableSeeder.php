<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('users')->delete();
        
        \DB::table('users')->insert(array (
            0 => 
            array (
                'id' => 1,
                'role_id' => 1,
                'name' => 'Admin',
                'email' => 'admin@tnk.test',
                'avatar' => 'users/default.png',
                'email_verified_at' => NULL,
                'password' => '$2y$10$uvdQkaiX5PKCDtZE2QA7jet0D.IPypzW3/LL2OPXI2G3LMY8ZHL9O',
                'remember_token' => '7Pu4tY67PuTvei4DVMyhTVM9ZEyrAHABc1S7R5XD2kwXPRyUc0JKCWN3OA0l',
                'settings' => NULL,
                'created_at' => '2019-03-17 08:24:13',
                'updated_at' => '2019-03-17 08:24:13',
            ),
        ));
        
        
    }
}