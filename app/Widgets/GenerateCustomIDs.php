<?php

namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use TCG\Voyager\Widgets\BaseDimmer;

class GenerateCustomIDs extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        //

        return view('widgets.generate_custom_ids', [
            'config' => $this->config,
            'meals' => []
        ]);
    }
}
