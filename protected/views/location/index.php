<?php
/* @var $this LocationController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Locations',
);

$this->menu=array(
	array('label'=>'Create Location', 'url'=>array('create')),
	array('label'=>'Manage Location', 'url'=>array('admin')),
);
?>

<h1>Locations</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
