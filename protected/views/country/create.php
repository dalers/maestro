<?php
/* @var $this CountryController */
/* @var $model Country */

$this->breadcrumbs=array(
	'Countries'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Country', 'url'=>array('index')),
	array('label'=>'Manage Country', 'url'=>array('admin')),
);
?>

<h1>Create Country</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>