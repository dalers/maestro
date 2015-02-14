<?php
/* @var $this PvMfrController */
/* @var $model PvMfr */

$this->breadcrumbs=array(
	'Pv Mfrs'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PvMfr', 'url'=>array('index')),
	array('label'=>'Create PvMfr', 'url'=>array('create')),
	array('label'=>'View PvMfr', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PvMfr', 'url'=>array('admin')),
);
?>

<h1>Update PvMfr <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>