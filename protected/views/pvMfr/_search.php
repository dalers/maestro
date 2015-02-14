<?php
/* @var $this PvMfrController */
/* @var $model PvMfr */
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
		<?php echo $form->label($model,'MFRMfrName'); ?>
		<?php echo $form->textField($model,'MFRMfrName',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRAddress'); ?>
		<?php echo $form->textField($model,'MFRAddress',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRCountry'); ?>
		<?php echo $form->textField($model,'MFRCountry',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRContact1'); ?>
		<?php echo $form->textField($model,'MFRContact1',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRContact2'); ?>
		<?php echo $form->textField($model,'MFRContact2',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRPhone1'); ?>
		<?php echo $form->textField($model,'MFRPhone1',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRPhone2'); ?>
		<?php echo $form->textField($model,'MFRPhone2',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRFax'); ?>
		<?php echo $form->textField($model,'MFRFax',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRWeb'); ?>
		<?php echo $form->textField($model,'MFRWeb',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRNotes'); ?>
		<?php echo $form->textArea($model,'MFRNotes',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRCode'); ?>
		<?php echo $form->textField($model,'MFRCode',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFREMail1'); ?>
		<?php echo $form->textField($model,'MFREMail1',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFREMail2'); ?>
		<?php echo $form->textField($model,'MFREMail2',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'MFRNoPhonePrefix'); ?>
		<?php echo $form->textField($model,'MFRNoPhonePrefix'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->