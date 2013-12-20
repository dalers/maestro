<?php
/* @var $this OmToolTypeController */
/* @var $model OmToolType */

$this->breadcrumbs=array(
	'Om Tool Types'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List OmToolType', 'url'=>array('index')),
	array('label'=>'Create OmToolType', 'url'=>array('create')),
	array('label'=>'Update OmToolType', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete OmToolType', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage OmToolType', 'url'=>array('admin')),
);
?>

<h1>View OmToolType #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
	),
)); ?>
