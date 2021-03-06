<?php
/* @var $this OrderItemController */
/* @var $data OrderItem */
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

	<b><?php echo CHtml::encode($data->getAttributeLabel('desired_qty')); ?>:</b>
	<?php echo CHtml::encode($data->desired_qty); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('shipped_qty')); ?>:</b>
	<?php echo CHtml::encode($data->shipped_qty); ?>
	<br />

</div>