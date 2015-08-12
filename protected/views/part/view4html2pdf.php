<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>

    <style>
        th.details { width: 350px; }
    </style>
</head>

<body>

<div class="container" id="page" style="padding: 10px; width: 1000px">

<h1>Part '<?php echo CHtml::encode($model->PNPartNumber); ?>'</h1>

<p>Created: <?php echo empty($model->create_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->create_time))); ?> by <?php echo empty($model->create_user_id) ? "<em>unknown</em>" : $model->createUser->username; ?>
<br />Updated:  <?php echo empty($model->update_time) ? '<em>unknown</em>' : strftime("%B %d, %Y", strtotime(CHtml::encode($model->update_time))); ?> by <?php echo empty($model->update_user_id) ? "<em>unknown</em>" : $model->updateUser->username; ?>
</p>

<h2>General Properties</h2>

<table>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNPartNumber'); ?></th>
<td><?php echo CHtml::encode($model->PNPartNumber); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNTabParentID'); ?></th>
<td><?php echo (isset($model->tabparent) ? CHtml::encode($model->tabparent->PNPartNumber) : ""); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNDate'); ?></th>
<td><?php echo strftime("%B %d, %Y", strtotime(CHtml::encode($model->PNDate))); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNPrefix'); ?></th>
<td><?php echo CHtml::encode($model->PNPrefix); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNSuffix'); ?></th>
<td><?php echo CHtml::encode($model->PNSuffix); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNTitle'); ?></th>
<td><?php echo CHtml::encode($model->PNTitle); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNDetail'); ?></th>
<td><?php echo CHtml::encode($model->PNDetail); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('type_id'); ?></th>
<td><?php echo CHtml::encode($model->type_id); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNRevision'); ?></th>
<td><?php echo CHtml::encode($model->PNRevision); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('status_id'); ?></th>
<td><?php echo $model->valueToText($model->status_id, array('U' => 'Unreleased', 'R' => 'Released', 'O' => 'Obsolete')); ?></td>
</tr>
<tr>
<th class="details"><?php echo "Units"; ?></th>
<td><?php echo CHtml::encode($model->unit->UNUseUnits); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNReqBy'); ?></th>
<td><?php echo CHtml::encode($model->PNReqBy); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNTab'); ?></th>
<td><?php echo CHtml::encode($model->PNTab); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNControlled'); ?></th>
<td><?php echo $model->YesNo($model->PNControlled, 1, 'Yes', 'No'); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNAux1'); ?></th>
<td><?php echo CHtml::encode($model->PNAux1); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNQty'); ?></th>
<td><?php echo CHtml::encode($model->PNQty); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNQty2'); ?></th>
<td><?php echo CHtml::encode($model->PNQty2); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNCostChanged'); ?></th>
<td><?php echo CHtml::encode($model->PNCostChanged); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNParentCost'); ?></th>
<td><?php echo $model->YesNo($model->PNParentCost, 1, 'Yes', 'No'); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNMadeFrom'); ?></th>
<td><?php echo $model->YesNo($model->PNParentCost, 1, 'Yes', 'No'); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNOnECO'); ?></th>
<td><?php echo CHtml::encode($model->PNOnECO); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNCurrentCost'); ?></th>
<td><?php echo CHtml::encode($model->PNCurrentCost); ?></td>
</tr>
</table>

<h2>Notes</h2>

<?php if (empty($model->PNNotes)) { ?>
    <span style="font-style: italic">There are no notes.</span>
<?php } else { echo CHtml::encode($model->PNNotes); } ?>

<h2>User Defined Fields</h2>

<table>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser1")); ?></th>
<td><?php echo CHtml::encode($model->PNUser1); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser2")); ?></th>
<td><?php echo CHtml::encode($model->PNUser2); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser3")); ?></th>
<td><?php echo CHtml::encode($model->PNUser3); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser4")); ?></th>
<td><?php echo CHtml::encode($model->PNUser4); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser5")); ?></th>
<td><?php echo CHtml::encode($model->PNUser5); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser6")); ?></th>
<td><?php echo CHtml::encode($model->PNUser6); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser7")); ?></th>
<td><?php echo CHtml::encode($model->PNUser7); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser8")); ?></th>
<td><?php echo CHtml::encode($model->PNUser8); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser9")); ?></th>
<td><?php echo CHtml::encode($model->PNUser9); ?></td>
</tr>
<tr>
<th class="details"><?php echo CHtml::encode(PvPod::captionByField("PNUser10")); ?></th>
<td><?php echo CHtml::encode($model->PNUser10); ?></td>
</tr>
</table>

<h2>Stocking Properties</h2>

