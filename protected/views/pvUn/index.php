<?php
/* @var $this PvUnController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Pv Uns',
);

$this->menu=array(
	array('label'=>'Create PvUn', 'url'=>array('create')),
	array('label'=>'Manage PvUn', 'url'=>array('admin')),
);
?>

<h1>Pv Uns</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
