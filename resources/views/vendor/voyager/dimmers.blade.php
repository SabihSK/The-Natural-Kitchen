@php
$dimmers = Voyager::dimmers();
$count = $dimmers->count();
$classes = [
    'col-md-8 col-md-offset-2',
];
$class = implode(' ', $classes);
$prefix = "<div class='{$class}'>";
$surfix = '</div>';
@endphp
@if ($dimmers->any())
<div class="clearfix container-fluid row">
    {!! $prefix.$dimmers->setSeparator($surfix.$prefix)->display().$surfix !!}
</div>
@endif
