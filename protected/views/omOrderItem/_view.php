<?php
/* @var $this OmOrderItemController */
/* @var $data OmOrderItem */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('order_id')); ?>:</b>
	<?php echo CHtml::encode($data->order_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('part_id')); ?>:</b>
	<?php echo CHtml::encode($data->part_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('serial_no')); ?>:</b>
	<?php echo CHtml::encode($data->serial_no); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('action')); ?>:</b>
	<?php echo CHtml::encode($data->action); ?>
	<br />


</div>