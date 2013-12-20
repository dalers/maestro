<?php
/* @var $this OmOrderItemController */
/* @var $model OmOrderItem */

$this->breadcrumbs=array(
	'Order Items'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Order Item', 'url'=>array('index')),
	array('label'=>'Manage Order Item', 'url'=>array('admin')),
);
?>

<h1>Create Order Item</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>