<?php
/* @var $this PersonController */
/* @var $data Person */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('username')); ?>:</b>
	<?php echo CHtml::encode($data->username); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status')); ?>:</b>
	<?php echo CHtml::encode($data->status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('password')); ?>:</b>
	<?php echo CHtml::encode($data->password); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('email')); ?>:</b>
	<?php echo CHtml::encode($data->email); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nick')); ?>:</b>
	<?php echo CHtml::encode($data->nick); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('lname')); ?>:</b>
	<?php echo CHtml::encode($data->lname); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('fname')); ?>:</b>
	<?php echo CHtml::encode($data->fname); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('initial')); ?>:</b>
	<?php echo CHtml::encode($data->initial); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('profile')); ?>:</b>
	<?php echo CHtml::encode($data->profile); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('last_login_time')); ?>:</b>
	<?php echo CHtml::encode($data->last_login_time); ?>
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