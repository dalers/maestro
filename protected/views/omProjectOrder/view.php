<?php
/* @var $this OmProjectOrderController */
/* @var $model OmProjectOrder */

$this->breadcrumbs=array(
	'Om Project Orders'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List OmProjectOrder', 'url'=>array('index')),
	array('label'=>'Create OmProjectOrder', 'url'=>array('create')),
	array('label'=>'Update OmProjectOrder', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete OmProjectOrder', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage OmProjectOrder', 'url'=>array('admin')),
);
?>

<h1>View OmProjectOrder #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'project_id',
		'order_id',
	),
)); ?>
