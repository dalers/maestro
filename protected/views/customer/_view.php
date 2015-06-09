<?php
/* @var $this CustomerController */
/* @var $data Customer */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUCustomer')); ?>:</b>
	<?php echo CHtml::encode($data->CUCustomer); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUAddress')); ?>:</b>
	<?php echo CHtml::encode($data->CUAddress); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUShipAddress')); ?>:</b>
	<?php echo CHtml::encode($data->CUShipAddress); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUPhone1')); ?>:</b>
	<?php echo CHtml::encode($data->CUPhone1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUPhone2')); ?>:</b>
	<?php echo CHtml::encode($data->CUPhone2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUContact1')); ?>:</b>
	<?php echo CHtml::encode($data->CUContact1); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('CUContact2')); ?>:</b>
	<?php echo CHtml::encode($data->CUContact2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUFax')); ?>:</b>
	<?php echo CHtml::encode($data->CUFax); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUEmail1')); ?>:</b>
	<?php echo CHtml::encode($data->CUEmail1); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUEmail2')); ?>:</b>
	<?php echo CHtml::encode($data->CUEmail2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUNotes')); ?>:</b>
	<?php echo CHtml::encode($data->CUNotes); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUWeb')); ?>:</b>
	<?php echo CHtml::encode($data->CUWeb); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUCode')); ?>:</b>
	<?php echo CHtml::encode($data->CUCode); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUAccount')); ?>:</b>
	<?php echo CHtml::encode($data->CUAccount); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUTerms')); ?>:</b>
	<?php echo CHtml::encode($data->CUTerms); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUFedTaxID')); ?>:</b>
	<?php echo CHtml::encode($data->CUFedTaxID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUStateTaxID')); ?>:</b>
	<?php echo CHtml::encode($data->CUStateTaxID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CUNoPhonePrefix')); ?>:</b>
	<?php echo CHtml::encode($data->CUNoPhonePrefix); ?>
	<br />

	*/ ?>

</div>