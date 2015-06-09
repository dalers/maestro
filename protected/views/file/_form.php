<?php
/* @var $this FileController */
/* @var $model File */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'file-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'FILPNPartNumber'); ?>
		<?php echo $form->textField($model,'FILPNPartNumber',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'FILPNPartNumber'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'FILFilePath'); ?>
		<?php echo $form->textField($model,'FILFilePath',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'FILFilePath'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'FILFileName'); ?>
		<?php echo $form->textField($model,'FILFileName',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'FILFileName'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'FILView'); ?>
		<?php echo $form->textField($model,'FILView'); ?>
		<?php echo $form->error($model,'FILView'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'FILNotes'); ?>
		<?php echo $form->textField($model,'FILNotes',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'FILNotes'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'part_id'); ?>
		<?php echo $form->textField($model,'part_id'); ?>
		<?php echo $form->error($model,'part_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->