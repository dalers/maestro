<?php
/* @var $this IssueController */
/* @var $model Issue */
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
		<?php echo $form->label($model,'number'); ?>
		<?php echo $form->textField($model,'number',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'description'); ?>
		<?php echo $form->textArea($model,'description',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'project'); ?>
		<?php echo $form->textField($model,'project',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'type'); ?>
		<?php echo $form->textField($model,'type',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'corrective_action'); ?>
		<?php echo $form->textField($model,'corrective_action',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'cost'); ?>
		<?php echo $form->textField($model,'cost',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'status'); ?>
		<?php echo $form->textField($model,'status',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'project_id'); ?>
		<?php echo $form->textField($model,'project_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'type_id'); ?>
		<?php echo $form->textField($model,'type_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'status_id'); ?>
		<?php echo $form->textField($model,'status_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'part_id'); ?>
		<?php echo $form->textField($model,'part_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'stock_serial_id'); ?>
		<?php echo $form->textField($model,'stock_serial_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'owner_id'); ?>
		<?php echo $form->textField($model,'owner_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'requester_id'); ?>
		<?php echo $form->textField($model,'requester_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'create_time'); ?>
		<?php echo $form->textField($model,'create_time'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'create_user_id'); ?>
		<?php echo $form->textField($model,'create_user_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'update_time'); ?>
		<?php echo $form->textField($model,'update_time'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'update_user_id'); ?>
		<?php echo $form->textField($model,'update_user_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->