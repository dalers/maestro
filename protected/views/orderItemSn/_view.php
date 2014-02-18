<?php
/* @var $this OrderItemSnController */
/* @var $data OrderItemSn */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('order_item_id')); ?>:</b>
	<?php echo CHtml::encode($data->order_item_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('stock_serial_id')); ?>:</b>
	<?php echo CHtml::encode($data->stock_serial_id); ?>
	<br />


</div>