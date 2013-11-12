<?php
/* @var $this PvUnController */
/* @var $data PvUn */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('UNUseUnits')); ?>:</b>
	<?php echo CHtml::encode($data->UNUseUnits); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('UNPurchUnits')); ?>:</b>
	<?php echo CHtml::encode($data->UNPurchUnits); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('UNConvUnits')); ?>:</b>
	<?php echo CHtml::encode($data->UNConvUnits); ?>
	<br />


</div>