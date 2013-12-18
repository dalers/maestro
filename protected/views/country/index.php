<?php
/* @var $this CountryController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Countries',
);

$this->menu=array(
	array('label'=>'Create Country', 'url'=>array('create')),
	array('label'=>'Manage Country', 'url'=>array('admin')),
);
?>

<h1>Countries</h1>

<?php

$this->widget('zii.widgets.grid.CGridView', array(
    'id' => 'cgridview',
	'dataProvider' => $dataProvider,
	'filter' => $model,
	'columns' => array(
		array(
			'name'=> 'name',
            'htmlOptions'=>array('style'=>'width: 25px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->name), array(\'view\', \'id\' => $data->id))',
		),
	),
));

?>
