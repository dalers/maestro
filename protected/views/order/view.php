<?php
/* @var $this OrderController */
/* @var $model Order */

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
);
?>

<h1>View Order #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		array(
            'label'=>'Client',
            'value'=>$model->client->name,
        ),
		'reman_no',
		'job_no',
		array(
            'label'=>'Size',
            'value'=>$model->size->name,
        ),
		'shipment_dt',
		array(
            'label'=>'Assigned To',
            'value'=>$model->person->username,
        ),
		array(
            'label'=>'Tool Type',
            'value'=>$model->toolType->name,
        ),
		array(
            'label'=>'Product',
            'value'=>$model->product->name,
        ),
		array(
            'label'=>'Location',
            'value'=>$model->location->name,
        ),
		array(
            'label'=>'Status',
            'value'=>$model->status->name,
        ),
		'create_time',
		array(
            'label'=>'create_user_id',
            'value'=>$model->createUser->username,
        ),
		'update_time',
		array(
            'label'=>'update_user_id',
            'value'=>$model->updateUser->username,
        ),
	),
)); ?>
