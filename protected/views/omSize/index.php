<?php
/* @var $this OmSizeController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Om Sizes',
);

$this->menu=array(
	array('label'=>'Create OmSize', 'url'=>array('create')),
	array('label'=>'Manage OmSize', 'url'=>array('admin')),
);
?>

<h1>Om Sizes</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
