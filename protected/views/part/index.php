<?php
/* @var $this PartController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Parts',
);

$this->menu=array(
	array('label'=>'Create Part', 'url'=>array('create')),
	//array('label'=>'Manage Parts', 'url'=>array('admin')),
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
	'dataProvider'=>$model->search(),
	'filter' => $model,
	'columns' => array(
		array(
			'name'=> 'PNPartNumber',
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->PNPartNumber), array(\'view\', \'id\' => $data->id))',
		),
        array(
			'name'=>'type_id',
			//'value'=>'CHtml::encode($data->type_id)',
		),
        array(
			'name'=>'status_id',
			//'value'=>'CHtml::encode($data->status_id)',
		),
        array(
			'name'=>'PNRevision',
			//'value'=>'CHtml::encode($data->PNRevision)',
		),
		array(
			'name'=>'PNTitle',
			//'value'=>'CHtml::encode($data->PNTitle)',
		),
		array(
			'name'=>'PNDetail',
			//'value'=>'CHtml::encode($data->PNDetail)',
		),
		/*
		'id',
		'PNIDToLNK',
		'PNUNID',
		'PNTabParentID',
		'PNPrefix',
		'PNPartNumber',
		'PNSuffix',
		'type_id',
		'PNRevision',
		'PNTitle',
		'PNDetail',
		'status_id',
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
		'is_serialized',
		'requester_id',
		'status_id',
		'stock_location_id',
		'type_id',
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