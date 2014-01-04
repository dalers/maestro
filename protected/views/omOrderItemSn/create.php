<?php
/* @var $this OmOrderItemSnController */
/* @var $model OmOrderItemSn */

$this->breadcrumbs=array(
	'Serial Number'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Serial Numbers', 'url'=>array('index')),
	array('label'=>'Manage Serial Numbers', 'url'=>array('admin')),
);
?>

<h1>Create Serial Number</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>