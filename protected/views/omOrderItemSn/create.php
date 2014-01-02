<?php
/* @var $this OmOrderItemSnController */
/* @var $model OmOrderItemSn */

$this->breadcrumbs=array(
	'Om Order Item Sns'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List OmOrderItemSn', 'url'=>array('index')),
	array('label'=>'Manage OmOrderItemSn', 'url'=>array('admin')),
);
?>

<h1>Create OmOrderItemSn</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>