<?php
/* @var $this OmOrderController */
/* @var $model OmOrder */

$this->breadcrumbs=array(
	'Orders'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List All Order', 'url'=>array('index')),
	//array('label'=>'Manage Order', 'url'=>array('admin')),
);
?>

<h1>Create Order</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>