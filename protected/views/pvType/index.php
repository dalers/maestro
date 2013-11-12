<?php
/* @var $this PvTypeController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Pv Types',
);

$this->menu=array(
	array('label'=>'Create PvType', 'url'=>array('create')),
	array('label'=>'Manage PvType', 'url'=>array('admin')),
);
?>

<h1>Pv Types</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
