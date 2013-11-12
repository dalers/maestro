<?php
/* @var $this PvPnController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Pv Pns',
);

$this->menu=array(
	array('label'=>'Create PvPn', 'url'=>array('create')),
	array('label'=>'Manage PvPn', 'url'=>array('admin')),
);
?>

<h1>Pv Pns</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
