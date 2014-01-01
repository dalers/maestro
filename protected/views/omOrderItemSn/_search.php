<?php
/* @var $this OmOrderItemSnController */
/* @var $model OmOrderItemSn */
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
		<?php echo $form->label($model,'order_item_id'); ?>
		<?php echo $form->textField($model,'order_item_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'stock_serial_id'); ?>
		<?php echo $form->textField($model,'stock_serial_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->