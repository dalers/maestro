<?php
/* @var $this SizeController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Sizes',
);

$this->menu=array(
	array('label'=>'Create Size', 'url'=>array('create')),
	array('label'=>'Manage Size', 'url'=>array('admin')),
);
?>

<h1>Sizes</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
