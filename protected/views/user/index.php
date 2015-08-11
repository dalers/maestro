<?php
/* @var $this UserController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Users',
);

$this->menu=array(
	array('label'=>'Create User', 'url'=>array('create')),
	array('label'=>'Manage User', 'url'=>array('admin')),
	array('label'=>'RBAC Admin', 'url'=>array('rbac/rbacui')),
);
?>

<h1>Users</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'user-grid',
	//'dataProvider'=>$model->search(),
	'dataProvider' => $dataProvider,	
	'filter'=>$model,
	'columns'=>array(
		array(
			'name'=> 'username',
			'htmlOptions'=>array('style'=>'width: 100px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->username), array(\'view\', \'id\' => $data->id))',
		),
		'fname',
		'lname',
		'email',
		/*
		'id',
		'username',
		'password',
		'email',
		'nick',
		'lname',
		'fname',
		'initial',
		'status_id',
		'profile_id',
		'last_login_time',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
		*/
		/*
		array('class'=>'CButtonColumn',
		), */
	),	
)); ?>
