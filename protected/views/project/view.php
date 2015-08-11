<?php
/* @var $this ProjectController */
/* @var $model Project */

$this->breadcrumbs=array(
	'Project'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Project', 'url'=>array('index')),
	array('label'=>'Create Project', 'url'=>array('create')),
	array('label'=>'Update Project', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Project', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	//array('label'=>'Manage Project', 'url'=>array('admin')),
	array('label'=>'Create Project Issue', 'url'=>array('issue/create', 'pid'=>$model->id)),
);
?>

<h1>View Project "<?php echo $model->name; ?>"</h1>

<p>Created: <?php echo empty($model->create_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "<em>unknown</em>" : $model->createUser->username; ?>
<br />Updated:  <?php echo empty($model->update_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "<em>unknown</em>" : $model->updateUser->username; ?>
</p>

<h2>Project Master</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		//'id',
		'name',
		'description',
		'code',
		'customer_id',
		array(        
			'name'=>'owner_id',
				'value'=>isset($model->owner)?CHtml::encode($model->owner->username):"unknown"
		),		
		'phase_id',
		'status_id',
		'type_id',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
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
</ul>

<div id="tab-parts">
<h2>Parts</h2>
<p><em>There are no parts associated with this project.</em></p>
</div> <!-- <div id="tab-parts"> -->

<div id="tab-comments">
<h2>Comments</h2>
<p><em>There are no comments associated with this project.</em></p>
</div> <!-- <div id="tab-comments"> -->

<div id="tab-files">
<h2>Files</h2>
<p><em>There are no files associated with this project.</em></p>
</div> <!-- <div id="tab-files"> -->

<div id="tab-issues">
<h2>Issues</h2>
<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$issueDataProvider,
	'itemView'=>'/issue/_view',
)); ?>
</div> <!-- <div id="tab-issues"> -->

<div id="tab-orders">
<h2>Orders</h2>
<p><em>There are no orders associated with this project.</em></p>
</div> <!-- <div id="tab-orders"> -->

<div id="tab-stock">
<h2>Stock</h2>
<p><em>There is no stock associated with this project.</em></p>
</div> <!-- <div id="tab-stock"> -->

</div> <!-- <div id="tabs"> -->
<!-- The following code initializes DIV's above as TAB control -->

<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>