<?php
/* @var $this PvUnController */
/* @var $model PvUn */

$this->breadcrumbs=array(
	'Pv Uns'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List PvUn', 'url'=>array('index')),
	array('label'=>'Create PvUn', 'url'=>array('create')),
	array('label'=>'Update PvUn', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PvUn', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PvUn', 'url'=>array('admin')),
);
?>

<h1>View PvUn #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'UNUseUnits',
		'UNPurchUnits',
		'UNConvUnits',
	),
)); ?>
