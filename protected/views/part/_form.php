<?php
/* @var $this PartController */
/* @var $model Part */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pv-pn-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUNID'); ?>
		<?php echo $form->textField($model,'PNUNID'); ?>
		<?php echo $form->error($model,'PNUNID'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNTabParentID'); ?>
		<?php echo $form->textField($model,'PNTabParentID'); ?>
		<?php echo $form->error($model,'PNTabParentID'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNPrefix'); ?>
		<?php echo $form->textField($model,'PNPrefix',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'PNPrefix'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNPartNumber'); ?>
		<?php echo $form->textField($model,'PNPartNumber',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'PNPartNumber'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNSuffix'); ?>
		<?php echo $form->textField($model,'PNSuffix',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'PNSuffix'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'type_id'); ?>
		<?php echo $form->textField($model,'type_id',array('size'=>5,'maxlength'=>5)); ?>
		<?php echo $form->error($model,'type_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNRevision'); ?>
		<?php echo $form->textField($model,'PNRevision',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'PNRevision'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNTitle'); ?>
		<?php echo $form->textField($model,'PNTitle',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'PNTitle'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNDetail'); ?>
		<?php echo $form->textField($model,'PNDetail',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'PNDetail'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status_id'); ?>
		<?php echo $form->textField($model,'status_id',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'status_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNReqBy'); ?>
		<?php echo $form->textField($model,'PNReqBy',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'PNReqBy'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNNotes'); ?>
		<?php echo $form->textArea($model,'PNNotes',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'PNNotes'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser1'); ?>
		<?php echo $form->textField($model,'PNUser1',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser2'); ?>
		<?php echo $form->textField($model,'PNUser2',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser3'); ?>
		<?php echo $form->textField($model,'PNUser3',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser3'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser4'); ?>
		<?php echo $form->textField($model,'PNUser4',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser4'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser5'); ?>
		<?php echo $form->textField($model,'PNUser5',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser5'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser6'); ?>
		<?php echo $form->textField($model,'PNUser6',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser6'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser7'); ?>
		<?php echo $form->textField($model,'PNUser7',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser7'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser8'); ?>
		<?php echo $form->textField($model,'PNUser8',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser8'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser9'); ?>
		<?php echo $form->textField($model,'PNUser9',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser9'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUser10'); ?>
		<?php echo $form->textField($model,'PNUser10',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'PNUser10'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNDate'); ?>
		<?php echo $form->textField($model,'PNDate'); ?>
		<?php echo $form->error($model,'PNDate'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNTab'); ?>
		<?php echo $form->textField($model,'PNTab'); ?>
		<?php echo $form->error($model,'PNTab'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNControlled'); ?>
		<?php echo $form->textField($model,'PNControlled'); ?>
		<?php echo $form->error($model,'PNControlled'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNAux1'); ?>
		<?php echo $form->textField($model,'PNAux1',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'PNAux1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNQty'); ?>
		<?php echo $form->textField($model,'PNQty'); ?>
		<?php echo $form->error($model,'PNQty'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNQty2'); ?>
		<?php echo $form->textField($model,'PNQty2'); ?>
		<?php echo $form->error($model,'PNQty2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNCostChanged'); ?>
		<?php echo $form->textField($model,'PNCostChanged'); ?>
		<?php echo $form->error($model,'PNCostChanged'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNParentCost'); ?>
		<?php echo $form->textField($model,'PNParentCost'); ?>
		<?php echo $form->error($model,'PNParentCost'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNExpandList'); ?>
		<?php echo $form->textField($model,'PNExpandList'); ?>
		<?php echo $form->error($model,'PNExpandList'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNAssyCostOption'); ?>
		<?php echo $form->textField($model,'PNAssyCostOption'); ?>
		<?php echo $form->error($model,'PNAssyCostOption'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNInclAssyOnPurchList'); ?>
		<?php echo $form->textField($model,'PNInclAssyOnPurchList'); ?>
		<?php echo $form->error($model,'PNInclAssyOnPurchList'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNMadeFrom'); ?>
		<?php echo $form->textField($model,'PNMadeFrom'); ?>
		<?php echo $form->error($model,'PNMadeFrom'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNMinStockQty'); ?>
		<?php echo $form->textField($model,'PNMinStockQty'); ?>
		<?php echo $form->error($model,'PNMinStockQty'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNOrderToMaintain'); ?>
		<?php echo $form->textField($model,'PNOrderToMaintain'); ?>
		<?php echo $form->error($model,'PNOrderToMaintain'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNOnECO'); ?>
		<?php echo $form->textField($model,'PNOnECO'); ?>
		<?php echo $form->error($model,'PNOnECO'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNOverKit'); ?>
		<?php echo $form->textField($model,'PNOverKit'); ?>
		<?php echo $form->error($model,'PNOverKit'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNOverKitQty'); ?>
		<?php echo $form->textField($model,'PNOverKitQty'); ?>
		<?php echo $form->error($model,'PNOverKitQty'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNOverKitBy'); ?>
		<?php echo $form->textField($model,'PNOverKitBy'); ?>
		<?php echo $form->error($model,'PNOverKitBy'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNOverKitFor'); ?>
		<?php echo $form->textField($model,'PNOverKitFor'); ?>
		<?php echo $form->error($model,'PNOverKitFor'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNCurrentCost'); ?>
		<?php echo $form->textField($model,'PNCurrentCost'); ?>
		<?php echo $form->error($model,'PNCurrentCost'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNLastRollupCost'); ?>
		<?php echo $form->textField($model,'PNLastRollupCost'); ?>
		<?php echo $form->error($model,'PNLastRollupCost'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUSRID'); ?>
		<?php echo $form->textField($model,'PNUSRID'); ?>
		<?php echo $form->error($model,'PNUSRID'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'PNUserLock'); ?>
		<?php echo $form->textField($model,'PNUserLock'); ?>
		<?php echo $form->error($model,'PNUserLock'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'is_serialized'); ?>
		<?php echo $form->textField($model,'is_serialized'); ?>
		<?php echo $form->error($model,'is_serialized'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'requester_id'); ?>
		<?php echo $form->textField($model,'requester_id'); ?>
		<?php echo $form->error($model,'requester_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status_id'); ?>
		<?php echo $form->textField($model,'status_id'); ?>
		<?php echo $form->error($model,'status_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'stock_location_id'); ?>
		<?php echo $form->textField($model,'stock_location_id'); ?>
		<?php echo $form->error($model,'stock_location_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'type_id'); ?>
		<?php echo $form->textField($model,'type_id'); ?>
		<?php echo $form->error($model,'type_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->