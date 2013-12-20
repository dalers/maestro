<?php
/* @var $this OmProjectOrderController */
/* @var $model OmProjectOrder */

$this->breadcrumbs=array(
	'Om Project Orders'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List OmProjectOrder', 'url'=>array('index')),
	array('label'=>'Create OmProjectOrder', 'url'=>array('create')),
	array('label'=>'View OmProjectOrder', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage OmProjectOrder', 'url'=>array('admin')),
);
?>

<h1>Update OmProjectOrder <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>