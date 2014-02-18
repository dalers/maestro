<?php
/* @var $this StockSerialController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Material',
);

$this->menu=array(
	array('label'=>'Create StockSerial', 'url'=>array('create')),
	array('label'=>'Manage StockSerial', 'url'=>array('admin')),
);
?>

<h1>Materials</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
