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
		<?php echo $form->labelEx($model,'size_id'); ?>
		<?php echo $form->dropDownList($model,'size_id', CHtml::listData(OmSize::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'size_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tool_type_id'); ?>
		<?php echo $form->dropDownList($model,'tool_type_id', CHtml::listData(OmToolType::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'tool_type_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'location_id'); ?>
		<?php echo $form->dropDownList($model,'location_id', CHtml::listData(OmLocation::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'location_id'); ?>
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
		<?php echo $form->textField($model,'create_user_id'); ?>
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