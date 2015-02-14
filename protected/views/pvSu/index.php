<?php
/* @var $this PvSuController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Pv Sus',
);

$this->menu=array(
	array('label'=>'Create PvSu', 'url'=>array('create')),
	array('label'=>'Manage PvSu', 'url'=>array('admin')),
);
?>

<h1>Pv Sus</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
