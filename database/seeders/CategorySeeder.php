<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        collect([
            ['name' => $name = 'Blog', 'slug' => str($name)->slug()],
            ['name' => $name = 'Tutorial', 'slug' => str($name)->slug()],
            ['name' => $name = 'Package', 'slug' => str($name)->slug()],
        ])->each(fn($category) => Category::create($category));
    }
}
