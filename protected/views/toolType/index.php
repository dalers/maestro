<?php
/* @var $this ToolTypeController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Tool Types',
);

$this->menu=array(
	array('label'=>'Create ToolType', 'url'=>array('create')),
	array('label'=>'Manage ToolType', 'url'=>array('admin')),
);
?>

<h1>Tool Types</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
