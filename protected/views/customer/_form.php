<?php
/* @var $this CustomerController */
/* @var $model Customer */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'customer-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'CUCustomer'); ?>
		<?php echo $form->textField($model,'CUCustomer',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'CUCustomer'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUAddress'); ?>
		<?php echo $form->textField($model,'CUAddress',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'CUAddress'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUShipAddress'); ?>
		<?php echo $form->textField($model,'CUShipAddress',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'CUShipAddress'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUPhone1'); ?>
		<?php echo $form->textField($model,'CUPhone1',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'CUPhone1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUPhone2'); ?>
		<?php echo $form->textField($model,'CUPhone2',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'CUPhone2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUContact1'); ?>
		<?php echo $form->textField($model,'CUContact1',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'CUContact1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUContact2'); ?>
		<?php echo $form->textField($model,'CUContact2',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'CUContact2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUFax'); ?>
		<?php echo $form->textField($model,'CUFax',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'CUFax'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUEmail1'); ?>
		<?php echo $form->textField($model,'CUEmail1',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'CUEmail1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUEmail2'); ?>
		<?php echo $form->textField($model,'CUEmail2',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'CUEmail2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUNotes'); ?>
		<?php echo $form->textArea($model,'CUNotes',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'CUNotes'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUWeb'); ?>
		<?php echo $form->textField($model,'CUWeb',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'CUWeb'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUCode'); ?>
		<?php echo $form->textField($model,'CUCode',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'CUCode'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUAccount'); ?>
		<?php echo $form->textField($model,'CUAccount',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'CUAccount'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUTerms'); ?>
		<?php echo $form->textField($model,'CUTerms',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'CUTerms'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUFedTaxID'); ?>
		<?php echo $form->textField($model,'CUFedTaxID',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'CUFedTaxID'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUStateTaxID'); ?>
		<?php echo $form->textField($model,'CUStateTaxID',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'CUStateTaxID'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'CUNoPhonePrefix'); ?>
		<?php echo $form->textField($model,'CUNoPhonePrefix'); ?>
		<?php echo $form->error($model,'CUNoPhonePrefix'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->