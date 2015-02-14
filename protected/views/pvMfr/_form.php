<?php
/* @var $this PvMfrController */
/* @var $model PvMfr */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pv-mfr-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRMfrName'); ?>
		<?php echo $form->textField($model,'MFRMfrName',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'MFRMfrName'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRAddress'); ?>
		<?php echo $form->textField($model,'MFRAddress',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'MFRAddress'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRCountry'); ?>
		<?php echo $form->textField($model,'MFRCountry',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'MFRCountry'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRContact1'); ?>
		<?php echo $form->textField($model,'MFRContact1',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'MFRContact1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRContact2'); ?>
		<?php echo $form->textField($model,'MFRContact2',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'MFRContact2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRPhone1'); ?>
		<?php echo $form->textField($model,'MFRPhone1',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'MFRPhone1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRPhone2'); ?>
		<?php echo $form->textField($model,'MFRPhone2',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'MFRPhone2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRFax'); ?>
		<?php echo $form->textField($model,'MFRFax',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'MFRFax'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRWeb'); ?>
		<?php echo $form->textField($model,'MFRWeb',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'MFRWeb'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRNotes'); ?>
		<?php echo $form->textArea($model,'MFRNotes',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'MFRNotes'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRCode'); ?>
		<?php echo $form->textField($model,'MFRCode',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'MFRCode'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFREMail1'); ?>
		<?php echo $form->textField($model,'MFREMail1',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'MFREMail1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFREMail2'); ?>
		<?php echo $form->textField($model,'MFREMail2',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'MFREMail2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'MFRNoPhonePrefix'); ?>
		<?php echo $form->textField($model,'MFRNoPhonePrefix'); ?>
		<?php echo $form->error($model,'MFRNoPhonePrefix'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->