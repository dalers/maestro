<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class RbController extends CController
{
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='//layouts/column1';
	
	public $breadcrumbs=array();

	/**
	 * Determine whether user has administrator authorization rights for rbacUI
	 * @return boolean
	 */
	public function isAdmin() {
		$userId = Yii::app()->user->id;
		if($userId === null) {
			return false;		// not authenticated
		}
		if($this->module->rbacUiAdmin === false) {
			return false;		// rbacUiAdmin not set
		}
		if($this->module->rbacUiAdmin === true) {
			return true;		// rbacUiAdmin all access
		}
		if(Yii::app()->authManager && Yii::app()->user->checkAccess($this->module->rbacUiAdmin)) {
			return true;
		}
		return false;
	}
	
	/**
	 * Determine whether user has assign authorization rights for rbacUI
	 * @return boolean
	 */
	public function isAssign() {
		$userId = Yii::app()->user->id;
		if($userId === null) {
			return false;		// not authenticated
		}
		if($this->isAdmin()) {
			return true;		// rbacUiAdmin
		}
		if($this->module->rbacUiAssign === false) {
			return false;		// rbacUiAssign not set
		}
		if($this->module->rbacUiAssign === true) {
			return true;		// rbacUiAdmin all access
		}
		if(Yii::app()->authManager && Yii::app()->user->checkAccess($this->module->rbacUiAssign)) {
			return true;
		}
		return false;
	}
	
	/**
	 * Determine whether user has assign role authorization rights for rbacUI
	 * @return boolean
	 */
	public function isAssignRole() {
		$userId = Yii::app()->user->id;
		if($userId === null) {
			return false;		// not authenticated
		}
		if($this->isAssign()) {
			return true;		// rbacUiAssign
		}
		if($this->module->rbacUiAssignRole === false) {
			return false;		// rbacUiAssignRole not set
		}
		if($this->module->rbacUiAssignRole === true) {
			return true;		// rbacUiAssignRole all access
		}
		if(Yii::app()->authManager && Yii::app()->user->checkAccess($this->module->rbacUiAssignRole)) {
			return true;
		}
		return false;
	} 
}