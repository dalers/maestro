<?php
/* @var $this PvPnController */
/* @var $data PvPn */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNIDToLNK')); ?>:</b>
	<?php echo CHtml::encode($data->PNIDToLNK); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUNID')); ?>:</b>
	<?php echo CHtml::encode($data->PNUNID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNTabParentID')); ?>:</b>
	<?php echo CHtml::encode($data->PNTabParentID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNPrefix')); ?>:</b>
	<?php echo CHtml::encode($data->PNPrefix); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNPartNumber')); ?>:</b>
	<?php echo CHtml::encode($data->PNPartNumber); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNSuffix')); ?>:</b>
	<?php echo CHtml::encode($data->PNSuffix); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('PNType')); ?>:</b>
	<?php echo CHtml::encode($data->PNType); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNRevision')); ?>:</b>
	<?php echo CHtml::encode($data->PNRevision); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNTitle')); ?>:</b>
	<?php echo CHtml::encode($data->PNTitle); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNDetail')); ?>:</b>
	<?php echo CHtml::encode($data->PNDetail); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNStatus')); ?>:</b>
	<?php echo CHtml::encode($data->PNStatus); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNReqBy')); ?>:</b>
	<?php echo CHtml::encode($data->PNReqBy); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNNotes')); ?>:</b>
	<?php echo CHtml::encode($data->PNNotes); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser1')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser2')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser3')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser3); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser4')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser4); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser5')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser5); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser6')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser6); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser7')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser7); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser8')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser8); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser9')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser9); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUser10')); ?>:</b>
	<?php echo CHtml::encode($data->PNUser10); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNDate')); ?>:</b>
	<?php echo CHtml::encode($data->PNDate); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNTab')); ?>:</b>
	<?php echo CHtml::encode($data->PNTab); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNControlled')); ?>:</b>
	<?php echo CHtml::encode($data->PNControlled); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNAux1')); ?>:</b>
	<?php echo CHtml::encode($data->PNAux1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNQty')); ?>:</b>
	<?php echo CHtml::encode($data->PNQty); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNQty2')); ?>:</b>
	<?php echo CHtml::encode($data->PNQty2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNCostChanged')); ?>:</b>
	<?php echo CHtml::encode($data->PNCostChanged); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNParentCost')); ?>:</b>
	<?php echo CHtml::encode($data->PNParentCost); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNExpandList')); ?>:</b>
	<?php echo CHtml::encode($data->PNExpandList); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNAssyCostOption')); ?>:</b>
	<?php echo CHtml::encode($data->PNAssyCostOption); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNInclAssyOnPurchList')); ?>:</b>
	<?php echo CHtml::encode($data->PNInclAssyOnPurchList); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNMadeFrom')); ?>:</b>
	<?php echo CHtml::encode($data->PNMadeFrom); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNMinStockQty')); ?>:</b>
	<?php echo CHtml::encode($data->PNMinStockQty); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNOrderToMaintain')); ?>:</b>
	<?php echo CHtml::encode($data->PNOrderToMaintain); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNOnECO')); ?>:</b>
	<?php echo CHtml::encode($data->PNOnECO); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNOverKit')); ?>:</b>
	<?php echo CHtml::encode($data->PNOverKit); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNOverKitQty')); ?>:</b>
	<?php echo CHtml::encode($data->PNOverKitQty); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNOverKitBy')); ?>:</b>
	<?php echo CHtml::encode($data->PNOverKitBy); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNOverKitFor')); ?>:</b>
	<?php echo CHtml::encode($data->PNOverKitFor); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNCurrentCost')); ?>:</b>
	<?php echo CHtml::encode($data->PNCurrentCost); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNLastRollupCost')); ?>:</b>
	<?php echo CHtml::encode($data->PNLastRollupCost); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUSRID')); ?>:</b>
	<?php echo CHtml::encode($data->PNUSRID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PNUserLock')); ?>:</b>
	<?php echo CHtml::encode($data->PNUserLock); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('stock_location_id')); ?>:</b>
	<?php echo CHtml::encode($data->stock_location_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('requester_id')); ?>:</b>
	<?php echo CHtml::encode($data->requester_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('create_time')); ?>:</b>
	<?php echo CHtml::encode($data->create_time); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('create_user_id')); ?>:</b>
	<?php echo CHtml::encode($data->create_user_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('update_time')); ?>:</b>
	<?php echo CHtml::encode($data->update_time); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('update_user_id')); ?>:</b>
	<?php echo CHtml::encode($data->update_user_id); ?>
	<br />

	*/ ?>

</div>