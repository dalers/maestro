<?php
/* @var $this OrderController */
/* @var $model Order */

$this->breadcrumbs=array(
	'Order'=>array('index'),
	// $model->id,
);

$this->menu=array(
	array('label'=>'List Orders', 'url'=>array('index')),
	array('label'=>'Create Order', 'url'=>array('create')),	
	array('label'=>'Update Order', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Order', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this order?')),
	array('label'=>'Manage Order', 'url'=>array('admin'),
	),
);
?>

<h1>View Order #<?php echo $model->id; ?></h1>

<p>Created: <?php echo empty($model->create_time) ? 'unknown' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "unknown" : $model->createUser->username; ?>
<br />Updated:  <?php echo empty($model->update_time) ? 'unknown' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "unknown" : $model->updateUser->username; ?>
</p>

<h2>Order Master</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'type',
		'status',
		array(
            'label'=>'Project',
            'value'=>$model->project->name,
        ),
		array(
			'label'=>'Source Parts List',
			'value'=>$model->partslist->PNPartNumber,
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
	<li><a href="#tab-parts-list">Parts List</a></li>
	<li><a href="#tab-comments">Comments</a></li>
	<li><a href="#tab-files">Files</a></li>
	<li><a href="#tab-issues">Issues</a></li>
	<li><a href="#tab-stock">Stock</a></li>
	<li><a href="#tab-projects">Projects</a></li>
</ul>

<div id="tab-parts-list">
<h2>Parts List</h2>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $dataProvider,
	'filter' => $oimodel,
    'id' => 'detail_childs_id',
    //'showTableOnEmpty' => false,
    'emptyText' => 'There are no parts associated with this order.',
	'columns' => array(
        array(
			'name'=>'part_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			//TODO link to part needs to use Part controller, but renders
			//using Order controller
			//'value'=>'CHtml::link(CHtml::encode($data->part->PNPartNumber))',
			'value'=>'CHtml::encode($data->part->PNPartNumber)',			
		),
        array(
			'name'=>'desired_qty',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->desired_qty)',
		),
        array(
			'name'=>'shipped_qty',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->shipped_qty)',
		),
	),
));
?>
</div> <!-- <div id="tab-parts-list"> -->

<div id="tab-comments">
<h2>Comments</h2>
<p><em>There are no comments associated with this order.</em></p>
</div> <!-- <div id="tab-comments"> -->

<div id="tab-files">
<h2>Files</h2>
<p><em>There are no files associated with this order.</em></p>
</div> <!-- <div id="tab-files"> -->

<div id="tab-issues">
<h2>Issues</h2>
<p><em>There are no issues associated with this order.</em></p>
</div> <!-- <div id="tab-issues"> -->

<div id="tab-stock">
<h2>Stock</h2>
<p><em>There is no stock associated with this order.</em></p>
</div> <!-- <div id="tab-stock"> -->

<div id="tab-projects">
<h2>Projects</h2>
<p><em>There are no projects associated with this order.</em></p>
</div> <!-- <div id="tab-projects"> -->

</div> <!-- <div id="tabs"> -->
<!-- The following code initializes DIV's above as TAB control -->

<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>