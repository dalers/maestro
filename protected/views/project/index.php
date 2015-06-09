<?php
/* @var $this ProjectController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Projects',
);

$this->menu=array(
	array('label'=>'Create Project', 'url'=>array('create')),
	array('label'=>'Manage Projects', 'url'=>array('admin')),
);
?>

<h1>Projects</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php $this->widget('zii.widgets.grid.CGridView', array(
    'id' => 'project-grid',
	'dataProvider' => $dataProvider,
	'filter' => $model,
	'columns' => array(
		array(
			'name'=> 'code',
			'htmlOptions'=>array('style'=>'width: 100px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->code), array(\'view\', \'id\' => $data->id))',
		),
		array(
			'name'=>'name',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>'width: 150px; text-align: left;'),
			'value'=>'CHtml::encode($data->name)',
		),
		array(
			'name'=>'customer_id',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->customer_id)',
		),
		array(
			'name'=>'owner_id',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->owner_id)',
		),
		array(
			'name'=>'phase_id',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->phase_id)',
		),
		array(
			'name'=>'status_id',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->status_id)',
		),
		array(
			'name'=>'type_id',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->type_id)',
		),
		/*
		'description',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
		*/
		/*
		array(
			'class'=>'CButtonColumn',
		),*/
	),
));

?>