<?php
/* @var $this PvMfrController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Pv Mfrs',
);

$this->menu=array(
	array('label'=>'Create PvMfr', 'url'=>array('create')),
	array('label'=>'Manage PvMfr', 'url'=>array('admin')),
);
?>

<h1>Pv Mfrs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
