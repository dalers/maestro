<?php
/* @var $this StatusController */
/* @var $data Status */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('prev_status_id')); ?>:</b>
	<?php echo CHtml::encode($data->prev_status_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('next_status_id')); ?>:</b>
	<?php echo CHtml::encode($data->next_status_id); ?>
	<br />


</div>