<?php
/* @var $this ToolTypeController */
/* @var $model ToolType */

$this->breadcrumbs=array(
	'Tool Types'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List ToolType', 'url'=>array('index')),
	array('label'=>'Manage ToolType', 'url'=>array('admin')),
);
?>

<h1>Create ToolType</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>