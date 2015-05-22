<?php
/* @var $this PartController */
/* @var $model Part */

$this->breadcrumbs=array(
	'Parts'=>array('index'),
	CHtml::encode($model->PNPartNumber),
);

$this->menu=array(
	array('label'=>'List Parts', 'url'=>array('index')),
	array('label'=>'Create Part', 'url'=>array('create')),
	array('label'=>'Update Part', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Part', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Parts', 'url'=>array('admin')),
	array('label'=>'Save As PDF', 'url'=> array('saveAsPDF', 'id' => $model->id), 'linkOptions' => array('target' => '_blank')),
    array('label'=>'Suggest Location', 'url'=> array('suggestLocation', 'id' => $model->id)),
);
?>

<h1>View Part '<?php echo CHtml::encode($model->PNPartNumber); ?>'</h1>

<p>Created on <?php echo empty($model->create_time) ? 'Unknown date/time' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "Unknown user" : $model->create_user_id; ?>

<?php
    // Show update information only if the Part Number was updated

    if (!empty($model->update_time)) {
?>
, Updated on 
<?php 
        echo empty($model->update_time) ? 'Unknown date/time' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "Unknown user" : $model->update_user_id;
    }
?>
</p>

<!-- Create DIV's for jQuery's tab control. At the end of the file we initialize this tab control via JavaScript -->

<div id="tabs">

<!-- Create jQuery's tabs using <li> tags -->
<ul>
 <li><a href="#tabs-1">Part Master</a></li>
 <li><a href="#tabs-2">Parts List</a></li>
 <li><a href="#tabs-3">Used On</a></li>
</ul>

<div id="tabs-1">
<h2>General Properties</h2>

<?php 

    //detail Part information separated into logical parts.
    //uses helper functions 'valueToText' and 'YesNo' declared in Part model

    $this->widget('zii.widgets.CDetailView', array(
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
        array('label' => $model->getAttributeLabel('PNStatus'), 'type' => 'raw', 'value' => ViewHelpers::valueToText($model->PNStatus, array('U' => 'Unreleased', 'R' => 'Released', 'O' => 'Obsolete'))),
        array('label' => 'Units', 'type' => 'raw', 'value' => $model->unit->UNUseUnits . ' '),
        'PNReqBy',
		'PNTab',
        array('label' => $model->getAttributeLabel('PNControlled'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNControlled, 1, 'Yes', 'No')),
		'PNAux1',
		'PNQty',
		'PNQty2',
		'PNCostChanged',
        array('label' => $model->getAttributeLabel('PNParentCost'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNParentCost, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNMadeFrom'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNMadeFrom, 1, 'Yes', 'No')),
		'PNOnECO',
		'PNCurrentCost',
		//'PNUSRID',
		//'PNUserLock',
	),
)); ?>

<h2>Notes</h2>

<?php if (empty($model->PNNotes)) { ?>
    <span style="font-style: italic">No notes.</span>
<?php } else { echo CHtml::encode($model->PNNotes); } ?>

<h2>User Defined Fields</h2>

<?php 

// Here I use static function PvHpref::captionByField to get captions for user defined fields.
// When PvHpref::captionByField called first time it loads all captions from PvHpref tables and stores it
// so following calls to PvHpref::captionByField do not read from DB.

$this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		array('label' => PvHpref::captionByField("PNUser1"), 'type' => 'raw', 'value' => $model->PNUser1),
		array('label' => PvHpref::captionByField("PNUser2"), 'type' => 'raw', 'value' => $model->PNUser2),
		array('label' => PvHpref::captionByField("PNUser3"), 'type' => 'raw', 'value' => $model->PNUser3),
		array('label' => PvHpref::captionByField("PNUser4"), 'type' => 'raw', 'value' => $model->PNUser4),
		array('label' => PvHpref::captionByField("PNUser5"), 'type' => 'raw', 'value' => $model->PNUser5),
		array('label' => PvHpref::captionByField("PNUser6"), 'type' => 'raw', 'value' => $model->PNUser6),
		array('label' => PvHpref::captionByField("PNUser7"), 'type' => 'raw', 'value' => $model->PNUser7),
		array('label' => PvHpref::captionByField("PNUser8"), 'type' => 'raw', 'value' => $model->PNUser8),
		array('label' => PvHpref::captionByField("PNUser9"), 'type' => 'raw', 'value' => $model->PNUser9),
		array('label' => PvHpref::captionByField("PNUser10"), 'type' => 'raw', 'value' => $model->PNUser10),
	),
)); ?>

<h2>Stocking Properties</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        'stock_location_id',
        'requester_id',
        'PNMinStockQty',
        array('label' => $model->getAttributeLabel('PNOrderToMaintain'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNOrderToMaintain, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNExpandList'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNExpandList, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNInclAssyOnPurchList'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNInclAssyOnPurchList, 1, 'Yes', 'No')),
	),
)); ?>

<h2>Assembly Cost</h2>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        array('label' => $model->getAttributeLabel('PNAssyCostOption'), 'type' => 'raw', 'value' => ViewHelpers::valueToText($model->PNAssyCostOption, array('1' => 'Use as Total', '2' => 'Ignore', '3' => 'Add to Total'))),
        'PNLastRollupCost',
	),
)); ?>

<h2>Kitting Properties</h2>
<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        array('label' => $model->getAttributeLabel('PNOverKit'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNOverKit, 1, 'Yes', 'No')),
		'PNOverKitQty',
		array('label' => $model->getAttributeLabel('PNOverKitBy'), 'type' => 'raw', 'value' => ViewHelpers::valueToText($model->PNOverKitBy, array('0' => 'By Count', '-1' => 'By Percent'))),
        array('label' => $model->getAttributeLabel('PNOverKitFor'), 'type' => 'raw', 'value' => ViewHelpers::valueToText($model->PNOverKitFor, array('0' => 'Entire Build', '-1' => 'Each Top Assy'))),
	),
)); ?>

</div> <!-- <div id="tabs-1"> -->

<div id="tabs-2">

<h2>Parts List</h2>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->childs($model->id),
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
    'emptyText' => 'The detail has no parts.',
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
			'value'=>'CHtml::link(CHtml::encode($data->detail->PNPartNumber), array(\'view\', \'id\' => $data->detail->id))',
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
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->detail->PNTitle)',
		),
		array(
			'name'=>$model->getAttributeLabel('PNDetail'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->detail->PNDetail)',
		),
	),
));

?>

</div> <!-- <div id="tabs-1"> -->

<div id="tabs-3">

<h2>Used On</h2>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->parents($model->id),
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
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
			'value'=>'CHtml::link(CHtml::encode($data->partof->PNPartNumber), array(\'view\', \'id\' => $data->partof->id))',
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
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->partof->PNTitle)',
		),
		array(
			'name'=>$model->getAttributeLabel('PNDetail'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 250px; display: table-cell; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 250px;'),
			'value'=>'CHtml::encode($data->partof->PNDetail)',
		),
	),
));
?>

</div> <!-- <div id="tabs-3"> -->

<!-- The following code initializes DIV's above as TAB control -->

<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>