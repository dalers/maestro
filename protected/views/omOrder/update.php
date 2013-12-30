<?php
/* @var $this OmOrderController */
/* @var $model OmOrder */

$this->breadcrumbs=array(
	'Orders'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List All Orders', 'url'=>array('index')),
	array('label'=>'Create New Order', 'url'=>array('create')),
	array('label'=>'View This Order', 'url'=>array('view', 'id'=>$model->id, 'iteration'=>$model->iteration)),
	//array('label'=>'Manage Order', 'url'=>array('admin')),
);
?>

<h1>Update Order <?php echo $model->id; ?> - Revision # <?php echo $model->iteration; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>