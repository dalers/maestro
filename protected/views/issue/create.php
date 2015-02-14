<?php
/* @var $this IssueController */
/* @var $model Issue */

$this->breadcrumbs=array(
	'Issues'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Issue', 'url'=>array('index')),
	array('label'=>'Manage Issue', 'url'=>array('admin')),
);
?>

<h1>Create Issue</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>