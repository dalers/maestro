<?php
/* @var $this OmOrderController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Orders',
);

$this->menu=array(
	array('label'=>'Create Order', 'url'=>array('create')),
	array('label'=>'Manage Order', 'url'=>array('admin')),
);
?>

<h1>Orders</h1>

<?php

$this->widget('zii.widgets.grid.CGridView', array(
    'id' => 'cgridview',
	'dataProvider' => $dataProvider,
	'filter' => $model,
	'columns' => array(
		array(
			'name'=> 'id',
            'htmlOptions'=>array('style'=>'width: 15px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->id), array(\'view\', \'id\' => $data->id, \'iteration\' => $data->iteration))',
		),
		array(
			'name'=> 'iteration',
            'htmlOptions'=>array('style'=>'width: 15px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->iteration), array(\'view\', \'id\' => $data->id, \'iteration\' => $data->iteration))',
		),
        array(
			'name'=>'size',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 25px; text-align: center;'),
			'value'=>'CHtml::encode($data->size)',
		),
        array(
			'name'=>'tool_type',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->tool_type)',
		),
        array(
			'name'=>'locale',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->locale)',
		),
		array(
			'name'=>'order_type',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 25px; text-align: center;'),
			'value'=>'CHtml::encode($data->order_type)',
		),
		array(
			'name'=>'status',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 25px; text-align: center;'),
			'value'=>'CHtml::encode($data->status)',
		),
	),
));

?>
