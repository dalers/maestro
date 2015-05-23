<?php
/* @var $this StockController */
/* @var $model Stock */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stock-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

    <div class="row">
        <?php echo $form->labelEx($model,'serial_number'); ?>
        <?php echo $form->textField($model,'serial_number',array('size'=>60,'maxlength'=>255)); ?>
        <?php echo $form->error($model,'serial_number'); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model,'version'); ?>
        <?php echo $form->textField($model,'version',array('size'=>60,'maxlength'=>255)); ?>
        <?php echo $form->error($model,'version'); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model,'part_id'); ?>
        <?php echo $form->textField($model,'part_id'); ?>
        <?php echo $form->error($model,'part_id'); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model,'status_id'); ?>
        <?php echo $form->textField($model,'status_id'); ?>
        <?php echo $form->error($model,'status_id'); ?>
    </div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->