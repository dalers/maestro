<?php
/* @var $this OmToolTypeController */
/* @var $model OmToolType */

$this->breadcrumbs=array(
	'Om Tool Types'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List OmToolType', 'url'=>array('index')),
	array('label'=>'Manage OmToolType', 'url'=>array('admin')),
);
?>

<h1>Create OmToolType</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>