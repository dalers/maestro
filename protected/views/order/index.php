<?php
/* @var $this OrderController */
/* @var $model PvPn */
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
			'name'=> 'reman_no',
            'htmlOptions'=>array('style'=>'width: 20px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->reman_no), array(\'view\', \'id\' => $data->id))',
		),
		array(
			'name'=> 'job_no',
            'htmlOptions'=>array('style'=>'width: 20px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->job_no), array(\'view\', \'id\' => $data->id))',
		),
        array(
			'name'=>'client_id',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->client->name)',
		),
        array(
			'name'=>'size_id',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->size->name)',
		),
        array(
			'name'=>'shipment_dt',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->shipment_dt)',
		),
        array(
			'name'=>'person_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->person->username)',
		),
	),
));

?>
