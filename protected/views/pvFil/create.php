<?php
/* @var $this PvFilController */
/* @var $model PvFil */

$this->breadcrumbs=array(
	'Pv Fils'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PvFil', 'url'=>array('index')),
	array('label'=>'Manage PvFil', 'url'=>array('admin')),
);
?>

<h1>Create PvFil</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>