<table>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('stock_location_id'); ?></th>
<td><?php echo ($model->stock_location_id == null) ? "Not Set" : CHtml::encode($model->stock_location_id); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('requester_id'); ?></th>
<td><?php echo ($model->requester_id == null) ? "Not Set" : CHtml::encode($model->requester_id); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNMinStockQty'); ?></th>
<td><?php echo ($model->PNMinStockQty == null) ? "Not Set" : CHtml::encode($model->PNMinStockQty); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNOrderToMaintain'); ?></th>
<td><?php echo $model->YesNo($model->PNOrderToMaintain, 1, 'Yes', 'No'); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNExpandList'); ?></th>
<td><?php echo $model->YesNo($model->PNExpandList, 1, 'Yes', 'No'); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNInclAssyOnPurchList'); ?></th>
<td><?php echo $model->YesNo($model->PNInclAssyOnPurchList, 1, 'Yes', 'No'); ?></td>
</tr>
</table>

<h2>Assembly Cost</h2>

<table>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNAssyCostOption'); ?></th>
<td><?php echo $model->valueToText($model->PNAssyCostOption, array('1' => 'Use as Total', '2' => 'Ignore', '3' => 'Add to Total')); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNLastRollupCost'); ?></th>
<td><?php echo ($model->PNLastRollupCost == null) ? "Not Set" : CHtml::encode($model->PNLastRollupCost); ?></td>
</tr>
</table>

<h2>Kitting Properties</h2>

<table>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNOverKit'); ?></th>
<td><?php echo $model->YesNo($model->PNOverKit, 1, 'Yes', 'No'); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNOverKitQty'); ?></th>
<td><?php echo ($model->PNOverKitQty == null) ? "Not Set" : CHtml::encode($model->PNOverKitQty); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNOverKitBy'); ?></th>
<td><?php echo $model->valueToText($model->PNOverKitBy, array('0' => 'By Count', '-1' => 'By Percent')); ?></td>
</tr>
<tr>
<th class="details"><?php echo $model->getAttributeLabel('PNOverKitFor'); ?></th>
<td><?php echo $model->valueToText($model->PNOverKitFor, array('0' => 'Entire Build', '-1' => 'Each Top Assy')); ?></td>
</tr>
</table>

<h2>Parts List</h2>

<?php 

$childs = $model->childs($model->id, -1)->getData();

if (count($childs) == 0)
{

?>

<p>This part has no child parts (i.e. no parts list).</p>

<?php

}
else
{
?>

<table>
<tr>
<th style="width:30px"><?php echo ('Item'); ?></th>
<th style="width:90px"><?php echo $model->getAttributeLabel('PNPartNumber'); ?></th>
<th style="width:30px"><?php echo ('Qty'); ?></th>
<th style="width:40px"><?php echo $model->getAttributeLabel('type_id'); ?></th>
<th style="width:350px"><?php echo $model->getAttributeLabel('PNTitle'); ?></th>
<!-- <th><?php echo $model->getAttributeLabel('PNDetail'); ?></th> -->
</tr>

<?php

foreach ($childs as $child)
{
    echo "<tr>";
    echo "<td>" . CHtml::encode($child->PLItem) . "</td>";
    echo "<td>" . CHtml::encode($child->detail->PNPartNumber) . "</td>";
    echo "<td>" . CHtml::encode($child->PLQty) . "</td>";
    echo "<td>" . CHtml::encode($child->detail->type_id) . "</td>";
    echo "<td>" . CHtml::encode($child->detail->PNTitle) . "</td>";
    //echo "<td>" . CHtml::encode($child->detail->PNDetail) . "</td>";
    echo "</tr>";
}

?>
</table>

<?php
}
?>

<h2>Used On</h2>

<?php 

$parents = $model->parents($model->id, -1)->getData();

if (count($parents) == 0)
{

?>

<p>This part has no parent parts (i.e. it is not included in an assembly).</p>

<?php

}
else
{

?>

<table>
<tr>
<th style="width:30px"><?php echo ('Item'); ?></th>
<th style="width:90px"><?php echo $model->getAttributeLabel('PNPartNumber'); ?></th>
<th style="width:30px"><?php echo ('Qty'); ?></th>
<th style="width:40px"><?php echo $model->getAttributeLabel('type_id'); ?></th>
<th style="width:350px"><?php echo $model->getAttributeLabel('PNTitle'); ?></th>
<!-- <th><?php echo $model->getAttributeLabel('PNDetail'); ?></th> -->
</tr>

<?php

foreach ($parents as $item)
{
    echo "<tr>";
    echo "<td>" . CHtml::encode($item->PLItem) . "</td>";
    echo "<td>" . CHtml::encode($item->partof->PNPartNumber) . "</td>";
    echo "<td>" . CHtml::encode($item->PLQty) . "</td>";
    echo "<td>" . CHtml::encode($item->partof->type_id) . "</td>";
    echo "<td>" . CHtml::encode($item->partof->PNTitle) . "</td>";
    //echo "<td>" . CHtml::encode($item->partof->PNDetail) . "</td>";
    echo "</tr>";
}

?>
</table>
<?php
}
?>

</div>

</body>
</html>