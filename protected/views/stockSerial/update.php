<?php
/* @var $this StockSerialController */
/* @var $model StockSerial */

$this->breadcrumbs=array(
	'Stock Serials'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List StockSerial', 'url'=>array('index')),
	array('label'=>'Create StockSerial', 'url'=>array('create')),
	array('label'=>'View StockSerial', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage StockSerial', 'url'=>array('admin')),
);
?>

<h1>Update StockSerial <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>