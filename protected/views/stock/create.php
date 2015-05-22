<?php
/* @var $this StockSerialController */
/* @var $model StockSerial */

$this->breadcrumbs=array(
	'Stock Serials'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List StockSerial', 'url'=>array('index')),
	array('label'=>'Manage StockSerial', 'url'=>array('admin')),
);
?>

<h1>Create StockSerial</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>