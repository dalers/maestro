<?php
/* @var $this OmOrderController */
/* @var $model OmOrder */

$this->breadcrumbs=array(
	'Om Orders'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List OmOrder', 'url'=>array('index')),
	array('label'=>'Manage OmOrder', 'url'=>array('admin')),
);
?>

<h1>Create OmOrder</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>