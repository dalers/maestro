<?php
/* @var $this OmSizeController */
/* @var $model OmSize */

$this->breadcrumbs=array(
	'Om Sizes'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List OmSize', 'url'=>array('index')),
	array('label'=>'Manage OmSize', 'url'=>array('admin')),
);
?>

<h1>Create OmSize</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>