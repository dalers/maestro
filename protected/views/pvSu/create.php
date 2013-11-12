<?php
/* @var $this PvSuController */
/* @var $model PvSu */

$this->breadcrumbs=array(
	'Pv Sus'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PvSu', 'url'=>array('index')),
	array('label'=>'Manage PvSu', 'url'=>array('admin')),
);
?>

<h1>Create PvSu</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>