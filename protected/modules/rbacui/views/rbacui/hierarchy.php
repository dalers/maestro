<?php
/* @var $this DefaultController */
/* @array $roles[] CAuthItem */
/* @array $tasks[] CAuthItem */
/* @array $operations[] CAuthItem */

function showChildren($item, $level) {
	$class = array('operation','task','role');
	$type = array(Yii::t('RbacuiModule.rbacui','operation'),Yii::t('RbacuiModule.rbacui','task'),Yii::t('RbacuiModule.rbacui','role'));
	echo '<div class="'. $class[$item->type] . ' level' . $level . '" title="' . $type[$item->type] . ': ' . $item->description . '">' . $item->name . '</div>';
	$level++;
	foreach($item->children as $name => $authItem) {
		showChildren($authItem, $level);
	}
}

foreach($roles as $name => $item) {
	showChildren($item, 0);
}
foreach($tasks as $name => $item) {
	showChildren($item, 0);
}
foreach($operations as $name => $item) {
	showChildren($item, 0);
}
?>