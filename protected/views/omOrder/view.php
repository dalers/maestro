<?php
/* @var $this OmOrderController */
/* @var $model OmOrder */

$this->breadcrumbs=array(
	'Orders'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Order', 'url'=>array('index')),
	array('label'=>'Create Order', 'url'=>array('create')),
	array('label'=>'Update Order', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Order', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Order', 'url'=>array('admin')),
	array('label'=>'Assign Order to Project', 'url'=>'#'), // TODO
	array('label'=>'Assign Order Items', 'url'=>'#'), // TODO
);
?>

<h1>View Order #<?php echo $model->id; ?></h1>

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
		array(
            'label'=>'Size',
            'value'=>$model->size->name,
        ),
		array(
            'label'=>'Tool Type',
            'value'=>$model->toolType->name,
        ),
		array(
            'label'=>'Location',
            'value'=>$model->location->name,
        ),
		
		/*
		'create_time',
		array(
            'label'=>'Create User',
            'value'=>$model->createUser->username,
        ),
		'update_time',
		array(
            'label'=>'Update User',
            'value'=>$model->updateUser->username,
        ),
		*/
	),
)); ?>

<h2>Projects</h2>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->projects($model->id),
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
    'emptyText' => 'This Order is not associated to any Projects.',
	'columns' => array(
        array(
			'name'=> $model->getAttributeLabel('ProjectName'),
			'htmlOptions'=>array('style'=>'width: 50px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->project->name)', // TODO: Should link back to Project view
		),
        array(
			'name'=> $model->getAttributeLabel('Acct1'),
			'htmlOptions'=>array('style'=>'width: 50px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->project->acct1)',
		),
        array(
			'name'=> $model->getAttributeLabel('Acct2'),
			'htmlOptions'=>array('style'=>'width: 50px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->project->acct2)',
		),
        array(
			'name'=> $model->getAttributeLabel('Acct3'),
			'htmlOptions'=>array('style'=>'width: 50px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->project->acct3)',
		),
		array(
			'name'=> $model->getAttributeLabel('Acct4'),
			'htmlOptions'=>array('style'=>'width: 50px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->project->acct4)',
		),
        array(
			'name'=> $model->getAttributeLabel('Client'),
			'htmlOptions'=>array('style'=>'width: 50px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->project->client->name)',
		),
        array(
			'name'=> $model->getAttributeLabel('Type'),
			'htmlOptions'=>array('style'=>'width: 50px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->project->type)',
		),
	),
));
?>

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
			'value'=>'CHtml::encode($data->part_id)',
		),
		array(
			'name'=>'serial_no',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->serial_no)',
		),
	),
));

?>