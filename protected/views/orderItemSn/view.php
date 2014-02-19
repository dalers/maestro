<?php
/* @var $this OrderItemSnController */
/* @var $model OrderItemSn */

$this->breadcrumbs=array(
	'Serial Number'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Serial Numbers', 'url'=>array('index')),
	array('label'=>'Create Serial Number', 'url'=>array('create')),
	array('label'=>'Update Serial Number', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Serial Number', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Serial Number', 'url'=>array('admin')),
);
?>

<h1>View Serial Number #<?php echo $model->id; ?> for Order Item #<?php echo $model->orderItem->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'order_item_id',
		'stock_serial_id',
	),
)); ?>
