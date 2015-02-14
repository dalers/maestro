<?php
/* @var $this PvTypeController */
/* @var $model PvType */

$this->breadcrumbs=array(
	'Pv Types'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PvType', 'url'=>array('index')),
	array('label'=>'Manage PvType', 'url'=>array('admin')),
);
?>

<h1>Create PvType</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>