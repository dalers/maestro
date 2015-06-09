<?php
/* @var $this CustomerController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Customers',
);

$this->menu=array(
	array('label'=>'Create Customer', 'url'=>array('create')),
	array('label'=>'Manage Customer', 'url'=>array('admin')),
);
?>

<h1>Customers</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'customer-grid',
	//'dataProvider'=>$model->search(),
	'dataProvider' => $dataProvider,	
	'filter'=>$model,
	'columns'=>array(
		array(
			'name'=> 'CUCode',
			'htmlOptions'=>array('style'=>'width: 100px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->CUCode), array(\'view\', \'id\' => $data->id))',
		),
		'CUCustomer',
		'CUContact1',
		'CUPhone1',
		'CUEmail1',
		/*
		'CUAddress',
		'CUShipAddress',
		'CUContact2',
		'CUPhone2',
		'CUFax',
		'CUEmail2',
		'CUNotes',
		'CUWeb',
		'CUCode',
		'CUAccount',
		'CUTerms',
		'CUFedTaxID',
		'CUStateTaxID',
		'CUNoPhonePrefix',
		*/
		/*
		array('class'=>'CButtonColumn',
		), */
	),	
)); ?>
