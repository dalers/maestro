<?php
/* @var $this ProjectController */
/* @var $model Project */

$this->breadcrumbs=array(
	'Projects'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Project', 'url'=>array('index')),
	array('label'=>'Create Project', 'url'=>array('create')),
	array('label'=>'Update Project', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Project', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Project', 'url'=>array('admin')),
);
?>

<h1>View Project #<?php echo $model->id; ?></h1>

<p>Created on <?php echo empty($model->create_time) ? 'Unknown date/time' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "Unknown user" : $model->createUser->username; ?>

<?php
    // Show update information only if the Project was updated

    if (!empty($model->update_time)) {
?>
, Updated on 
<?php 
        echo empty($model->update_time) ? 'Unknown date/time' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "Unknown user" : $model->updateUser->username;
    }
?>
</p>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'acct1',
		'acct2',
		'acct3',
		'acct4',
		'name',
		'client',
		'description',
		'type',
		'status',
		'milestone',
		'milestone_date',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
	),
)); ?>
