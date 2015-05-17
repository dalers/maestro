<?php

/**
 * AttachItemForm class.
 * AttachItemForm is the data structure for authorization item form data.
 * It is used for attaching CAuthManager authorization items.
 */
class AttachItemForm extends CFormModel
{
	public $name;
	public $attachname;
	public $action;

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			array('name, attachname, action', 'required'),
		);
	}

	/**
	 * Declares customized attribute labels.
	 * If not declared here, an attribute would have a label that is
	 * the same as its name with the first letter in upper case.
	 */
	public function attributeLabels()
	{
		return array(
			'name'=>Yii::t('RbacuiModule.rbacui','Name'),
			'attachname'=>Yii::t('RbacuiModule.rbacui','Name'),
		);
	}
}