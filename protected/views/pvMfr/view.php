<?php
/* @var $this PvMfrController */
/* @var $model PvMfr */

$this->breadcrumbs=array(
	'Pv Mfrs'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List PvMfr', 'url'=>array('index')),
	array('label'=>'Create PvMfr', 'url'=>array('create')),
	array('label'=>'Update PvMfr', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PvMfr', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PvMfr', 'url'=>array('admin')),
);
?>

<h1>View PvMfr #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'MFRMfrName',
		'MFRAddress',
		'MFRCountry',
		'MFRContact1',
		'MFRContact2',
		'MFRPhone1',
		'MFRPhone2',
		'MFRFax',
		'MFRWeb',
		'MFRNotes',
		'MFRCode',
		'MFREMail1',
		'MFREMail2',
		'MFRNoPhonePrefix',
	),
)); ?>
