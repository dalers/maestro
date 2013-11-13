<?php
/* @var $this PvCurController */
/* @var $model PvCur */

$this->breadcrumbs=array(
	'Pv Curs'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PvCur', 'url'=>array('index')),
	array('label'=>'Manage PvCur', 'url'=>array('admin')),
);
?>

<h1>Create PvCur</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>