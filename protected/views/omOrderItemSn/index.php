<?php
/* @var $this OmOrderItemSnController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Om Order Item Sns',
);

$this->menu=array(
	array('label'=>'Create OmOrderItemSn', 'url'=>array('create')),
	array('label'=>'Manage OmOrderItemSn', 'url'=>array('admin')),
);
?>

<h1>Om Order Item Sns</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
