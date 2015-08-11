<?php
/* @var $this FileController */
/* @var $model File */

$this->breadcrumbs=array(
	'File'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Files', 'url'=>array('index')),
	array('label'=>'Create File', 'url'=>array('create')),
	array('label'=>'Update File', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete File', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage File', 'url'=>array('admin')),
);
?>

<h1>View File #<?php echo $model->id; ?></h1>

<p>Created: <?php echo empty($model->create_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "<em>unknown</em>" : $model->createUser->username; ?>
<br />Updated:  <?php echo empty($model->update_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "<em>unknown</em>" : $model->updateUser->username; ?>
</p>

<h2>File Master</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'FILPNPartNumber',
		'FILFilePath',
		'FILFileName',
		'FILView',
		'FILNotes',
		'part_id',
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
	<li><a href="#tab-issues">Issues</a></li>
	<li><a href="#tab-orders">Orders</a></li>
	<li><a href="#tab-stock">Stock</a></li>
	<li><a href="#tab-projects">Projects</a></li>
</ul>

<div id="tab-parts">
<h2>Parts</h2>
<p><em>There are no parts associated with this file.</em></p>
</div> <!-- <div id="tab-parts"> -->

<div id="tab-comments">
<h2>Comments</h2>
<p><em>There are no comments associated with this file.</em></p>
</div> <!-- <div id="tab-comments"> -->

<div id="tab-issues">
<h2>Issues</h2>
<p><em>There are no issues associated with this file.</em></p>
</div> <!-- <div id="tab-issues"> -->

<div id="tab-orders">
<h2>Orders</h2>
<p><em>There are no orders associated with this file.</em></p>
</div> <!-- <div id="tab-orders"> -->

<div id="tab-stock">
<h2>Stock</h2>
<p><em>There is no stock associated with this file.</em></p>
</div> <!-- <div id="tab-stock"> -->

<div id="tab-projects">
<h2>Projects</h2>
<p><em>There are no projects associated with this file.</em></p>
</div> <!-- <div id="tab-projects"> -->

</div> <!-- <div id="tabs"> -->
<!-- The following code initializes DIV's above as TAB control -->

<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>