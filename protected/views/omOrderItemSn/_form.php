<?php
/* @var $this OmOrderItemSnController */
/* @var $model OmOrderItemSn */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'om-order-item-sn-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'order_item_id'); ?>
		<?php echo $form->textField($model,'order_item_id'); ?>
		<?php echo $form->error($model,'order_item_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'stock_serial_id'); ?>
		<?php echo $form->textField($model,'stock_serial_id'); ?>
		<?php echo $form->error($model,'stock_serial_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->