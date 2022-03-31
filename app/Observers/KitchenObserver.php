<?php

namespace App\Observers;

use App\Kitchen;
use TCG\Voyager\Models\MenuItem;

class KitchenObserver
{
    public function created()
    {
        MenuItem::whereParentId(21)->delete();
        $kitchens = Kitchen::all();
        foreach ($kitchens as $kitchen) {
            MenuItem::create([
                'menu_id' => 1,
                'title' => $kitchen->name,
                'route' => 'meals_calendar',
                'icon_class' => 'voyager-dot',
                'parameters' => json_encode(['kitchen_id' => $kitchen->id]),
                'parent_id' => 21,
            ]);
        }
    }

    public function deleted()
    {
        MenuItem::whereParentId(21)->delete();
        $kitchens = Kitchen::all();
        foreach ($kitchens as $kitchen) {
            MenuItem::create([
                'menu_id' => 1,
                'title' => $kitchen->name,
                'route' => 'meals_calendar',
                'icon_class' => 'voyager-dot',
                'parameters' => json_encode(['kitchen_id' => $kitchen->id]),
                'parent_id' => 21,
            ]);
        }
    }
}
