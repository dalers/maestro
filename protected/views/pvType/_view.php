<?php
/* @var $this PvTypeController */
/* @var $data PvType */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('TYPEType')); ?>:</b>
	<?php echo CHtml::encode($data->TYPEType); ?>
	<br />


</div>