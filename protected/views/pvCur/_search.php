<?php
/* @var $this PvCurController */
/* @var $model PvCur */
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
		<?php echo $form->label($model,'CURCurrencyName'); ?>
		<?php echo $form->textField($model,'CURCurrencyName',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CURExchangeRate'); ?>
		<?php echo $form->textField($model,'CURExchangeRate'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CURCurrencyChar'); ?>
		<?php echo $form->textField($model,'CURCurrencyChar',array('size'=>4,'maxlength'=>4)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CURFormat'); ?>
		<?php echo $form->textField($model,'CURFormat',array('size'=>35,'maxlength'=>35)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'CURFormatExt'); ?>
		<?php echo $form->textField($model,'CURFormatExt',array('size'=>35,'maxlength'=>35)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->