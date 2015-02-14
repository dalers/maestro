<?php
/* @var $this PvCurController */
/* @var $model PvCur */

$this->breadcrumbs=array(
	'Pv Curs'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List PvCur', 'url'=>array('index')),
	array('label'=>'Create PvCur', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#pv-cur-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Pv Curs</h1>

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
	'id'=>'pv-cur-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'CURCurrencyName',
		'CURExchangeRate',
		'CURCurrencyChar',
		'CURFormat',
		'CURFormatExt',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
