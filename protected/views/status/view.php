<?php
/* @var $this StatusController */
/* @var $model Status */

$this->breadcrumbs=array(
	'Statuses'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Status', 'url'=>array('index')),
	array('label'=>'Create Status', 'url'=>array('create')),
	array('label'=>'Update Status', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Status', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Status', 'url'=>array('admin')),
);
?>

<h1>View Status #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
	),
)); ?>
