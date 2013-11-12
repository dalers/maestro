<?php
/* @var $this StockLocationController */
/* @var $model StockLocation */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stock-location-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'use_sublocation'); ?>
		<?php echo $form->textField($model,'use_sublocation'); ?>
		<?php echo $form->error($model,'use_sublocation'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'sublocation_min'); ?>
		<?php echo $form->textField($model,'sublocation_min'); ?>
		<?php echo $form->error($model,'sublocation_min'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'sublocation_max'); ?>
		<?php echo $form->textField($model,'sublocation_max'); ?>
		<?php echo $form->error($model,'sublocation_max'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->