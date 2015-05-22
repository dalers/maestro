<?php
/* @var $this StockSerialController */
/* @var $model StockSerial */

$this->breadcrumbs=array(
	'Stock Serials'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List StockSerial', 'url'=>array('index')),
	array('label'=>'Create StockSerial', 'url'=>array('create')),
	array('label'=>'Update StockSerial', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete StockSerial', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage StockSerial', 'url'=>array('admin')),
);
?>

<h1>View StockSerial #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'serial_number',
		'part_number',
		'description',
		'version',
		'status',
		'part_id',
	),
)); ?>
