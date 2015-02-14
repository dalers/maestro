<?php
/* @var $this PvCurController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Pv Curs',
);

$this->menu=array(
	array('label'=>'Create PvCur', 'url'=>array('create')),
	array('label'=>'Manage PvCur', 'url'=>array('admin')),
);
?>

<h1>Pv Curs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
