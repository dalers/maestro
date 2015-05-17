<?php
/* @var array $operations[] CAuthItem */

$keys = array_keys($operations);
sort($keys);
$options = (count($keys) > 0)?array_combine($keys, $keys):array();
?>
<div class="" style="display:inline-block">
<div class="span-4">
	<?php echo CHtml::dropDownList('operation', '', $options, array('size'=>14, 'style'=>'width:148px;', 'onchange'=>'selectAuthItem(this,"' . $this->createAbsoluteUrl('ajax/infoAuthItem') . '");')); ?>
</div>
<div class="span-13" id="operation-info"><hr></div>
<div class="span-4">
<?php 
if($this->isAdmin()):
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','New Operation'),array('onclick'=>'openDialogCreate(0);'));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Change Operation'),array('onclick'=>'openDialogChange(0,"' . $this->createAbsoluteUrl('ajax/getAuthItem') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Delete Operation'),array('onclick'=>'deleteAuthItem(0,"' . $this->createAbsoluteUrl('ajax/deleteAuthItem') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Attach Operation'),array('onclick'=>'openDialogAttach(0,0,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Detach Operation'),array('onclick'=>'openDialogDetach(0,0,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
endif;
?>
</div>
</div>