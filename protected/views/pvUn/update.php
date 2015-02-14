<?php
/* @var $this PvUnController */
/* @var $model PvUn */

$this->breadcrumbs=array(
	'Pv Uns'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PvUn', 'url'=>array('index')),
	array('label'=>'Create PvUn', 'url'=>array('create')),
	array('label'=>'View PvUn', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PvUn', 'url'=>array('admin')),
);
?>

<h1>Update PvUn <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>