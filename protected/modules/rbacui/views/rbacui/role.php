<?php
/* @var array $roles[] CAuthItem */

$keys = array_keys($roles);
sort($keys);
$options = (count($keys) > 0)?array_combine($keys, $keys):array();
?>
<div class="" style="display:inline-block">
<div class="span-4">
	<?php echo CHtml::dropDownList('role', '', $options, array('size'=>14, 'style'=>'width:148px;', 'onchange'=>'selectAuthItem(this,"' . $this->createAbsoluteUrl('ajax/infoAuthItem') . '");')); ?>
</div>
<div class="span-13" id="role-info"><hr></div>
<div class="span-4">
<?php 
if($this->isAdmin()):
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','New Role'),array('id'=>'btnCreateRole', 'onclick'=>'openDialogCreate(2);'));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Change Role'),array('id'=>'btnChangeRole', 'onclick'=>'openDialogChange(2,"' . $this->createAbsoluteUrl('ajax/getAuthItem') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Delete Role'),array('onclick'=>'deleteAuthItem(2,"' . $this->createAbsoluteUrl('ajax/deleteAuthItem') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Attach Role'),array('onclick'=>'openDialogAttach(2,2,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Detach Role'),array('onclick'=>'openDialogDetach(2,2,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Attach Task'),array('onclick'=>'openDialogAttach(2,1,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Detach Task'),array('onclick'=>'openDialogDetach(2,1,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Attach Operation'),array('onclick'=>'openDialogAttach(2,0,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
	echo CHtml::button(Yii::t('RbacuiModule.rbacui','Detach Operation'),array('onclick'=>'openDialogDetach(2,0,"' . $this->createAbsoluteUrl('ajax/itemList') . '");','disabled'=>true));
endif;
?>
</div>
</div>