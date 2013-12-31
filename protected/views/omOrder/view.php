<?php
/* @var $this OmOrderController */
/* @var $model OmOrder */

$this->breadcrumbs=array(
	'Orders'=>array('index'),
	// $model->id,
);

$this->menu=array(
	array('label'=>'List All Orders', 'url'=>array('index')),
	array('label'=>'Create New Order', 'url'=>array('create')),	
	array('label'=>'Update This Order', 'url'=>array('update', 'id'=>$model->id, 'iteration'=>$model->iteration)),
	array('label'=>'Add An Order Item', 'url'=>Yii::app()->createUrl("OmOrderItem/createItemToOrder", array("order_id"=>$model->id))),
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
	),
)); ?>

<h2>Project</h2>

<?php $this->widget('zii.widgets.CDetailView' , array(
	'data'=>$model,
	'attributes'=>array(
		array(
            'label'=>'Name',
            'value'=>$model->project->name,
        ),
		array(
            'label'=>'Client',
            'value'=>$model->project->client,
        ),
		array(
            'label'=>'Description',
            'value'=>$model->project->description,
        ),
		array(
            'label'=>'Type',
            'value'=>$model->project->type,
        ),
		array(
            'label'=>'Status',
            'value'=>$model->project->status,
        ),
		array(
            'label'=>'Acct1',
            'value'=>$model->project->acct1,
		),
		array(
            'label'=>'Acct2',
            'value'=>$model->project->acct2,
		),
		array(
            'label'=>'Acct3',
            'value'=>$model->project->acct3,
		),
		array(
            'label'=>'User1',
            'value'=>$model->project->user1,
		),
		array(
            'label'=>'User2',
            'value'=>$model->project->user2,
		),
		array(
            'label'=>'User3',
            'value'=>$model->project->user3,
		),
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
			'name'=>'Part Number',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->part->PNPartNumber)',
		),
        array(
			'name'=>'Action',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->action)',
		),
        array(
			'name'=>'Serialized',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->part->PNUser1)',
		),
        array(
			'name'=>'Desired Qty',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->desired_qty)',
		),
        array(
			'name'=>'Shipped Qty',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->shipped_qty)',
		),
		array(
			'name'=>'Serial Number',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 100px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->serial_no)',
		),
        array(
            'class'=>'CButtonColumn',
            'template' => '{editserial}{edit}      {delete}',
			'buttons'=>array
			(
				'editserial' => array
				(
					'label'=>'Edit Serialized Order Item',
					'visible'=>'!empty($data->part->PNUser1)',
					'imageUrl'=>Yii::app()->request->baseUrl.'/images/pencil.png',
					'url'=>'Yii::app()->createUrl("OmOrderItem/updateSerialized", array("id"=>$data->id))',
				),
				'edit' => array
				(
					'label'=>'Edit Order Item',
					'visible'=>'empty($data->part->PNUser1)',
					'imageUrl'=>Yii::app()->request->baseUrl.'/images/pencil.png',
					'url'=>'Yii::app()->createUrl("OmOrderItem/update", array("id"=>$data->id))',
				),
				'delete' => array
				(
					'label'=>'Remove Order Item',
					'imageUrl'=>Yii::app()->request->baseUrl.'/images/cross.png',
					'url'=>'Yii::app()->createUrl("OmOrderItem/delete", array("id"=>$data->id))',
				),
			),
        ),
	),
));

?>