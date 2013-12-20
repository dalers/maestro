<?php
/* @var $this OmToolTypeController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Om Tool Types',
);

$this->menu=array(
	array('label'=>'Create OmToolType', 'url'=>array('create')),
	array('label'=>'Manage OmToolType', 'url'=>array('admin')),
);
?>

<h1>Om Tool Types</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
