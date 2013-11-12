<?php
/* @var $this PvSuController */
/* @var $model PvSu */
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
		<?php echo $form->label($model,'SUSupplier'); ?>
		<?php echo $form->textField($model,'SUSupplier',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUAddress'); ?>
		<?php echo $form->textField($model,'SUAddress',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUCountry'); ?>
		<?php echo $form->textField($model,'SUCountry',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUPhone1'); ?>
		<?php echo $form->textField($model,'SUPhone1',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUPhone2'); ?>
		<?php echo $form->textField($model,'SUPhone2',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUFAX'); ?>
		<?php echo $form->textField($model,'SUFAX',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUWeb'); ?>
		<?php echo $form->textField($model,'SUWeb',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUContact1'); ?>
		<?php echo $form->textField($model,'SUContact1',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUContact2'); ?>
		<?php echo $form->textField($model,'SUContact2',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUDateLast'); ?>
		<?php echo $form->textField($model,'SUDateLast'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUFollowup'); ?>
		<?php echo $form->textField($model,'SUFollowup'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUNotes'); ?>
		<?php echo $form->textArea($model,'SUNotes',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUCode'); ?>
		<?php echo $form->textField($model,'SUCode',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUAccount'); ?>
		<?php echo $form->textField($model,'SUAccount',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUTerms'); ?>
		<?php echo $form->textField($model,'SUTerms',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUFedTaxID'); ?>
		<?php echo $form->textField($model,'SUFedTaxID',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUStateTaxID'); ?>
		<?php echo $form->textField($model,'SUStateTaxID',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUEMail1'); ?>
		<?php echo $form->textField($model,'SUEMail1',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUEMail2'); ?>
		<?php echo $form->textField($model,'SUEMail2',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUCurDedExRate'); ?>
		<?php echo $form->textField($model,'SUCurDedExRate'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUCurExRate'); ?>
		<?php echo $form->textField($model,'SUCurExRate'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUCURID'); ?>
		<?php echo $form->textField($model,'SUCURID'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUCurReverse'); ?>
		<?php echo $form->textField($model,'SUCurReverse'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'SUNoPhonePrefix'); ?>
		<?php echo $form->textField($model,'SUNoPhonePrefix'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->