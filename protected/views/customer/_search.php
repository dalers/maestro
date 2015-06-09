<?php
/* @var $this CustomerController */
/* @var $model Customer */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUCustomer'); ?>
		<?php echo $form->textField($model,'CUCustomer',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUAddress'); ?>
		<?php echo $form->textField($model,'CUAddress',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUShipAddress'); ?>
		<?php echo $form->textField($model,'CUShipAddress',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUPhone1'); ?>
		<?php echo $form->textField($model,'CUPhone1',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUPhone2'); ?>
		<?php echo $form->textField($model,'CUPhone2',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUContact1'); ?>
		<?php echo $form->textField($model,'CUContact1',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUContact2'); ?>
		<?php echo $form->textField($model,'CUContact2',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUFax'); ?>
		<?php echo $form->textField($model,'CUFax',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUEmail1'); ?>
		<?php echo $form->textField($model,'CUEmail1',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUEmail2'); ?>
		<?php echo $form->textField($model,'CUEmail2',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUNotes'); ?>
		<?php echo $form->textArea($model,'CUNotes',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUWeb'); ?>
		<?php echo $form->textField($model,'CUWeb',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUCode'); ?>
		<?php echo $form->textField($model,'CUCode',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUAccount'); ?>
		<?php echo $form->textField($model,'CUAccount',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUTerms'); ?>
		<?php echo $form->textField($model,'CUTerms',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUFedTaxID'); ?>
		<?php echo $form->textField($model,'CUFedTaxID',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUStateTaxID'); ?>
		<?php echo $form->textField($model,'CUStateTaxID',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CUNoPhonePrefix'); ?>
		<?php echo $form->textField($model,'CUNoPhonePrefix'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->