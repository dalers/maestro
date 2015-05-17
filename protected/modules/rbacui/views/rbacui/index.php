<?php
/* @var $this DefaultController */
/* @var $model AuthItemForm */
/* @var $attach AttachItemForm */
/* @var $assign AssignItemForm */

Yii::app()->clientScript->registerScript('messages', "
var ASSIGN = '". Yii::t('RbacuiModule.rbacui','Assign ') ."';
var ASSIGNTO = '". Yii::t('RbacuiModule.rbacui',' to ') ."';
var ASSIGNTOMULTI = '". Yii::t('RbacuiModule.rbacui',' to multiple users') ."';
var REVOKE = '". Yii::t('RbacuiModule.rbacui','Revoke ') ."';
var REVOKEFROM = '". Yii::t('RbacuiModule.rbacui',' from ') ."';
var REVOKEFROMMULTI = '". Yii::t('RbacuiModule.rbacui',' from multiple users') ."';
var ATTACH = '". Yii::t('RbacuiModule.rbacui','Attach a ') ."';
var DETACH = '". Yii::t('RbacuiModule.rbacui','Detach a ') ."';
var CREATE = '". Yii::t('RbacuiModule.rbacui','Create a new ') ."';
var CHANGE = '". Yii::t('RbacuiModule.rbacui','Change a ') ."';
var CONFIRM = '". Yii::t('RbacuiModule.rbacui','Are you sure you want to delete the ') ."';
var MULTIPLE = '". Yii::t('RbacuiModule.rbacui','Multiple users selected for assigning / revoking.') ."';
var FROMTHE = '". Yii::t('RbacuiModule.rbacui',' from the ') ."';
var TOTHE = '". Yii::t('RbacuiModule.rbacui',' to the ') ."';
var AuthItemTypeName = new Array('". Yii::t('RbacuiModule.rbacui','operation') ."','". Yii::t('RbacuiModule.rbacui','task') ."','". Yii::t('RbacuiModule.rbacui','role') ."');
", CClientScript::POS_HEAD);

$this->breadcrumbs=array(
	$this->module->id,
);
?>

<noscript>
<div class="flash-notice">
<?php echo Yii::t('RbacuiModule.rbacui','Your web browser does not support JavaScript, or you have temporarily disabled scripting. This site needs JavaScript to function correct.'); ?>
</div>
</noscript>

<?php
$this->beginWidget('zii.widgets.jui.CJuiTabs',array(
	'id'=>'tabs',
    'tabs'=>array(
        '<span>'.Yii::t('RbacuiModule.rbacui','Assignments').'</span>'=>array('ajax'=>$this->createAbsoluteUrl('rbacui/user'), 'id'=>'tab1'),
        '<span>'.Yii::t('RbacuiModule.rbacui','Roles').'</span>'=>array('ajax'=>$this->createAbsoluteUrl('rbacui/role'), 'id'=>'tab2'),
        '<span>'.Yii::t('RbacuiModule.rbacui','Tasks').'</span>'=>array('ajax'=>$this->createAbsoluteUrl('rbacui/task'), 'id'=>'tab3'),
        '<span>'.Yii::t('RbacuiModule.rbacui','Operations').'</span>'=>array('ajax'=>$this->createAbsoluteUrl('rbacui/operation'), 'id'=>'tab4'),
        '<span>'.Yii::t('RbacuiModule.rbacui','Hierarchy').'</span>'=>array('ajax'=>$this->createAbsoluteUrl('rbacui/hierarchy'), 'id'=>'tab5'),
    ),
    // additional javascript options for the tabs plugin
    'options'=>array(
        'collapsible'=>false,
		'cache'=>false,
		'spinner'=>'<em>Loading...</em>',
		'load'=>'js:function(event,ui){ tabLoaded(ui.panel,"' .$this->createAbsoluteUrl('ajax/getUsers'). '","' .$this->createAbsoluteUrl('ajax/infoUserAssignments'). '"); }',
    ),
));
$this->endWidget('zii.widgets.jui.CJuiTabs');
?>

<?php
$this->beginWidget('zii.widgets.jui.CJuiDialog',array(
    'id'=>'dlgCreateAuthItem',
    'options'=>array(
        'title'=>Yii::t('RbacuiModule.rbacui','Create an authorization item'),
        'autoOpen'=>false,
		'modal'=>true,
		'width'=>800,
		'show'=>'fade',
		'buttons'=>array(
			Yii::t('RbacuiModule.rbacui','Save')=>'js:function(){ saveAuthItem("' . $this->createAbsoluteUrl('ajax/saveAuthItem') . '"); }',
			Yii::t('RbacuiModule.rbacui','Cancel')=>'js:function(){ $(this).dialog("close"); }',
		),
    ),
));

    echo $this->renderPartial('_authForm', array('model'=>$model));

$this->endWidget('zii.widgets.jui.CJuiDialog');
?>

<?php 
$this->beginWidget('zii.widgets.jui.CJuiDialog',array(
    'id'=>'dlgAttachAuthItem',
    'options'=>array(
        'title'=>Yii::t('RbacuiModule.rbacui','Attach an authorization item'),
        'autoOpen'=>false,
		'modal'=>true,
		'width'=>400,
		'show'=>'fade',
		'buttons'=>array(
			Yii::t('RbacuiModule.rbacui','Save')=>'js:function(){ attachAuthItem("' . $this->createAbsoluteUrl('ajax/attachAuthItem') . '", "' . $this->createAbsoluteUrl('ajax/infoAuthItem') . '"); }',
			Yii::t('RbacuiModule.rbacui','Cancel')=>'js:function(){ $(this).dialog("close"); }',
		),
    ),
));

    echo $this->renderPartial('_attachForm', array('model'=>$attach));

$this->endWidget('zii.widgets.jui.CJuiDialog');

?>

<?php 
$this->beginWidget('zii.widgets.jui.CJuiDialog',array(
    'id'=>'dlgAssignItem',
    'options'=>array(
        'title'=>Yii::t('RbacuiModule.rbacui','Assign an item'),
        'autoOpen'=>false,
		'modal'=>true,
		'width'=>400,
		'show'=>'fade',
		'buttons'=>array(
			Yii::t('RbacuiModule.rbacui','Save')=>'js:function(){ assignItem("' . $this->createAbsoluteUrl('ajax/assignItem') . '","' . $this->createAbsoluteUrl('ajax/infoUserAssignments') . '"); }',
			Yii::t('RbacuiModule.rbacui','Cancel')=>'js:function(){ $(this).dialog("close"); }',
		),
    ),
));

    echo $this->renderPartial('_assignForm', array('model'=>$assign));

$this->endWidget('zii.widgets.jui.CJuiDialog');

?>
<div style="display:none" id="tempuser">