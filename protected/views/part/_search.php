<?php
/* @var $this PartController */
/* @var $model Part */
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
		<?php echo $form->label($model,'PNIDToLNK'); ?>
		<?php echo $form->textField($model,'PNIDToLNK'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUNID'); ?>
		<?php echo $form->textField($model,'PNUNID'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNTabParentID'); ?>
		<?php echo $form->textField($model,'PNTabParentID'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNPrefix'); ?>
		<?php echo $form->textField($model,'PNPrefix',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNPartNumber'); ?>
		<?php echo $form->textField($model,'PNPartNumber',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNSuffix'); ?>
		<?php echo $form->textField($model,'PNSuffix',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'type_id'); ?>
		<?php echo $form->textField($model,'type_id',array('size'=>5,'maxlength'=>5)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNRevision'); ?>
		<?php echo $form->textField($model,'PNRevision',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNTitle'); ?>
		<?php echo $form->textField($model,'PNTitle',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNDetail'); ?>
		<?php echo $form->textField($model,'PNDetail',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'status_id'); ?>
		<?php echo $form->textField($model,'status_id',array('size'=>1,'maxlength'=>1)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNReqBy'); ?>
		<?php echo $form->textField($model,'PNReqBy',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNNotes'); ?>
		<?php echo $form->textArea($model,'PNNotes',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser1'); ?>
		<?php echo $form->textField($model,'PNUser1',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser2'); ?>
		<?php echo $form->textField($model,'PNUser2',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser3'); ?>
		<?php echo $form->textField($model,'PNUser3',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser4'); ?>
		<?php echo $form->textField($model,'PNUser4',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser5'); ?>
		<?php echo $form->textField($model,'PNUser5',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser6'); ?>
		<?php echo $form->textField($model,'PNUser6',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser7'); ?>
		<?php echo $form->textField($model,'PNUser7',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser8'); ?>
		<?php echo $form->textField($model,'PNUser8',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser9'); ?>
		<?php echo $form->textField($model,'PNUser9',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUser10'); ?>
		<?php echo $form->textField($model,'PNUser10',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNDate'); ?>
		<?php echo $form->textField($model,'PNDate'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNTab'); ?>
		<?php echo $form->textField($model,'PNTab'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNControlled'); ?>
		<?php echo $form->textField($model,'PNControlled'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNAux1'); ?>
		<?php echo $form->textField($model,'PNAux1',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNQty'); ?>
		<?php echo $form->textField($model,'PNQty'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNQty2'); ?>
		<?php echo $form->textField($model,'PNQty2'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNCostChanged'); ?>
		<?php echo $form->textField($model,'PNCostChanged'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNParentCost'); ?>
		<?php echo $form->textField($model,'PNParentCost'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNExpandList'); ?>
		<?php echo $form->textField($model,'PNExpandList'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNAssyCostOption'); ?>
		<?php echo $form->textField($model,'PNAssyCostOption'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNInclAssyOnPurchList'); ?>
		<?php echo $form->textField($model,'PNInclAssyOnPurchList'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNMadeFrom'); ?>
		<?php echo $form->textField($model,'PNMadeFrom'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNMinStockQty'); ?>
		<?php echo $form->textField($model,'PNMinStockQty'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNOrderToMaintain'); ?>
		<?php echo $form->textField($model,'PNOrderToMaintain'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNOnECO'); ?>
		<?php echo $form->textField($model,'PNOnECO'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNOverKit'); ?>
		<?php echo $form->textField($model,'PNOverKit'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNOverKitQty'); ?>
		<?php echo $form->textField($model,'PNOverKitQty'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNOverKitBy'); ?>
		<?php echo $form->textField($model,'PNOverKitBy'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNOverKitFor'); ?>
		<?php echo $form->textField($model,'PNOverKitFor'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNCurrentCost'); ?>
		<?php echo $form->textField($model,'PNCurrentCost'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNLastRollupCost'); ?>
		<?php echo $form->textField($model,'PNLastRollupCost'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUSRID'); ?>
		<?php echo $form->textField($model,'PNUSRID'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'PNUserLock'); ?>
		<?php echo $form->textField($model,'PNUserLock'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'is_serialized'); ?>
		<?php echo $form->textField($model,'is_serialized'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'iteration_number'); ?>
		<?php echo $form->textField($model,'iteration_number'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'is_current_iteration'); ?>
		<?php echo $form->textField($model,'is_current_iteration'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'requester_id'); ?>
		<?php echo $form->textField($model,'requester_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'status_id'); ?>
		<?php echo $form->textField($model,'status_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'stock_location_id'); ?>
		<?php echo $form->textField($model,'stock_location_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'type_id'); ?>
		<?php echo $form->textField($model,'type_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'create_time'); ?>
		<?php echo $form->textField($model,'create_time'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'create_user_id'); ?>
		<?php echo $form->textField($model,'create_user_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'update_time'); ?>
		<?php echo $form->textField($model,'update_time'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'update_user_id'); ?>
		<?php echo $form->textField($model,'update_user_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->