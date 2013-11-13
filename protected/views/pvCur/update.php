<?php
/* @var $this PvCurController */
/* @var $model PvCur */

$this->breadcrumbs=array(
	'Pv Curs'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PvCur', 'url'=>array('index')),
	array('label'=>'Create PvCur', 'url'=>array('create')),
	array('label'=>'View PvCur', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PvCur', 'url'=>array('admin')),
);
?>

<h1>Update PvCur <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>