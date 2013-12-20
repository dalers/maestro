<?php
/* @var $this OmProjectOrderController */
/* @var $model OmProjectOrder */

$this->breadcrumbs=array(
	'Om Project Orders'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List OmProjectOrder', 'url'=>array('index')),
	array('label'=>'Manage OmProjectOrder', 'url'=>array('admin')),
);
?>

<h1>Create OmProjectOrder</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>