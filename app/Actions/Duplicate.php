<?php


namespace App\Actions;


use TCG\Voyager\Actions\AbstractAction;

class Duplicate extends AbstractAction
{
    public function getTitle()
    {
        return 'Duplicate';
    }

    public function getIcon()
    {
        return 'voyager-documentation';
    }

    public function getPolicy()
    {
        return 'read';
    }

    public function getAttributes()
    {
        return [
            'class' => 'btn btn-sm btn-success pull-right',
            'style' => 'margin-right: 5px'
        ];
    }

    public function getDefaultRoute()
    {
        return route('duplicate-meal', $this->data->id);
    }

    public function shouldActionDisplayOnDataType()
    {
        return $this->dataType->slug == 'meals';
    }
}
