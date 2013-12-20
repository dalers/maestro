<?php
/* @var $this OmLocationController */
/* @var $model OmLocation */

$this->breadcrumbs=array(
	'Om Locations'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List OmLocation', 'url'=>array('index')),
	array('label'=>'Create OmLocation', 'url'=>array('create')),
	array('label'=>'View OmLocation', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage OmLocation', 'url'=>array('admin')),
);
?>

<h1>Update OmLocation <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>