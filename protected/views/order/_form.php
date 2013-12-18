<?php
/* @var $this OrderController */
/* @var $model Order */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'order-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'Client'); ?>
		<?php echo $form->dropDownList($model,'client_id', CHtml::listData(Client::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'client_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Reman Number'); ?>
		<?php echo $form->textField($model,'reman_no',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'reman_no'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Job Number'); ?>
		<?php echo $form->textField($model,'job_no',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'job_no'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Size'); ?>
		<?php echo $form->dropDownList($model,'size_id', CHtml::listData(Size::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'size_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Shipment Date'); ?>
        <?php $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'shipment_dt',
                'value'=>$model->shipment_dt,

                // additional javascript options for the date picker plugin
                'options'=>array(
                        'autoSize'=>true,
                        'defaultDate'=>$model->shipment_dt,
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
		<?php echo $form->error($model,'shipment_dt'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Assigned User'); ?>
		<?php echo $form->dropDownList($model,'person_id', CHtml::listData(Person::model()->findAll(array('order' => 'lname')),'id','lname','fname'));?>
		<?php echo $form->error($model,'person_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Tool Type'); ?>
		<?php echo $form->dropDownList($model,'tool_type_id', CHtml::listData(ToolType::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'tool_type_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Product'); ?>
		<?php echo $form->dropDownList($model,'product_id', CHtml::listData(Product::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'product_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Locale'); ?>
		<?php echo $form->dropDownList($model,'location_id', CHtml::listData(Location::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'location_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Country'); ?>
		<?php echo $form->dropDownList($model,'country_id', CHtml::listData(Country::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'country_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Status'); ?>
		<?php echo $form->dropDownList($model,'status_id', CHtml::listData(Status::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'status_id'); ?>
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