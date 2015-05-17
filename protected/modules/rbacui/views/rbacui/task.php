<?php
/* @var array $tasks[] CAuthItem */

$keys = array_keys($tasks);
sort($keys);
$options = (count($keys) > 0)?array_combine($keys, $keys):array();
?>
<div class="" style="display:inline-block">
<div class="span-4">
	<?php echo CHtml::dropDownList('task', '', $options, array('size'=>14, 'style'=>'width:148px;', 'onchange'=>'selectAuthItem(this,"' . $this->createAbsoluteUrl('ajax/infoAuthItem') . '");')); ?>
</div>
<div class="span-13" id="task-info"><hr></div>
<div class="span-4">
<?php 
if($this->isAdmin()):
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','New Task'),array('onclick'=>'openDialogCreate(1);'));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Change Task'),array('onclick'=>'openDialogChange(1,"' . $this->createAbsoluteUrl('ajax/getAuthItem') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Delete Task'),array('onclick'=>'deleteAuthItem(1,"' . $this->createAbsoluteUrl('ajax/deleteAuthItem') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Attach Task'),array('onclick'=>'openDialogAttach(1,1,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Detach Task'),array('onclick'=>'openDialogDetach(1,1,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Attach Operation'),array('onclick'=>'openDialogAttach(1,0,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Detach Operation'),array('onclick'=>'openDialogDetach(1,0,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
endif;
?>
</div>
</div>