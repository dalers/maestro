<?php
/* @var $this PartController */
/* @var $model Part */

$this->breadcrumbs=array(
	'Part'=>array('index'),
	CHtml::encode($model->PNPartNumber),
);

$this->menu=array(
	array('label'=>'List Parts', 'url'=>array('index')),
	array('label'=>'Create Part', 'url'=>array('create')),
	array('label'=>'Update Part', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Part', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	//array('label'=>'Manage Parts', 'url'=>array('admin')),
	array('label'=>'Save As PDF', 'url'=> array('saveAsPDF', 'id' => $model->id), 'linkOptions' => array('target' => '_blank')),
    array('label'=>'Suggest Location', 'url'=> array('suggestLocation', 'id' => $model->id)),
);
?>

<h1>View Part '<?php echo CHtml::encode($model->PNPartNumber); ?>'</h1>

<p>Created: <?php echo empty($model->create_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "<em>unknown</em>" : $model->createUser->username; ?>
<br />Updated:  <?php echo empty($model->update_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "<em>unknown</em>" : $model->updateUser->username; ?>
</p>

<h2>Part Master</h2>

<?php
    $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        'PNPartNumber',
		'PNTitle',
		'PNDetail',
		'type_id',
		//TODO use part::getStatusOptions() to get text value
		array('label' => $model->getAttributeLabel('status_id'), 'type' => 'raw', 'value' => ViewHelpers::valueToText($model->status_id, array('U' => 'Unreleased', 'R' => 'Released', 'O' => 'Obsolete'))),
		'PNRevision',
        array('label' => $model->getAttributeLabel('PNDate'), 'type' => 'raw', 'value' => strftime("%B %d, %Y", strtotime(CHtml::encode($model->PNDate)))),
        //TODO show PNTabParentID as "Show Parent" link if parent exists otherwise non-checked checkbox "Parent Part" (see P&V)
		array('label' => $model->getAttributeLabel('PNTabParentID'), 'type' => 'raw', 'value' => (isset($model->tabparent) ? CHtml::link(CHtml::encode($model->tabparent->PNPartNumber), array('view', 'id' => $model->tabparent->id)) : '')),
        //array('label' => $model->getAttributeLabel('PNMadeFrom'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNMadeFrom, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNControlled'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNControlled, 1, 'Yes', 'No')),
		//TODO use part-unit relation to get unit text value
        array('label' => 'Units', 'type' => 'raw', 'value' => $model->unit->UNUseUnits . ' '),
        'PNReqBy',
        //'requester_id', //TODO refactor with PNReqBy
		'PNQty',
		'PNCurrentCost',

		//'PNMadeFrom', //PV6ECO only
        //'stock_location_id', //TODO hardcoded using PNUser9, see db stored procedure suggest_location()
		//'PNPrefix',
		//'PNSuffix',
		//'PNTab',
		//'PNAux1',
		//'PNQty2',
		//'PNCostChanged',
        //array('label' => $model->getAttributeLabel('PNParentCost'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNParentCost, 1, 'Yes', 'No')),
		//'PNOnECO',
		//'PNUSRID',
		//'PNUserLock',
	),
));
?>

<br /><br />
<h2>Additional Information</h2>
</p>

<!-- DIV's for jQuery tab control. Tab control is initialized at end of file via JavaScript -->
<div id="tabs">

<!-- Create jQuery tabs using <li> tags -->
<ul>
	<li><a href="#tab-more">More</a></li>
	<li><a href="#tab-assy-cost">Assy Cost</a></li>
	<li><a href="#tab-comments">Comments</a></li>
	<li><a href="#tab-files">Files</a></li>
	<li><a href="#tab-issues">Issues</a></li>
	<li><a href="#tab-kitting">Kitting</a></li>
	<li><a href="#tab-orders">Orders</a></li>
	<li><a href="#tab-parts-list">Parts List</a></li>
	<li><a href="#tab-projects">Projects</a></li>
	<li><a href="#tab-sources">Sources</a></li>
	<li><a href="#tab-stock">Stock</a></li>
	<li><a href="#tab-used-on">Used On</a></li>
</ul>

