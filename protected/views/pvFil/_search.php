<?php
/* @var $this PvFilController */
/* @var $model PvFil */
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
		<?php echo $form->label($model,'FILPNID'); ?>
		<?php echo $form->textField($model,'FILPNID'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'FILPNPartNumber'); ?>
		<?php echo $form->textField($model,'FILPNPartNumber',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'FILFilePath'); ?>
		<?php echo $form->textField($model,'FILFilePath',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'FILFileName'); ?>
		<?php echo $form->textField($model,'FILFileName',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'FILView'); ?>
		<?php echo $form->textField($model,'FILView'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'FILNotes'); ?>
		<?php echo $form->textField($model,'FILNotes',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->