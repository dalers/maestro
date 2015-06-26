<?php
/* @var $this PartController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Parts',
);

$this->menu=array(
	array('label'=>'Create Part', 'url'=>array('create')),
	array('label'=>'Manage Parts', 'url'=>array('admin')),
	array('label'=>'Save Parts as CSV', 'url'=> array('saveAsCSV')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#pv-pn-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Parts</h1>

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
    'id' => 'cgridview',
	'dataProvider' => $dataProvider,
	'filter' => $model,
	'columns' => array(
		array(
			'name'=> 'PNPartNumber',
            'htmlOptions'=>array('style'=>'width: 150px;'),
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->PNPartNumber), array(\'view\', \'id\' => $data->id))',
		),
        array(
			'name'=>'type_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->type_id)',
		),
        array(
			'name'=>'status_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->status_id)',
		),
        array(
			'name'=>'PNRevision',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->PNRevision)',
		),
		array(
			'name'=>'PNTitle',
            'htmlOptions'=>array('style'=>'width: 350px;'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->PNTitle)',
		),
		array(
			'name'=>'PNDetail',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->PNDetail)',
		),
		array(
			'class'=>'CButtonColumn',
		),
	),
));

?>