<?php
/* @var $this OmToolTypeController */
/* @var $model OmToolType */

$this->breadcrumbs=array(
	'Om Tool Types'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List OmToolType', 'url'=>array('index')),
	array('label'=>'Create OmToolType', 'url'=>array('create')),
	array('label'=>'View OmToolType', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage OmToolType', 'url'=>array('admin')),
);
?>

<h1>Update OmToolType <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>