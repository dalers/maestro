<?php
/* @var $this OmOrderItemController */
/* @var $model OmOrderItem */

$this->breadcrumbs=array(
	'Om Order Items'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List OmOrderItem', 'url'=>array('index')),
	array('label'=>'Manage OmOrderItem', 'url'=>array('admin')),
);
?>

<h1>Create OmOrderItem</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>