<div id="tab-assy-cost">
<h2>Assembly Cost</h2>
<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        array('label' => $model->getAttributeLabel('PNAssyCostOption'), 'type' => 'raw', 'value' => ViewHelpers::valueToText($model->PNAssyCostOption, array('1' => 'Use as Total', '2' => 'Ignore', '3' => 'Add to Total'))),
        'PNLastRollupCost',
	),
));
?>
</div> <!-- <div id="tab-assy-cost"> -->

<div id="tab-comments">
<h2>Comments</h2>
<?php if (empty($model->PNNotes)) { ?>
    <span style="font-style: italic">There are no comments associated with this part.</span>
<?php } else { echo CHtml::encode($model->PNNotes); } ?>
</div> <!-- <div id="tab-comments"> -->

<div id="tab-files">
<h2>Files / URLs</h2>
<p><em>There are no files associated with this part.</em></p>
</div> <!-- <div id="tab-files"> -->

<div id="tab-issues">
<h2>Issues</h2>
<p><em>There are no issues associated with this part.</em></p>
</div> <!-- <div id="tab-issues"> -->

<div id="tab-kitting">
<h2>Kitting Properties</h2>
<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        array('label' => $model->getAttributeLabel('PNOverKit'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNOverKit, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNOverKitFor'), 'type' => 'raw', 'value' => ViewHelpers::valueToText($model->PNOverKitFor, array('0' => 'Entire Build', '-1' => 'Each Top Assy'))),
		array('label' => $model->getAttributeLabel('PNOverKitBy'), 'type' => 'raw', 'value' => ViewHelpers::valueToText($model->PNOverKitBy, array('0' => 'By Count', '-1' => 'By Percent'))),
		'PNOverKitQty',
	),
));
?>
</div> <!-- <div id="tab-kitting"> -->

<div id="tab-more">
<h2>More Fields</h2>
<h3>User Defined Fields</h3>
<?php 
//here I use static function PvHpref::captionByField to get captions for user
//defined fields. When PvHpref::captionByField called first time it loads all
//captions from PvHpref tables and stores it so following calls to
//PvHpref::captionByField do not read from DB.
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
));
?>
</div> <!-- <div id="tab-more"> -->

<div id="tab-orders">
<h2>Orders</h2>
<p><em>There are no orders associated with this part.</em></p>
</div> <!-- <div id="tab-orders"> -->

<div id="tab-projects">
<h2>Projects</h2>
<p><em>There are no projects associated with this part.</em></p>
</div> <!-- <div id="tab-orders"> -->

<div id="tab-parts-list">
<h2>Parts List</h2>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->childs($model->id),
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
    'emptyText' => 'This part has no child parts.',
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
			'name'=>$model->getAttributeLabel('type_id'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->detail->type_id)',
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
</div> <!-- <div id="tab-parts-list"> -->

<div id="tab-sources">
<h2>Sources</h2>
<p><em>There are no sources identified for this part.</em></p>
</div> <!-- <div id="tab-sources"> -->

<div id="tab-stock">
<h2>Stock Properties</h2>
<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
        'PNMinStockQty',
        array('label' => $model->getAttributeLabel('PNOrderToMaintain'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNOrderToMaintain, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNExpandList'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNExpandList, 1, 'Yes', 'No')),
        array('label' => $model->getAttributeLabel('PNInclAssyOnPurchList'), 'type' => 'raw', 'value' => ViewHelpers::YesNo($model->PNInclAssyOnPurchList, 1, 'Yes', 'No')),
	),
));
?>
</br>
<h2>Stock Items</h2>
<p><em>There are no stock items associated with this part.</em></p>
</div> <!-- <div id="tab-stock"> -->

<div id="tab-used-on">
<h2>Used On</h2>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->parents($model->id),
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
    'emptyText' => 'This part has no parent parts.',
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
			'name'=>$model->getAttributeLabel('type_id'),
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 50px; text-align: center;'),
			'value'=>'CHtml::encode($data->partof->type_id)',
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
</div> <!-- <div id="tab-used-on"> -->

</div> <!-- <div id="tabs"> -->
<!-- The following code initializes DIV's above as TAB control -->

<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>