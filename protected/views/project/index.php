<?php
/* @var $this ProjectController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Projects',
);

$this->menu=array(
	array('label'=>'Create Project', 'url'=>array('create')),
	array('label'=>'Manage Project', 'url'=>array('admin')),
);
?>

<h1>Projects</h1>

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
			'value'=>'CHtml::link(CHtml::encode($data->id), array(\'view\', \'id\' => $data->id))',
		),
        array(
			'name'=>'acct1',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->acct1)',
		),
        array(
			'name'=>'acct2',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->acct2)',
		),
        array(
			'name'=>'acct3',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->acct3)',
		),
		array(
			'name'=>'acct4',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->acct4)',
		),
		array(
			'name'=>'name',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->name)',
		),
		array(
			'name'=>'client',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->client)',
		),
	),
));

?>
