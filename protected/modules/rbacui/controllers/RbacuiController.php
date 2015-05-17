<?php

class RbacuiController extends RbController {
	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl',
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',
				'actions'=>array('index','user','role','task','operation','hierarchy'),
				'users'=>array('@'),
				'expression'=>($this->isAssign() || $this->isAssignRole())?'true':'false',
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}
	
	public function actionIndex() {
		$model = new AuthItemForm;
		$attach = new AttachItemForm;
		$assign = new AssignItemForm;
		$this->render('index', array(
			'model'=>$model,
			'attach'=>$attach,
			'assign'=>$assign,
		));
	}
	
	public function actionUser() {
		$criteria = new CDbCriteria;
		if($this->module->userActiveScope) {
			$criteria->scopes = $this->module->userActiveScope;
		}
		$class = new $this->module->userClass;
		$users = $class::model()->findAll($criteria);
		$this->renderPartial('user', array(
			'users'=>$users,
		));
	}
	
	public function actionRole() {
		$roles = Yii::app()->authManager->getRoles();
		$this->renderPartial('role', array(
			'roles'=>$roles,
		));
	}
	
	public function actionTask() {
		$tasks = Yii::app()->authManager->getTasks();
		$this->renderPartial('task', array(
			'tasks'=>$tasks,
		));
	}
	
	public function actionOperation() {
		$operations = Yii::app()->authManager->getOperations();
		$this->renderPartial('operation', array(
			'operations'=>$operations,
		));
	}
	
	public function actionHierarchy() {
		$roles = array();
		$tasks = array();
		$operations = array();
		$auth = Yii::app()->authManager;
		foreach($auth->getAuthItems() as $name => $item) {
			if(!$this->hasParent($name)) {
				switch ($item->type) {
					case 0:
						$operations[$name] = $item;
						break;
					case 1:
						$tasks[$name] = $item;
						break;
					case 2:
						$roles[$name] = $item;
						break;
				}
			}
		}
		$this->renderPartial('hierarchy', array(
			'roles'=>$roles,
			'tasks'=>$tasks,
			'operations'=>$operations,
		));
	}
	
	/** 
	 * Checks whether an authorization item has a parent
	 * @param string $child
	 * @return boolean
	*/
	private function hasParent($child) {
		$auth = Yii::app()->authManager;
		foreach($auth->getAuthItems() as $name => $item) {
			if($auth->hasItemChild($name, $child)) {
				return true;
			}
		}
		return false;
	}
}