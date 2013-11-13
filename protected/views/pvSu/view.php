<?php
/* @var $this PvSuController */
/* @var $model PvSu */

$this->breadcrumbs=array(
	'Pv Sus'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List PvSu', 'url'=>array('index')),
	array('label'=>'Create PvSu', 'url'=>array('create')),
	array('label'=>'Update PvSu', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PvSu', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PvSu', 'url'=>array('admin')),
);
?>

<h1>View PvSu #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'SUSupplier',
		'SUAddress',
		'SUCountry',
		'SUPhone1',
		'SUPhone2',
		'SUFAX',
		'SUWeb',
		'SUContact1',
		'SUContact2',
		'SUDateLast',
		'SUFollowup',
		'SUNotes',
		'SUCode',
		'SUAccount',
		'SUTerms',
		'SUFedTaxID',
		'SUStateTaxID',
		'SUEMail1',
		'SUEMail2',
		'SUCurDedExRate',
		'SUCurExRate',
		'SUCURID',
		'SUCurReverse',
		'SUNoPhonePrefix',
	),
)); ?>
