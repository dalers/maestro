<?php
/* @var $this DefaultController */
/* @var $model AssignItemForm */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'assign-item-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'item'); ?>
		<?php echo $form->dropDownList($model, 'item', array(), array('multiple'=>true, 'size'=>10, 'style'=>'width:200px;')); ?>
		<?php echo $form->error($model,'item'); ?>
	</div>

	<div class="row">
		<?php echo $form->hiddenField($model,'type'); ?>
		<?php echo $form->hiddenField($model,'action'); ?>
	</div>
	
<?php $this->endWidget(); ?>

</div><!-- form -->