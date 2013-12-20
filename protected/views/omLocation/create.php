<?php
/* @var $this OmLocationController */
/* @var $model OmLocation */

$this->breadcrumbs=array(
	'Locations'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Location', 'url'=>array('index')),
	array('label'=>'Manage Location', 'url'=>array('admin')),
);
?>

<h1>Create OmLocation</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>