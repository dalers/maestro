<?php
/* @var $this OmOrderController */
/* @var $model OmOrder */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'om-order-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
		<?php echo $form->error($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'iteration'); ?>
		<?php echo $form->textField($model,'iteration'); ?>
		<?php echo $form->error($model,'iteration'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'order_type'); ?>
		<?php echo $form->textField($model,'order_type'); ?>
		<?php echo $form->error($model,'order_type'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status'); ?>
		<?php echo $form->textField($model,'status'); ?>
		<?php echo $form->error($model,'status'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'project_id'); ?>
		<?php echo $form->textField($model,'project_id'); ?>
		<?php echo $form->error($model,'project_id'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'create_time'); ?>
		<?php $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'create_time',
                'value'=>$model->create_time,

                // additional javascript options for the date picker plugin
                'options'=>array(
                        'autoSize'=>true,
                        'defaultDate'=>$model->create_time,
                        'buttonImage'=>Yii::app()->baseUrl.'/images/cal_16x16.gif',
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
		<?php echo $form->error($model,'create_time'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'create_user_id'); ?>
		<?php echo $form->textField($model,'createUser->username'); ?>
		<?php echo $form->error($model,'create_user_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'update_time'); ?>
		<?php $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'update_time',
                'value'=>$model->update_time,

                // additional javascript options for the date picker plugin
                'options'=>array(
                        'autoSize'=>true,
                        'defaultDate'=>$model->update_time,
                        'buttonImage'=>Yii::app()->baseUrl.'/images/cal_16x16.gif',
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