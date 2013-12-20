<?php
/* @var $this OmLocationController */
/* @var $model OmLocation */

$this->breadcrumbs=array(
	'Om Locations'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List OmLocation', 'url'=>array('index')),
	array('label'=>'Create OmLocation', 'url'=>array('create')),
	array('label'=>'Update OmLocation', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete OmLocation', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage OmLocation', 'url'=>array('admin')),
);
?>

<h1>View OmLocation #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
	),
)); ?>
