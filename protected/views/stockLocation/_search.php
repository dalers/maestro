<?php
/* @var $this StockLocationController */
/* @var $model StockLocation */
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
		<?php echo $form->label($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'use_sublocation'); ?>
		<?php echo $form->textField($model,'use_sublocation'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'sublocation_min'); ?>
		<?php echo $form->textField($model,'sublocation_min'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'sublocation_max'); ?>
		<?php echo $form->textField($model,'sublocation_max'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->