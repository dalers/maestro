<?php
/* @var $this OmOrderItemSnController */
/* @var $model OmOrderItemSn */

$this->breadcrumbs=array(
	'Serial Number'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Serial Numbers', 'url'=>array('index')),
	array('label'=>'Create Serial Number', 'url'=>array('create')),
	array('label'=>'View Serial Number', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Serial Number', 'url'=>array('admin')),
);
?>

<h1>Update Serial Number <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>