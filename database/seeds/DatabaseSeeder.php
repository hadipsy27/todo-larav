<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        // panggil TodosSeeder
        // langkah terakhir "php artisan db:seed"
        $this->call(TodosSeeder::class);
    }
}
