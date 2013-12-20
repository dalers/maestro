<?php
/* @var $this OmOrderItemController */
/* @var $model OmOrderItem */

$this->breadcrumbs=array(
	'Om Order Items'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List OmOrderItem', 'url'=>array('index')),
	array('label'=>'Create OmOrderItem', 'url'=>array('create')),
	array('label'=>'View OmOrderItem', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage OmOrderItem', 'url'=>array('admin')),
);
?>

<h1>Update OmOrderItem <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>