<?php
/* @var $this PartController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Parts',
);

$this->menu=array(
	array('label'=>'Create Part', 'url'=>array('create')),
	array('label'=>'Manage Parts', 'url'=>array('admin')),
	array('label'=>'Save As CSV', 'url'=> array('saveAsCSV')),
);
?>

<h1>Parts</h1>

<?php

$this->widget('zii.widgets.grid.CGridView', array(
    'id' => 'cgridview',
	'dataProvider' => $dataProvider,
	'filter' => $model,
	'columns' => array(
		array(
			'name'=> 'PNPartNumber',
            'htmlOptions'=>array('style'=>'width: 150px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->PNPartNumber), array(\'view\', \'id\' => $data->id))',
		),
        array(
			'name'=>'type_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->type_id)',
		),
        array(
			'name'=>'status_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->status_id)',
		),
        array(
			'name'=>'PNRevision',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->PNRevision)',
		),
		array(
			'name'=>'PNTitle',
            'htmlOptions'=>array('style'=>'width: 350px;'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->PNTitle)',
		),
		array(
			'name'=>'PNDetail',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->PNDetail)',
		),
		/*
		array(
			'class'=>'CButtonColumn',
		),*/
	),
));

?>