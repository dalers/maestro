<?php
/* @var $this PvFilController */
/* @var $model PvFil */

$this->breadcrumbs=array(
	'Pv Fils'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List PvFil', 'url'=>array('index')),
	array('label'=>'Create PvFil', 'url'=>array('create')),
	array('label'=>'Update PvFil', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PvFil', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PvFil', 'url'=>array('admin')),
);
?>

<h1>View PvFil #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'FILPNID',
		'FILPNPartNumber',
		'FILFilePath',
		'FILFileName',
		'FILView',
		'FILNotes',
	),
)); ?>
