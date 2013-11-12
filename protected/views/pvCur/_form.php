<?php
/* @var $this PvCurController */
/* @var $model PvCur */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pv-cur-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'CURCurrencyName'); ?>
		<?php echo $form->textField($model,'CURCurrencyName',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'CURCurrencyName'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CURExchangeRate'); ?>
		<?php echo $form->textField($model,'CURExchangeRate'); ?>
		<?php echo $form->error($model,'CURExchangeRate'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CURCurrencyChar'); ?>
		<?php echo $form->textField($model,'CURCurrencyChar',array('size'=>4,'maxlength'=>4)); ?>
		<?php echo $form->error($model,'CURCurrencyChar'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CURFormat'); ?>
		<?php echo $form->textField($model,'CURFormat',array('size'=>35,'maxlength'=>35)); ?>
		<?php echo $form->error($model,'CURFormat'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CURFormatExt'); ?>
		<?php echo $form->textField($model,'CURFormatExt',array('size'=>35,'maxlength'=>35)); ?>
		<?php echo $form->error($model,'CURFormatExt'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->