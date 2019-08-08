<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use Faker\Generator as Faker;

// php artisan make:factory TodoFactory
// ganti dengan model Todo
$factory->define(\App\Todo::class, function (Faker $faker) {
    return [
        // generate fake factory
        'name' => $faker->sentence(3),
        'description' => $faker->paragraph(4),
        'completed' => false
    ];
});
