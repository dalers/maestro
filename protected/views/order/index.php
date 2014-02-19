<?php
/* @var $this OrderController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Orders',
);

$this->menu=array(
	array('label'=>'Create New Order', 'url'=>array('create')),
	//array('label'=>'Manage Order', 'url'=>array('admin')),
);
?>

<h1>Orders</h1>

<?php

$this->widget('zii.widgets.grid.CGridView', array(
    'id' => 'detail_childs_id',
	'dataProvider' => $dataProvider,
	'filter' => $model,
	'columns' => array(
		array(
			'name'=> 'id',
            'htmlOptions'=>array('style'=>'width: 15px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->id), array(\'view\', \'id\' => $data->id))',
		),
		array(
			'name'=>'name',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 25px; text-align: center;'),
			'value'=>'CHtml::encode($data->name)',
		),
		array(
			'name'=>'type',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 25px; text-align: center;'),
			'value'=>'CHtml::encode($data->type)',
		),
		array(
			'name'=>'status',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 25px; text-align: center;'),
			'value'=>'CHtml::encode($data->status)',
		),
		array(
			'name'=>'project_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 25px; text-align: center;'),
			'value'=>'CHtml::encode($data->project_id)',
		),
	),
));

?>
