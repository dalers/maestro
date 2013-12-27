<?php
/* @var $this OmOrderItemController */
/* @var $model OmOrderItem */

$this->breadcrumbs=array(
	'Om Order Items'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List OmOrderItem', 'url'=>array('index')),
	array('label'=>'Create OmOrderItem', 'url'=>array('create')),
	array('label'=>'Update OmOrderItem', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete OmOrderItem', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage OmOrderItem', 'url'=>array('admin')),
);
?>

<h1>View OmOrderItem #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'order_id',
		'part_id',
		'serial_no',
		'action',
	),
)); ?>
