<?php
/* @var $this PvFilController */
/* @var $model PvFil */

$this->breadcrumbs=array(
	'Pv Fils'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PvFil', 'url'=>array('index')),
	array('label'=>'Create PvFil', 'url'=>array('create')),
	array('label'=>'View PvFil', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PvFil', 'url'=>array('admin')),
);
?>

<h1>Update PvFil <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>