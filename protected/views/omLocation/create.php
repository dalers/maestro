<?php
/* @var $this OmLocationController */
/* @var $model OmLocation */

$this->breadcrumbs=array(
	'Om Locations'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List OmLocation', 'url'=>array('index')),
	array('label'=>'Manage OmLocation', 'url'=>array('admin')),
);
?>

<h1>Create OmLocation</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>