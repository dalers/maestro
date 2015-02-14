<?php
/* @var $this PvSuController */
/* @var $data PvSu */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUSupplier')); ?>:</b>
	<?php echo CHtml::encode($data->SUSupplier); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUAddress')); ?>:</b>
	<?php echo CHtml::encode($data->SUAddress); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUCountry')); ?>:</b>
	<?php echo CHtml::encode($data->SUCountry); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUPhone1')); ?>:</b>
	<?php echo CHtml::encode($data->SUPhone1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUPhone2')); ?>:</b>
	<?php echo CHtml::encode($data->SUPhone2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUFAX')); ?>:</b>
	<?php echo CHtml::encode($data->SUFAX); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('SUWeb')); ?>:</b>
	<?php echo CHtml::encode($data->SUWeb); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUContact1')); ?>:</b>
	<?php echo CHtml::encode($data->SUContact1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUContact2')); ?>:</b>
	<?php echo CHtml::encode($data->SUContact2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUDateLast')); ?>:</b>
	<?php echo CHtml::encode($data->SUDateLast); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUFollowup')); ?>:</b>
	<?php echo CHtml::encode($data->SUFollowup); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUNotes')); ?>:</b>
	<?php echo CHtml::encode($data->SUNotes); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUCode')); ?>:</b>
	<?php echo CHtml::encode($data->SUCode); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUAccount')); ?>:</b>
	<?php echo CHtml::encode($data->SUAccount); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUTerms')); ?>:</b>
	<?php echo CHtml::encode($data->SUTerms); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUFedTaxID')); ?>:</b>
	<?php echo CHtml::encode($data->SUFedTaxID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUStateTaxID')); ?>:</b>
	<?php echo CHtml::encode($data->SUStateTaxID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUEMail1')); ?>:</b>
	<?php echo CHtml::encode($data->SUEMail1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUEMail2')); ?>:</b>
	<?php echo CHtml::encode($data->SUEMail2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUCurDedExRate')); ?>:</b>
	<?php echo CHtml::encode($data->SUCurDedExRate); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUCurExRate')); ?>:</b>
	<?php echo CHtml::encode($data->SUCurExRate); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUCURID')); ?>:</b>
	<?php echo CHtml::encode($data->SUCURID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUCurReverse')); ?>:</b>
	<?php echo CHtml::encode($data->SUCurReverse); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SUNoPhonePrefix')); ?>:</b>
	<?php echo CHtml::encode($data->SUNoPhonePrefix); ?>
	<br />

	*/ ?>

</div>