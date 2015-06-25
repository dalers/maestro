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
	array('label'=>'Create Issue', 'url'=>array('issue/create', 'pid'=>$model->id)),
);
?>

<h1>View Project "<?php echo $model->name; ?>"</h1>

Last-updated or Created 
<?php 
	echo empty($model->update_time) ? '<em>Unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "<em>Unknown</em>" : $model->update_user_id;
?>
</p>

<h2>Project Master</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		//'id',
		'name',
		'description',
		'code',
		'customer_id',
		array(        
			'name'=>'owner_id',
				'value'=>isset($model->owner)?CHtml::encode($model->owner->username):"unknown"
		),		
		'phase_id',
		'status_id',
		'type_id',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
	),
)); ?>

<br /><br />
<h1>Project Issues</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$issueDataProvider,
	'itemView'=>'/issue/_view',
)); ?>