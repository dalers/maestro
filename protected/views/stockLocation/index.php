<?php
/* @var $this StockLocationController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stock Locations',
);

$this->menu=array(
	array('label'=>'Create StockLocation', 'url'=>array('create')),
	array('label'=>'Manage StockLocation', 'url'=>array('admin')),
);
?>

<h1>Stock Locations</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
