<?php
/* @var $this OrderController */
/* @var $model Order */

$this->breadcrumbs=array(
	'Orders'=>array('index'),
	// $model->id,
);

$this->menu=array(
	array('label'=>'List All Orders', 'url'=>array('index')),
	array('label'=>'Create New Order', 'url'=>array('create')),	
	array('label'=>'Update This Order', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete This Order', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this order?')),
	array('label'=>'Manage This Order', 'url'=>array('admin'),
	),
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
		'name',
		'type',
		'status',
		array(
			'label'=>'Original Parts List',
			'value'=>$model->partslist->PNTitle,
		),
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
            'label'=>'Customer',
            'value'=>$model->project->customer_id,
        ),
		array(
            'label'=>'Description',
            'value'=>$model->project->description,
        ),
//		array(
//            'label'=>'Type',
//            'value'=>$model->project->type,
//        ),
//		array(
//            'label'=>'Status',
//            'value'=>$model->project->status,
//        ),
//		array(
//            'label'=>'Acct1',
//            'value'=>$model->project->acct1,
//		),
//		array(
//            'label'=>'Acct2',
//            'value'=>$model->project->acct2,
//		),
//		array(
//            'label'=>'Acct3',
//            'value'=>$model->project->acct3,
//		),
//		array(
//            'label'=>'User1',
//            'value'=>$model->project->user1,
//		),
//		array(
//            'label'=>'User2',
//            'value'=>$model->project->user2,
//		),
//		array(
//            'label'=>'User3',
//            'value'=>$model->project->user3,
//		),
	),
)); ?>

<h2>Order Items</h2>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $dataProvider,
	'filter' => $oimodel,
    'id' => 'detail_childs_id',
    //'showTableOnEmpty' => false,
    'emptyText' => 'This Order has no Order Items.',
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