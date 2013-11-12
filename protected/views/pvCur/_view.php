<?php
/* @var $this PvCurController */
/* @var $data PvCur */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CURCurrencyName')); ?>:</b>
	<?php echo CHtml::encode($data->CURCurrencyName); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CURExchangeRate')); ?>:</b>
	<?php echo CHtml::encode($data->CURExchangeRate); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CURCurrencyChar')); ?>:</b>
	<?php echo CHtml::encode($data->CURCurrencyChar); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CURFormat')); ?>:</b>
	<?php echo CHtml::encode($data->CURFormat); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('CURFormatExt')); ?>:</b>
	<?php echo CHtml::encode($data->CURFormatExt); ?>
	<br />


</div>