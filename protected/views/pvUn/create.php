<?php
/* @var $this PvUnController */
/* @var $model PvUn */

$this->breadcrumbs=array(
	'Pv Uns'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PvUn', 'url'=>array('index')),
	array('label'=>'Manage PvUn', 'url'=>array('admin')),
);
?>

<h1>Create PvUn</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>