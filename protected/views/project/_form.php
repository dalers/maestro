<?php
/* @var $this ProjectController */
/* @var $model Project */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'project-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'acct1'); ?>
		<?php echo $form->textField($model,'acct1',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'acct1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'acct2'); ?>
		<?php echo $form->textField($model,'acct2',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'acct2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'acct3'); ?>
		<?php echo $form->textField($model,'acct3',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'acct3'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'acct4'); ?>
		<?php echo $form->textField($model,'acct4',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'acct4'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'client'); ?>
		<?php echo $form->textField($model,'client',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'client'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'description'); ?>
		<?php echo $form->textArea($model,'description',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'description'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'type'); ?>
		<?php echo $form->textField($model,'type',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'type'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status'); ?>
		<?php echo $form->textField($model,'status',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'status'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'milestone'); ?>
		<?php echo $form->textField($model,'milestone',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'milestone'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'milestone_date'); ?>
		<?php $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'milestone_date',
                'value'=>$model->milestone_date,

                // additional javascript options for the date picker plugin
                'options'=>array(
                        'autoSize'=>true,
                        'defaultDate'=>$model->milestone_date,
                        'buttonImage'=>Yii::app()->baseUrl.'/images/calendar.png',
                        'buttonImageOnly'=>true,
                        'buttonText'=>'Select',
						'dateFormat'=>'yy-mm-dd', 
                        'selectOtherMonths'=>true,
                        'showAnim'=>'fold',
                        'showButtonPanel'=>true,
                        'showOn'=>'button',
                        'showOtherMonths'=>true,
                ),
        )); ?>
		<?php echo $form->error($model,'milestone_date'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'create_time'); ?>
		<?php echo $form->textField($model,'create_time'); ?>
		<?php echo $form->error($model,'create_time'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'create_user_id'); ?>
		<?php echo $form->textField($model,'create_user_id'); ?>
		<?php echo $form->error($model,'create_user_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'update_time'); ?>
		<?php echo $form->textField($model,'update_time'); ?>
		<?php echo $form->error($model,'update_time'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'update_user_id'); ?>
		<?php echo $form->textField($model,'update_user_id'); ?>
		<?php echo $form->error($model,'update_user_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->