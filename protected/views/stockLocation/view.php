<?php
/* @var $this StockLocationController */
/* @var $model StockLocation */

$this->breadcrumbs=array(
	'Stock Locations'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List StockLocation', 'url'=>array('index')),
	array('label'=>'Create StockLocation', 'url'=>array('create')),
	array('label'=>'Update StockLocation', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete StockLocation', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage StockLocation', 'url'=>array('admin')),
);
?>

<h1>View StockLocation #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'use_sublocation',
		'sublocation_min',
		'sublocation_max',
	),
)); ?>
