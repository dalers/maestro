<?php
/* @var $this StockController */
/* @var $data Stock */
?>

<div class="view">

    <b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
    <?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('serial_number')); ?>:</b>
    <?php echo CHtml::encode($data->serial_number); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('version')); ?>:</b>
    <?php echo CHtml::encode($data->version); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('part_id')); ?>:</b>
    <?php echo CHtml::encode($data->part_id); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('status_id')); ?>:</b>
    <?php echo CHtml::encode($data->status_id); ?>
    <br />


</div>