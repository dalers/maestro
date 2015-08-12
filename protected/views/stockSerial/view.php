<?php
/* @var $this StockSerialController */
/* @var $model StockSerial */

$this->breadcrumbs=array(
	'Stock Item'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Stock Items', 'url'=>array('index')),
	array('label'=>'Create Stock Item', 'url'=>array('create')),
	array('label'=>'Update Stock Item', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Stock Item', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	//array('label'=>'Manage Stock', 'url'=>array('admin')),
);
?>

<h1>View Stock Item #<?php echo $model->id; ?></h1>

<p>Created: <?php echo empty($model->create_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "<em>unknown</em>" : $model->createUser->username; ?>
<br />Updated:  <?php echo empty($model->update_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "<em>unknown</em>" : $model->updateUser->username; ?>
</p>

<h2>Stock Item Master</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'serial_number',
		'part_number',
		'description',
		'version',
		'status',
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
	<li><a href="#tab-comments">Comments</a></li>
	<li><a href="#tab-files">Files</a></li>
	<li><a href="#tab-issues">Issues</a></li>
	<li><a href="#tab-orders">Orders</a></li>
</ul>

<div id="tab-comments">
<h2>Comments</h2>
<p><em>There are no comments associated with this stock item.</em></p>
</div> <!-- <div id="tab-comments"> -->

<div id="tab-files">
<h2>Files</h2>
<p><em>There are no files associated with this stock item.</em></p>
</div> <!-- <div id="tab-files"> -->

<div id="tab-issues">
<h2>Issues</h2>
<p><em>There are no issues associated with this stock item.</em></p>
</div> <!-- <div id="tab-issues"> -->

<div id="tab-orders">
<h2>Orders</h2>
<p><em>There are no orders associated with this stock item.</em></p>
</div> <!-- <div id="tab-orders"> -->

</div> <!-- <div id="tabs"> -->
<!-- The following code initializes DIV's above as TAB control -->

<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>