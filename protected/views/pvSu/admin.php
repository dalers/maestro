<?php
/* @var $this PvSuController */
/* @var $model PvSu */

$this->breadcrumbs=array(
	'Pv Sus'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List PvSu', 'url'=>array('index')),
	array('label'=>'Create PvSu', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#pv-su-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Pv Sus</h1>

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
	'id'=>'pv-su-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'SUSupplier',
		'SUAddress',
		'SUCountry',
		'SUPhone1',
		'SUPhone2',
		/*
		'SUFAX',
		'SUWeb',
		'SUContact1',
		'SUContact2',
		'SUDateLast',
		'SUFollowup',
		'SUNotes',
		'SUCode',
		'SUAccount',
		'SUTerms',
		'SUFedTaxID',
		'SUStateTaxID',
		'SUEMail1',
		'SUEMail2',
		'SUCurDedExRate',
		'SUCurExRate',
		'SUCURID',
		'SUCurReverse',
		'SUNoPhonePrefix',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
