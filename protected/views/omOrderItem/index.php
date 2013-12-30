<?php
/* @var $this OmOrderItemController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Order Items',
);

$this->menu=array(
	array('label'=>'Create Order Item', 'url'=>array('create')),
	array('label'=>'Manage Order Item', 'url'=>array('admin')),
);
?>

<h1>Om Order Items</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
