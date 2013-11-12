<?php
/* @var $this PvUnController */
/* @var $model PvUn */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pv-un-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'UNUseUnits'); ?>
		<?php echo $form->textField($model,'UNUseUnits',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'UNUseUnits'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'UNPurchUnits'); ?>
		<?php echo $form->textField($model,'UNPurchUnits',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'UNPurchUnits'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'UNConvUnits'); ?>
		<?php echo $form->textField($model,'UNConvUnits'); ?>
		<?php echo $form->error($model,'UNConvUnits'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->