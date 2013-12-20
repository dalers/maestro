<?php
/* @var $this OmLocationController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Om Locations',
);

$this->menu=array(
	array('label'=>'Create OmLocation', 'url'=>array('create')),
	array('label'=>'Manage OmLocation', 'url'=>array('admin')),
);
?>

<h1>Om Locations</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
