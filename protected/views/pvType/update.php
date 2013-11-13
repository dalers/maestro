<?php
/* @var $this PvTypeController */
/* @var $model PvType */

$this->breadcrumbs=array(
	'Pv Types'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PvType', 'url'=>array('index')),
	array('label'=>'Create PvType', 'url'=>array('create')),
	array('label'=>'View PvType', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PvType', 'url'=>array('admin')),
);
?>

<h1>Update PvType <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>