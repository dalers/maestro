<?php
/* @var $this IssueController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Issues',
);

$this->menu=array(
	//TODO show menu in this view
	//winesett (trackstar) has menu commented, when at least for consistency
	//a menu should be rendered with selections Create and Manage. Commenting
	//the menu selections may have been the "easy" hack, becuase it seems
	//an issue model is not passed to this view, and so no model to set
	//project_id on as was done in similar views.
	//
	array('label'=>'Create Issue', 'url'=>array('create')),
	//array('label'=>'Manage Issue', 'url'=>array('admin')),
);
?>

<h1>Issues</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
