<?php
/* @var $this OmOrderItemSnController */
/* @var $model OmOrderItemSn */

$this->breadcrumbs=array(
	'Om Order Item Sns'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List OmOrderItemSn', 'url'=>array('index')),
	array('label'=>'Create OmOrderItemSn', 'url'=>array('create')),
	array('label'=>'View OmOrderItemSn', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage OmOrderItemSn', 'url'=>array('admin')),
);
?>

<h1>Update OmOrderItemSn <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>