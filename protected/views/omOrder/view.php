<?php
/* @var $this OmOrderController */
/* @var $model OmOrder */

$this->breadcrumbs=array(
	'Orders'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List All Orders', 'url'=>array('index')),
	array('label'=>'Create New Order', 'url'=>array('create')),
	array('label'=>'Update This Order', 'url'=>array('update', 'id'=>$model->id, 'iteration'=>$model->iteration)),
	array('label'=>'Delete This Order', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id,'iteration'=>$model->iteration),'confirm'=>'Are you sure you want to delete this item?')),
	//array('label'=>'Manage This Order', 'url'=>array('admin')),
);
?>

<h1>View Order #<?php echo $model->id; ?> - Revision # <?php echo $model->iteration; ?></h1>

<p>Created on <?php echo empty($model->create_time) ? 'Unknown date/time' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "Unknown user" : $model->createUser->username; ?>

<?php
    // Show update information only if the Part Number was updated

    if (!empty($model->update_time)) {
?>
, Updated on 
<?php 
        echo empty($model->update_time) ? 'Unknown date/time' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "Unknown user" : $model->updateUser->username;
    }
?>
</p>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'iteration',
		'name',
		'type',
		'status',
		'project_id',
	),
)); ?>

<h2>Order Items</h2>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->childs($model->id),
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
    'emptyText' => 'This Order has no Order Items.',
	'columns' => array(
        array(
			'name'=>'part_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->part->PNPartNumber)',
		),
		array(
			'name'=>'serial_no',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 100px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->serial_no)',
		),
	),
));

?>