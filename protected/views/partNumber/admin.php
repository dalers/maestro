<?php
/* @var $this PartNumberController */
/* @var $model PvPn */

$this->breadcrumbs=array(
	'Parts'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Parts', 'url'=>array('index')),
	array('label'=>'Create Part', 'url'=>array('create')),
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

<h1>Manage Parts</h1>

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
	'id'=>'pv-pn-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'PNIDToLNK',
		'PNUNID',
		'PNTabParentID',
		'PNPrefix',
		'PNPartNumber',
		/*
		'PNSuffix',
		'PNType',
		'PNRevision',
		'PNTitle',
		'PNDetail',
		'PNStatus',
		'PNReqBy',
		'PNNotes',
		'PNUser1',
		'PNUser2',
		'PNUser3',
		'PNUser4',
		'PNUser5',
		'PNUser6',
		'PNUser7',
		'PNUser8',
		'PNUser9',
		'PNUser10',
		'PNDate',
		'PNTab',
		'PNControlled',
		'PNAux1',
		'PNQty',
		'PNQty2',
		'PNCostChanged',
		'PNParentCost',
		'PNExpandList',
		'PNAssyCostOption',
		'PNInclAssyOnPurchList',
		'PNMadeFrom',
		'PNMinStockQty',
		'PNOrderToMaintain',
		'PNOnECO',
		'PNOverKit',
		'PNOverKitQty',
		'PNOverKitBy',
		'PNOverKitFor',
		'PNCurrentCost',
		'PNLastRollupCost',
		'PNUSRID',
		'PNUserLock',
		'type_id',
		'stock_location_id',
		'requester_id',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
