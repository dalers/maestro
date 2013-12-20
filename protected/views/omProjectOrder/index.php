<?php
/* @var $this OmProjectOrderController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Om Project Orders',
);

$this->menu=array(
	array('label'=>'Create OmProjectOrder', 'url'=>array('create')),
	array('label'=>'Manage OmProjectOrder', 'url'=>array('admin')),
);
?>

<h1>Om Project Orders</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
