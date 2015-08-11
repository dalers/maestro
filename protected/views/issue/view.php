<?php
/* @var $this IssueController */
/* @var $model Issue */

$this->breadcrumbs=array(
	'Issue'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Issues', 'url'=>array('index')),
	array('label'=>'Create Issue', 'url'=>array('create', 'pid'=>$model->project->id)),
	array('label'=>'Update Issue', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Issue', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	//array('label'=>'Manage Issues', 'url'=>array('admin', 'pid'=>$model->project->id)),
	array('label'=>'List Project Issues', 'url'=>array('indexProject', 'pid'=>$model->project->id)),
);
?>

<h1>View Issue #<?php echo $model->id; ?></h1>

<p>Created: <?php echo empty($model->create_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "<em>unknown</em>" : $model->createUser->username; ?>
<br />Updated:  <?php echo empty($model->update_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "<em>unknown</em>" : $model->updateUser->username; ?>
</p>

<h2>Issue Master</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'description',
		'begin_date',
		'end_date',
		'duration',
		'completion',
		'outline_number',
		'cost',
		'web_link',
		array(
			'name'=>'owner_id',
				'value'=>isset($model->owner)?CHtml::encode($model->owner->username):"unknown"
		),
		array(
			'name'=>'project_id',
				'value'=>isset($model->project)?CHtml::encode($model->project->name):"unknown"
		),		
		array(        
			'name'=>'requester_id',
				'value'=>isset($model->requester)?CHtml::encode($model->requester->username):"unknown"
		),
		array(
		  'name'=>'status_id',
			'value'=>CHtml::encode($model->getStatusText())
		),
		array(
		  'name'=>'type_id',
			'value'=>CHtml::encode($model->getTypeText())
		),
	),
)); ?>

<br /><br />
<h2>Additional Information</h2>
</p>

<!-- DIV's for jQuery tab control. Tab control is initialized at end of file via JavaScript -->
<div id="tabs">

<!-- Create jQuery tabs using <li> tags -->
<ul>
	<li><a href="#tab-parts">Parts</a></li>
	<li><a href="#tab-comments">Comments</a></li>
	<li><a href="#tab-files">Files</a></li>
	<li><a href="#tab-issues">Issues</a></li>
	<li><a href="#tab-orders">Orders</a></li>
	<li><a href="#tab-stock">Stock</a></li>
	<li><a href="#tab-projects">Projects</a></li>
</ul>

<div id="tab-parts">
<h2>Parts</h2>
<p><em>There are no parts associated with this issue.</em></p>
</div> <!-- <div id="tab-parts"> -->

<div id="tab-comments">
<h2>Comments</h2>
<p><em>There are no comments associated with this issue.</em></p>
</div> <!-- <div id="tab-comments"> -->

<div id="tab-files">
<h2>Files</h2>
<p><em>There are no files associated with this issue.</em></p>
</div> <!-- <div id="tab-files"> -->

<div id="tab-issues">
<h2>Related Issues</h2>
<p><em>There are no related issues to this issue.</em></p>
</div> <!-- <div id="tab-orders"> -->

<div id="tab-orders">
<h2>Orders</h2>
<p><em>There are no orders associated with this issue.</em></p>
</div> <!-- <div id="tab-orders"> -->

<div id="tab-stock">
<h2>Stock</h2>
<p><em>There is no stock associated with this issue.</em></p>
</div> <!-- <div id="tab-stock"> -->

<div id="tab-projects">
<h2>Projects</h2>
<p><em>There are no projects associated with this issue.</em></p>
</div> <!-- <div id="tab-projects"> -->

</div> <!-- <div id="tabs"> -->
<!-- The following code initializes DIV's above as TAB control -->

<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>