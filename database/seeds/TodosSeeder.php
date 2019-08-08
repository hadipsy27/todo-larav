<?php

use Illuminate\Database\Seeder;

// php artisan make:seed TodoSeeder
class TodosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // panggil factory
        // lalu Todo model
        // lalu buat fake 10 data/records
        factory(App\Todo::class, 5)->create();
        // ganti menjadi 5 data saja
        // php artisan migrate:refresh --seed
    }
}
