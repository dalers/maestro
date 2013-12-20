<?php
/* @var $this OmSizeController */
/* @var $model OmSize */

$this->breadcrumbs=array(
	'Om Sizes'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List OmSize', 'url'=>array('index')),
	array('label'=>'Create OmSize', 'url'=>array('create')),
	array('label'=>'View OmSize', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage OmSize', 'url'=>array('admin')),
);
?>

<h1>Update OmSize <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>