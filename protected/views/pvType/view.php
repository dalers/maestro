<?php
/* @var $this PvTypeController */
/* @var $model PvType */

$this->breadcrumbs=array(
	'Pv Types'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List PvType', 'url'=>array('index')),
	array('label'=>'Create PvType', 'url'=>array('create')),
	array('label'=>'Update PvType', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PvType', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PvType', 'url'=>array('admin')),
);
?>

<h1>View PvType #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'TYPEType',
	),
)); ?>
