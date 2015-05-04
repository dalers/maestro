<?php
/* @var $this IssueController */
/* @var $data Issue */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->name), array('issue/view', 'id'=>$data->id)); ?>
	<br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('description')); ?>:</b>
    <?php echo CHtml::encode($data->description); ?>
    <br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status_id')); ?>:</b>
	<?php echo CHtml::encode($data->getStatusText()); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('type_id')); ?>:</b>
	<?php echo CHtml::encode($data->getTypeText()); ?>
	<br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('begin_date')); ?>:</b>
    <?php echo CHtml::encode($data->begin_date); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('end_date')); ?>:</b>
    <?php echo CHtml::encode($data->end_date); ?>
    <br />

    <?php /*
    <b><?php echo CHtml::encode($data->getAttributeLabel('duration')); ?>:</b>
    <?php echo CHtml::encode($data->duration); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('completion')); ?>:</b>
    <?php echo CHtml::encode($data->completion); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('outline_number')); ?>:</b>
    <?php echo CHtml::encode($data->outline_number); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('cost')); ?>:</b>
    <?php echo CHtml::encode($data->cost); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('web_link')); ?>:</b>
    <?php echo CHtml::encode($data->web_link); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('owner_id')); ?>:</b>
    <?php echo CHtml::encode($data->owner_id); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('project_id')); ?>:</b>
    <?php echo CHtml::encode($data->project_id); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('requester_id')); ?>:</b>
    <?php echo CHtml::encode($data->requester_id); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('status_id')); ?>:</b>
    <?php echo CHtml::encode($data->status_id); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('type_id')); ?>:</b>
    <?php echo CHtml::encode($data->type_id); ?>
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