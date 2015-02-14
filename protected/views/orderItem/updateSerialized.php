<?php
/* @var $this OrderItemController */
/* @var $model OrderItem */

$this->breadcrumbs=array(
	'Order'=>array('Order/view', 'id'=>$model->order_id),
	'Update Order Item',
);

$this->menu=array(
	array('label'=>'List Order Items', 'url'=>array('index')),
	array('label'=>'Create Order Item', 'url'=>array('create')),
	array('label'=>'View Order Item', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Order Item', 'url'=>array('admin')),
);
?>

<h1>Update Serialized Order Item <?php echo $model->id; ?></h1>

<div class="form">

<?php foreach(Yii::app()->user->getFlashes() as $key => $message) {
    if ($key=='counters') {continue;} //no need next line since 1.1.7
    echo "<div class='flash-{$key}'>{$message}</div>";
} ?>

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'om-order-item-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'order_id'); ?>
		<?php echo CHtml::textField("order_id",$model->order->name,array('readonly'=>true)); ?>
		<?php echo $form->error($model,'order_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'part_id'); ?>
		<?php echo CHtml::textField("part_id",$model->part->PNPartNumber,array('readonly'=>true, 'style'=>'width: 250px')); ?>
		<?php echo $form->error($model,'part_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'desired_qty'); ?>
		<?php echo $form->textField($model,'desired_qty'); ?>
		<?php echo $form->error($model,'desired_qty'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shipped_qty'); ?>
		<?php echo $form->textField($model,'shipped_qty', array('disabled' => true)); ?>
		<?php echo $form->error($model,'shipped_qty'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'serial_numbers'); ?>
		<?php echo $form->textArea($model,'serial_numbers', array('rows'=>5,'cols'=>50,'id'=>'serial_numbers')); ?>
		<?php echo $form->error($model,'serial_numbers'); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

<hr>
<h2>Serial Numbers</h2>	

<div class="row buttons">
	<?php echo CHtml::button("Add", array('submit'=>Yii::app()->createUrl("OrderItemSn/createOrderItemChild", array("id"=>$model->id)))); ?>
</div>

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
        array(
            'class'=>'CButtonColumn',
            'template' => '{delete}',
			'buttons'=>array
			(
				'delete' => array
				(
					'label'=>'Remove Serial Number',
					'imageUrl'=>Yii::app()->request->baseUrl.'/images/cross.png',
					'url'=>'Yii::app()->createUrl("OrderItemSn/delete", array("id"=>$data->id))',
				),
			),
        ),
	),
));

?>
</div><!-- form -->