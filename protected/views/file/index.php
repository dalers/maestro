<?php
/* @var $this FileController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Files',
);

$this->menu=array(
	array('label'=>'Create File', 'url'=>array('create')),
	//array('label'=>'Manage File', 'url'=>array('admin')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#customer-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Files</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'file-grid',
	//'dataProvider'=>$model->search(),
	'dataProvider' => $dataProvider,	
	'filter'=>$model,
	'columns'=>array(
		array(
			'name'=> 'id',
			'htmlOptions'=>array('style'=>'width: 100px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->id), array(\'view\', \'id\' => $data->id))',
		),
		array(
			'name'=> 'part_id',
			'htmlOptions'=>array('style'=>'width: 100px;'),
			'type'=>'raw',
			//'value'=>'CHtml::link(CHtml::encode($data->id), array(\'view\', \'id\' => $data->id))',
		),
		'FILFileName',
		/*
		'id',
		'FILPNPartNumber',
		'FILFilePath',
		'FILFileName',
		'FILView',
		'FILNotes',
		'part_id',
		*/
		array('class'=>'CButtonColumn',
		),
	),	
)); ?>
