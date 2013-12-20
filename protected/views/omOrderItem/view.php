<?php
/* @var $this OmOrderItemController */
/* @var $model OmOrderItem */

$this->breadcrumbs=array(
	'Order Items'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Order Item', 'url'=>array('index')),
	array('label'=>'Create Order Item', 'url'=>array('create')),
	array('label'=>'Update Order Item', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Order Item', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Order Item', 'url'=>array('admin')),
);
?>

<h1>View Order Item #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'order_id',
		array(
            'label'=>'Part',
            'value'=>$model->part->PNTitle,
        ),
		'serial_no',
	),
)); ?>
