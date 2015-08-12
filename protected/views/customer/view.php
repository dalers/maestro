<?php
/* @var $this CustomerController */
/* @var $model Customer */

$this->breadcrumbs=array(
	'Customer'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Customers', 'url'=>array('index')),
	array('label'=>'Create Customer', 'url'=>array('create')),
	array('label'=>'Update Customer', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Customer', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	//array('label'=>'Manage Customers', 'url'=>array('admin')),
);
?>

<h1>View Customer #<?php echo $model->id; ?></h1>

<p>Created: <?php echo empty($model->create_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "<em>unknown</em>" : $model->createUser->username; ?>
<br />Updated:  <?php echo empty($model->update_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "<em>unknown</em>" : $model->updateUser->username; ?>
</p>

<h2>Customer Master</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'CUCustomer',
		'CUAddress',
		'CUShipAddress',
		'CUPhone1',
		'CUPhone2',
		'CUContact1',
		'CUContact2',
		'CUFax',
		'CUEmail1',
		'CUEmail2',
		'CUNotes',
		'CUWeb',
		'CUCode',
		'CUAccount',
		'CUTerms',
		'CUFedTaxID',
		'CUStateTaxID',
		'CUNoPhonePrefix',
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
<p><em>There have been no parts ordered by this customer.</em></p>
</div> <!-- <div id="tab-parts"> -->

<div id="tab-comments">
<h2>Comments</h2>
<p><em>There are no comments associated with this customer.</em></p>
</div> <!-- <div id="tab-comments"> -->

<div id="tab-files">
<h2>Files</h2>
<p><em>There are no files associated with this customer.</em></p>
</div> <!-- <div id="tab-files"> -->

<div id="tab-issues">
<h2>Issues</h2>
<p><em>There are no issues associated with this customer.</em></p>
</div> <!-- <div id="tab-issues"> -->

<div id="tab-orders">
<h2>Orders</h2>
<p><em>There are no orders associated with this customer.</em></p>
</div> <!-- <div id="tab-orders"> -->

<div id="tab-stock">
<h2>Stock</h2>
<p><em>There has been no stock transacted to this customer.</em></p>
</div> <!-- <div id="tab-stock"> -->

<div id="tab-projects">
<h2>Projects</h2>
<p><em>There are no projects associated with this customer.</em></p>
</div> <!-- <div id="tab-projects"> -->

</div> <!-- <div id="tabs"> -->
<!-- The following code initializes DIV's above as TAB control -->

<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>
