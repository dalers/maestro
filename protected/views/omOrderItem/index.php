<?php
/* @var $this OmOrderItemController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Om Order Items',
);

$this->menu=array(
	array('label'=>'Create OmOrderItem', 'url'=>array('create')),
	array('label'=>'Manage OmOrderItem', 'url'=>array('admin')),
);
?>

<h1>Om Order Items</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
