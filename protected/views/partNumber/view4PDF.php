<?php
/* @var $this PartNumberController */
/* @var $model PvPn */

$this->breadcrumbs=array(
	'Parts'=>array('index'),
	CHtml::encode($model->PNPartNumber),
);

$this->menu=array(
	array('label'=>'List Parts', 'url'=>array('index')),
	array('label'=>'Create', 'url'=>array('create')),
	array('label'=>'Update', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Parts', 'url'=>array('admin')),
);
?>

<h1>View Part '<?php echo CHtml::encode($model->PNPartNumber); ?>'</h1>

<p>Created on <?php echo strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by user '<?php echo $model->create_user_id; ?>'<br/>
Updated on <?php echo strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by user '<?php echo $model->update_user_id; ?>'</p>

<div id="tabs-1">
<h2>General properties</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        'PNPartNumber',
        array('label' => $model->getAttributeLabel('PNTabParentID'), 'type' => 'raw', 'value' => (isset($model->tabparent) ? CHtml::link(CHtml::encode($model->tabparent->PNPartNumber), array('view', 'id' => $model->tabparent->id)) : '')),
        array('label' => $model->getAttributeLabel('PNDate'), 'type' => 'raw', 'value' => strftime("%B %d, %Y", strtotime(CHtml::encode($model->PNDate)))),
        'PNPrefix',
		'PNSuffix',
		'PNTitle',
		'PNDetail',
		'PNType',
		'PNRevision',
        array('label' => $model->getAttributeLabel('PNStatus'), 'type' => 'raw', 'value' => $model->valueToText($model->PNStatus, array('U' => 'Unreleased', 'R' => 'Released', 'O' => 'Obsolete'))),
        array('label' => 'Units', 'type' => 'raw', 'value' => $model->unit->UNUseUnits . ' '),
        'PNReqBy',
		'PNTab',
        array('label' => $model->getAttributeLabel('PNControlled'), 'type' => 'raw', 'value' => $model->YesNo($model->PNControlled, 1, 'Yes', 'No')),
		'PNAux1',
		'PNQty',
		'PNQty2',
		'PNCostChanged',
        array('label' => $model->getAttributeLabel('PNParentCost'), 'type' => 'raw', 'value' => $model->YesNo($model->PNParentCost, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNMadeFrom'), 'type' => 'raw', 'value' => $model->YesNo($model->PNMadeFrom, 1, 'Yes', 'No')),
		'PNOnECO',
		'PNCurrentCost',
		//'PNUSRID',
		//'PNUserLock',
	),
)); ?>

<h2>User's notes</h2>

<?php if (empty($model->PNNotes)) { ?>
    <span style="font-style: italic">There are no user notes</span>
<?php } else { echo CHtml::encode($model->PNNotes); } ?>

<h2>User's information</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		array('label' => PvPod::captionByField("PNUser1"), 'type' => 'raw', 'value' => $model->PNUser1),
		array('label' => PvPod::captionByField("PNUser2"), 'type' => 'raw', 'value' => $model->PNUser2),
		array('label' => PvPod::captionByField("PNUser3"), 'type' => 'raw', 'value' => $model->PNUser3),
		array('label' => PvPod::captionByField("PNUser4"), 'type' => 'raw', 'value' => $model->PNUser4),
		array('label' => PvPod::captionByField("PNUser5"), 'type' => 'raw', 'value' => $model->PNUser5),
		array('label' => PvPod::captionByField("PNUser6"), 'type' => 'raw', 'value' => $model->PNUser6),
		array('label' => PvPod::captionByField("PNUser7"), 'type' => 'raw', 'value' => $model->PNUser7),
		array('label' => PvPod::captionByField("PNUser8"), 'type' => 'raw', 'value' => $model->PNUser8),
		array('label' => PvPod::captionByField("PNUser9"), 'type' => 'raw', 'value' => $model->PNUser9),
		array('label' => PvPod::captionByField("PNUser10"), 'type' => 'raw', 'value' => $model->PNUser10),
	),
)); ?>

