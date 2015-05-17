<?php

/**
 * AssignItemForm class.
 * AssignItemForm is the data structure for roles.
 * It is used for assigning authorization items to users by CAuthManager.
 */
class AssignItemForm extends CFormModel
{
	public $item;
	public $type;
	public $action;

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			array('item, type, action', 'required'),
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
			'item'=>Yii::t('RbacuiModule.rbacui','Item'),
		);
	}
}