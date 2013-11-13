<?php
/* @var $this StockLocationController */
/* @var $model StockLocation */

$this->breadcrumbs=array(
	'Stock Locations'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List StockLocation', 'url'=>array('index')),
	array('label'=>'Manage StockLocation', 'url'=>array('admin')),
);
?>

<h1>Create StockLocation</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>