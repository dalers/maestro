<?php
/* @var $this PvPnController */
/* @var $model PvPn */

$this->breadcrumbs=array(
	'Pv Pns'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PvPn', 'url'=>array('index')),
	array('label'=>'Create PvPn', 'url'=>array('create')),
	array('label'=>'View PvPn', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PvPn', 'url'=>array('admin')),
);
?>

<h1>Update PvPn <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>