<?php
/* @var $this PvPnController */
/* @var $model PvPn */

$this->breadcrumbs=array(
	'Pv Pns'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List PvPn', 'url'=>array('index')),
	array('label'=>'Create PvPn', 'url'=>array('create')),
	array('label'=>'Update PvPn', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PvPn', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PvPn', 'url'=>array('admin')),
);
?>

<h1>View PvPn #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'PNIDToLNK',
		'PNUNID',
		'PNTabParentID',
		'PNPrefix',
		'PNPartNumber',
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
	),
)); ?>
