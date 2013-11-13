<?php
/* @var $this PvMfrController */
/* @var $data PvMfr */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRMfrName')); ?>:</b>
	<?php echo CHtml::encode($data->MFRMfrName); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRAddress')); ?>:</b>
	<?php echo CHtml::encode($data->MFRAddress); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRCountry')); ?>:</b>
	<?php echo CHtml::encode($data->MFRCountry); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRContact1')); ?>:</b>
	<?php echo CHtml::encode($data->MFRContact1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRContact2')); ?>:</b>
	<?php echo CHtml::encode($data->MFRContact2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRPhone1')); ?>:</b>
	<?php echo CHtml::encode($data->MFRPhone1); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRPhone2')); ?>:</b>
	<?php echo CHtml::encode($data->MFRPhone2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRFax')); ?>:</b>
	<?php echo CHtml::encode($data->MFRFax); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRWeb')); ?>:</b>
	<?php echo CHtml::encode($data->MFRWeb); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRNotes')); ?>:</b>
	<?php echo CHtml::encode($data->MFRNotes); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRCode')); ?>:</b>
	<?php echo CHtml::encode($data->MFRCode); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFREMail1')); ?>:</b>
	<?php echo CHtml::encode($data->MFREMail1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFREMail2')); ?>:</b>
	<?php echo CHtml::encode($data->MFREMail2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MFRNoPhonePrefix')); ?>:</b>
	<?php echo CHtml::encode($data->MFRNoPhonePrefix); ?>
	<br />

	*/ ?>

</div>