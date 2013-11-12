<?php
/* @var $this StockLocationController */
/* @var $data StockLocation */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('use_sublocation')); ?>:</b>
	<?php echo CHtml::encode($data->use_sublocation); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sublocation_min')); ?>:</b>
	<?php echo CHtml::encode($data->sublocation_min); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sublocation_max')); ?>:</b>
	<?php echo CHtml::encode($data->sublocation_max); ?>
	<br />


</div>