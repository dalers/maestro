<?php
/* @var $this ProjectController */
/* @var $data Project */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('acct1')); ?>:</b>
	<?php echo CHtml::encode($data->acct1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('acct2')); ?>:</b>
	<?php echo CHtml::encode($data->acct2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('acct3')); ?>:</b>
	<?php echo CHtml::encode($data->acct3); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('acct4')); ?>:</b>
	<?php echo CHtml::encode($data->acct4); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('client_id')); ?>:</b>
	<?php echo CHtml::encode($data->client_id); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('description')); ?>:</b>
	<?php echo CHtml::encode($data->description); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('type')); ?>:</b>
	<?php echo CHtml::encode($data->type); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status_id')); ?>:</b>
	<?php echo CHtml::encode($data->status_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('milestone')); ?>:</b>
	<?php echo CHtml::encode($data->milestone); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('milestone_date')); ?>:</b>
	<?php echo CHtml::encode($data->milestone_date); ?>
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

	<b><?php echo CHtml::encode($data->getAttributeLabel('size_id')); ?>:</b>
	<?php echo CHtml::encode($data->size_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('location_id')); ?>:</b>
	<?php echo CHtml::encode($data->location_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tool_type_id')); ?>:</b>
	<?php echo CHtml::encode($data->tool_type_id); ?>
	<br />

	*/ ?>

</div>