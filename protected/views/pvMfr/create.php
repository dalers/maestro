<?php
/* @var $this PvMfrController */
/* @var $model PvMfr */

$this->breadcrumbs=array(
	'Pv Mfrs'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PvMfr', 'url'=>array('index')),
	array('label'=>'Manage PvMfr', 'url'=>array('admin')),
);
?>

<h1>Create PvMfr</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>