<h2>Stock</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        'stock_location_id',
        'requester_id',
        'PNMinStockQty',
        array('label' => $model->getAttributeLabel('PNOrderToMaintain'), 'type' => 'raw', 'value' => $model->YesNo($model->PNOrderToMaintain, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNExpandList'), 'type' => 'raw', 'value' => $model->YesNo($model->PNExpandList, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNInclAssyOnPurchList'), 'type' => 'raw', 'value' => $model->YesNo($model->PNInclAssyOnPurchList, 1, 'Yes', 'No')),
	),
)); ?>

<h2>Assy Cost</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        array('label' => $model->getAttributeLabel('PNAssyCostOption'), 'type' => 'raw', 'value' => $model->valueToText($model->PNAssyCostOption, array('1' => 'Use as Total', '2' => 'Ignore', '3' => 'Add to Total'))),
        'PNLastRollupCost',
	),
)); ?>

<h2>Kitting properties</h2>
<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        array('label' => $model->getAttributeLabel('PNOverKit'), 'type' => 'raw', 'value' => $model->YesNo($model->PNOverKit, 1, 'Yes', 'No')),
		'PNOverKitQty',
		array('label' => $model->getAttributeLabel('PNOverKitBy'), 'type' => 'raw', 'value' => $model->valueToText($model->PNOverKitBy, array('0' => 'By Count', '-1' => 'By Percent'))),
        array('label' => $model->getAttributeLabel('PNOverKitFor'), 'type' => 'raw', 'value' => $model->valueToText($model->PNOverKitFor, array('0' => 'Entire Build', '-1' => 'Each Top Assy'))),
	),
)); ?>

</div> <!-- <div id="tabs-1"> -->

<div id="tabs-2">

<h2>Parts List</h2>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->childs($model->id, -1),
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
    'emptyText' => 'The detail has no parts.',
    'enablePagination' => false,
    'enableSorting' => false,
    'hideHeader' => false,
	'columns' => array(
        array(
			'name'=>'PLItem',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->PLItem)',
		),
		array(
			'name'=> $model->getAttributeLabel('PNPartNumber'),
            'htmlOptions'=>array('style'=>'width: 150px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->detail->PNPartNumber)',
		),
        array(
			'name'=> 'PLQty',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->PLQty)',
		),
        array(
			'name'=>$model->getAttributeLabel('PNType'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->detail->PNType)',
		),
		array(
			'name'=>$model->getAttributeLabel('PNTitle'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 300px;'),
			'value'=>'CHtml::encode($data->detail->PNTitle)',
		),
		array(
			'name'=>$model->getAttributeLabel('PNDetail'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->detail->PNDetail)',
		),
	),
));

?>

<h2>Part of</h2>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->parents($model->id, -1),
    'id' => 'detail_parents_id',
    'showTableOnEmpty' => false,
    'enablePagination' => false,
    'enableSorting' => false,
    'hideHeader' => false,
    'emptyText' => 'The detail is not a part of other details.',
	'columns' => array(
        array(
			'name'=>'PLItem',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->PLItem)',
		),
		array(
			'name'=> $model->getAttributeLabel('PNPartNumber'),
            'htmlOptions'=>array('style'=>'width: 150px;'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->partof->PNPartNumber)',
		),
        array(
			'name'=>'PLQty',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->PLQty)',
		),
        array(
			'name'=>$model->getAttributeLabel('PNType'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->partof->PNType)',
		),
		array(
			'name'=>$model->getAttributeLabel('PNTitle'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 300px;'),
			'value'=>'CHtml::encode($data->partof->PNTitle)',
		),
		array(
			'name'=>$model->getAttributeLabel('PNDetail'),
			'type'=>'raw',
			'value'=>'CHtml::encode($data->partof->PNDetail)',
		),
	),
));
?>

</div> <!-- <div id="tabs-2"> -->