<?php
/* @var $this PvFilController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Pv Fils',
);

$this->menu=array(
	array('label'=>'Create PvFil', 'url'=>array('create')),
	array('label'=>'Manage PvFil', 'url'=>array('admin')),
);
?>

<h1>Pv Fils</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
