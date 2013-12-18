<?php
/* @var $this ToolTypeController */
/* @var $model ToolType */

$this->breadcrumbs=array(
	'Tool Types'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List ToolType', 'url'=>array('index')),
	array('label'=>'Create ToolType', 'url'=>array('create')),
	array('label'=>'View ToolType', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage ToolType', 'url'=>array('admin')),
);
?>

<h1>Update ToolType <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>