<?php
/* @var $this StockSerialController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Material',
);

$this->menu=array(
	array('label'=>'Create Stock', 'url'=>array('create')),
	array('label'=>'Manage Stock', 'url'=>array('admin')),
);
?>

<h1>Stock</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'stock-serial-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'serial_number',
		'part_number',
		'description',
		'version',
		'status',
		/*
		'part_id',
		*/
		/*array(
			'class'=>'CButtonColumn',
		),
		*/
	),
)); ?>
