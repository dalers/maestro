<?php
/* @var $this OmOrderItemSnController */
/* @var $model OmOrderItemSn */

$this->breadcrumbs=array(
	'Om Order Item Sns'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List OmOrderItemSn', 'url'=>array('index')),
	array('label'=>'Create OmOrderItemSn', 'url'=>array('create')),
	array('label'=>'Update OmOrderItemSn', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete OmOrderItemSn', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage OmOrderItemSn', 'url'=>array('admin')),
);
?>

<h1>View OmOrderItemSn #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'order_item_id',
		'stock_serial_id',
	),
)); ?>
