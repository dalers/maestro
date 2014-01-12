<?php
/* @var $this OmOrderItemController */
/* @var $model OmOrderItem */

$this->breadcrumbs=array(
	'Order Items'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Order Items', 'url'=>array('index')),
	array('label'=>'Create Order Item', 'url'=>array('create')),
	array('label'=>'Update Order Item', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Order Item', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Order Item', 'url'=>array('admin')),
);
?>

<h1>View Order Item #<?php echo $model->id; ?></h1>

<?php foreach(Yii::app()->user->getFlashes() as $key => $message) {
    if ($key=='counters') {continue;} //no need next line since 1.1.7
    echo "<div class='flash-{$key}'>{$message}</div>";
} ?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		array(
			'label'=>'Order',
			'value'=>$model->order->name,
		),
		array(
			'label'=>'Part',
			'value'=>$model->part->PNPartNumber,
		),
		'desired_qty',
		'shipped_qty',
	),
)); ?>

<h2>Serial Numbers</h2>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->childs($model->id),
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
    'emptyText' => 'This Order Item has no Serial Numbers.',
	'columns' => array(
        array(
			'name'=>'ID',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->id)',
		),
        array(
			'name'=>'Serial Number',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->stockSerial->serial_number)',
		),
	),
));

?>
