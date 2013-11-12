<?php
/* @var $this PvSuController */
/* @var $model PvSu */

$this->breadcrumbs=array(
	'Pv Sus'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PvSu', 'url'=>array('index')),
	array('label'=>'Create PvSu', 'url'=>array('create')),
	array('label'=>'View PvSu', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PvSu', 'url'=>array('admin')),
);
?>

<h1>Update PvSu <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>