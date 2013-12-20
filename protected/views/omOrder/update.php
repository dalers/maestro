<?php
/* @var $this OmOrderController */
/* @var $model OmOrder */

$this->breadcrumbs=array(
	'Om Orders'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List OmOrder', 'url'=>array('index')),
	array('label'=>'Create OmOrder', 'url'=>array('create')),
	array('label'=>'View OmOrder', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage OmOrder', 'url'=>array('admin')),
);
?>

<h1>Update OmOrder <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>