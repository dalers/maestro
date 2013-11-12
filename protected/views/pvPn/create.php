<?php
/* @var $this PvPnController */
/* @var $model PvPn */

$this->breadcrumbs=array(
	'Pv Pns'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PvPn', 'url'=>array('index')),
	array('label'=>'Manage PvPn', 'url'=>array('admin')),
);
?>

<h1>Create PvPn</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>