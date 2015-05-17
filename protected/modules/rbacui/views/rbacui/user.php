<?php
/* @var $this RbacuiController */
/* @array $users[] User */

?>
<div style="display:inline-block">
<div class="span-6">
	<table style="margin-bottom:0;"><tr><td>
		<?php echo CHtml::textField('search', '', array('style'=>'width:215px;')); ?>
	</td></tr><tr><td>
	<form id="user-select-form">
		<?php echo CHtml::dropDownList('user[]', '', CHtml::listData($users, $this->module->userIdColumn, $this->module->userNameColumn), 
			array('onchange'=>'selectUser("' . $this->createAbsoluteUrl('ajax/infoUserAssignments') . '");','multiple'=>true,'size'=>'20','style'=>'width:220px;')); ?>
	</form>
	</td></tr></table>
</div>
<div class="span-11" id="user-info"><hr></div>
<div class="span-4">
<?php 
echo CHtml::button(Yii::t('RbacuiModule.rbacui','Assign Role'),array('onclick'=>'openDialogAssign(2,"' . $this->createAbsoluteUrl('ajax/itemTypeList') . '");','disabled'=>true));
echo CHtml::button(Yii::t('RbacuiModule.rbacui','Revoke Role'),array('onclick'=>'openDialogRevoke(2,"' . $this->createAbsoluteUrl('ajax/itemTypeList') . '");','disabled'=>true));
if($this->isAdmin() || $this->isAssign()):
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Assign Task'),array('onclick'=>'openDialogAssign(1,"' . $this->createAbsoluteUrl('ajax/itemTypeList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Revoke Task'),array('onclick'=>'openDialogRevoke(1,"' . $this->createAbsoluteUrl('ajax/itemTypeList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Assign Operation'),array('onclick'=>'openDialogAssign(0,"' . $this->createAbsoluteUrl('ajax/itemTypeList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Revoke Operation'),array('onclick'=>'openDialogRevoke(0,"' . $this->createAbsoluteUrl('ajax/itemTypeList') . '");','disabled'=>true));
endif;
?>
</div>
</div>