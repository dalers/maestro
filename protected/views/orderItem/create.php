<?php
/* @var $this OrderItemController */
/* @var $model OrderItem */

$this->breadcrumbs=array(
	'Order'=>array('index','id'=>$model->order_id),
	'Create',
);

$this->menu=array(
	array('label'=>'List Order Items', 'url'=>array('index')),
	array('label'=>'Manage Order Item', 'url'=>array('admin')),
);
?>

<h1>Create Order Item</h1>

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
		<?php echo CHtml::textField('order_id',$model->order->name); ?>
		<?php echo $form->error($model,'order_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'part_id'); ?>
		<?php echo $form->dropDownList($model,'part_id', CHtml::listData(PvPn::model()->findAll(array('order' => 'PNPartNumber')),'id','PNPartNumber'));?>
		<?php echo $form->error($model,'part_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'desired_qty'); ?>
		<?php echo $form->textField($model,'desired_qty'); ?>
		<?php echo $form->error($model,'desired_qty'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shipped_qty'); ?>
		<?php echo $form->textField($model,'shipped_qty'); ?>
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

</div><!-- form -->