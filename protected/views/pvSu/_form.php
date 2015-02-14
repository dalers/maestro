<?php
/* @var $this PvSuController */
/* @var $model PvSu */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pv-su-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'SUSupplier'); ?>
		<?php echo $form->textField($model,'SUSupplier',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'SUSupplier'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUAddress'); ?>
		<?php echo $form->textField($model,'SUAddress',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'SUAddress'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUCountry'); ?>
		<?php echo $form->textField($model,'SUCountry',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'SUCountry'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUPhone1'); ?>
		<?php echo $form->textField($model,'SUPhone1',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'SUPhone1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUPhone2'); ?>
		<?php echo $form->textField($model,'SUPhone2',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'SUPhone2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUFAX'); ?>
		<?php echo $form->textField($model,'SUFAX',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'SUFAX'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUWeb'); ?>
		<?php echo $form->textField($model,'SUWeb',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'SUWeb'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUContact1'); ?>
		<?php echo $form->textField($model,'SUContact1',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'SUContact1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUContact2'); ?>
		<?php echo $form->textField($model,'SUContact2',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'SUContact2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUDateLast'); ?>
		<?php echo $form->textField($model,'SUDateLast'); ?>
		<?php echo $form->error($model,'SUDateLast'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUFollowup'); ?>
		<?php echo $form->textField($model,'SUFollowup'); ?>
		<?php echo $form->error($model,'SUFollowup'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUNotes'); ?>
		<?php echo $form->textArea($model,'SUNotes',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'SUNotes'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUCode'); ?>
		<?php echo $form->textField($model,'SUCode',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'SUCode'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUAccount'); ?>
		<?php echo $form->textField($model,'SUAccount',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'SUAccount'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUTerms'); ?>
		<?php echo $form->textField($model,'SUTerms',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'SUTerms'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUFedTaxID'); ?>
		<?php echo $form->textField($model,'SUFedTaxID',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'SUFedTaxID'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUStateTaxID'); ?>
		<?php echo $form->textField($model,'SUStateTaxID',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'SUStateTaxID'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUEMail1'); ?>
		<?php echo $form->textField($model,'SUEMail1',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'SUEMail1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUEMail2'); ?>
		<?php echo $form->textField($model,'SUEMail2',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'SUEMail2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUCurDedExRate'); ?>
		<?php echo $form->textField($model,'SUCurDedExRate'); ?>
		<?php echo $form->error($model,'SUCurDedExRate'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUCurExRate'); ?>
		<?php echo $form->textField($model,'SUCurExRate'); ?>
		<?php echo $form->error($model,'SUCurExRate'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUCURID'); ?>
		<?php echo $form->textField($model,'SUCURID'); ?>
		<?php echo $form->error($model,'SUCURID'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUCurReverse'); ?>
		<?php echo $form->textField($model,'SUCurReverse'); ?>
		<?php echo $form->error($model,'SUCurReverse'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'SUNoPhonePrefix'); ?>
		<?php echo $form->textField($model,'SUNoPhonePrefix'); ?>
		<?php echo $form->error($model,'SUNoPhonePrefix'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->