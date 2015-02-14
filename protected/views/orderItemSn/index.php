<?php
/* @var $this OrderItemSnController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Serial Number',
);

$this->menu=array(
	array('label'=>'Create Serial Number', 'url'=>array('create')),
	array('label'=>'Manage Serial Number', 'url'=>array('admin')),
);
?>

<h1>Serial Number</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
