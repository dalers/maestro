<?php
/* @var $this StockSerialController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Material',
);

$this->menu=array(
	array('label'=>'Create Stock', 'url'=>array('create')),
	//array('label'=>'Manage Stock', 'url'=>array('admin')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
    $('.search-form').toggle();
    return false;
});
$('.search-form form').submit(function(){
    $('#stock-grid').yiiGridView('update', {
        data: $(this).serialize()
    });
    return false;
});
");
?>

<h1>Stock</h1>

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
	'id'=>'stock-serial-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'serial_number',
		'part_number',
		'description',
		'version',
		'status',
		/*
		'part_id',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
