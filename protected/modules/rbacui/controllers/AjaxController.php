<?php
class AjaxController extends RbController {
	private $authItemTypeName = array('Operation', 'Task', 'Role');
	
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
				'actions'=>array('getAuthItem','getUsers','infoAuthItem','infoUserAssignments','itemList','itemTypeList','assignItem'),
				'users'=>array('@'),
				'expression'=>($this->isAssign() || $this->isAssignRole())?'true':'false',
			),
			array('allow',
				'actions'=>array('saveAuthItem','attachAuthItem','deleteAuthItem','assignItem','getAuthItem','getUsers','infoAuthItem','infoUserAssignments','itemList','itemTypeList'),
				'users'=>array('@'),
				'expression'=>($this->isAdmin())?'true':'false',
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}
	
	public function actionSaveAuthItem() {
		$json = array('error'=>'none');
		$model = new AuthItemForm;
		if(isset($_POST['AuthItemForm'])) {
			$model->attributes=$_POST['AuthItemForm'];
			if($model->validate()) {
				$auth = Yii::app()->authManager;
				if(empty($model->oldname)) {	// creation
					if($auth->getAuthItem($model->name) === null) {
						$auth->createAuthItem($model->name, $model->type, $model->description, $model->bizRule, $model->data);
					} else {
						$json['error'] = array('AuthItemForm_name'=>array(Yii::t('RbacuiModule.rbacui','An authorization item name must be unique')));
					}
				} else {						// update
					if($model->name != $model->oldname && $auth->getAuthItem($model->name) !== null) {
						$json['error'] = array('AuthItemForm_name'=>array(Yii::t('RbacuiModule.rbacui','An authorization item name must be unique')));
					} else {
						$authItem = $auth->getAuthItem($model->oldname);
						$authItem->name = $model->name;
						$authItem->description = $model->description;
						$authItem->bizRule = $model->bizRule;
						$authItem->data = $model->data;
						$auth->saveAuthItem($authItem, $model->oldname);
					}
				}
			} else {
				$json['error'] = json_decode(CActiveForm::validate($model));
			}
		}
		echo json_encode($json);
		Yii::app()->end();
	}
	
	public function actionAttachAuthItem() {
		$json = array('error'=>'none');
		$model = new AttachItemForm;
		if(isset($_POST['AttachItemForm'])) {
			$model->attributes=$_POST['AttachItemForm'];
			if($model->validate()) {
				$auth = Yii::app()->authManager;
				if($model->action == 'attach') {	// attach child to parent
					if($this->detectLoop($model->name, $model->attachname)) {
						$json['error'] = array('AttachItemForm_attachname'=>array(Yii::t('RbacuiModule.rbacui','A loop may not be created.')));
					} else {
						$auth->addItemChild($model->name, $model->attachname);
						$json['name'] = $model->name;
						$json['type'] = $auth->getAuthItem($model->name)->type;
					}
				} else {							// detach child from parent
					$auth->removeItemChild($model->name, $model->attachname);
					$json['name'] = $model->name;
					$json['type'] = $auth->getAuthItem($model->name)->type;
				}
			} else {
				$json['error'] = json_decode(CActiveForm::validate($model));
			}
		}
		echo json_encode($json);
		Yii::app()->end();
	}
	
	public function actionDeleteAuthItem() {
		if(isset($_POST['item'])) {
			$auth = Yii::app()->authManager;
			$auth->removeAuthItem($_POST['item']);
		}
		Yii::app()->end();
	}
	
	public function actionAssignItem() {
		$auth = Yii::app()->authManager;
		if(isset($_POST['AssignItemForm']['item'])) {
			if($_POST['AssignItemForm']['action'] == 'assign') {
				foreach($_POST['user'] as $user) {
					foreach($_POST['AssignItemForm']['item'] as $item) {
						if(!$auth->isAssigned($item, $user) && $this->allowAssign($item)) {
							$auth->assign($item, $user);
						}
					}
				}
			} else {
				foreach($_POST['user'] as $user) {
					foreach($_POST['AssignItemForm']['item'] as $item) {
						if($auth->isAssigned($item, $user) && $this->allowAssign($item)) {
							$auth->revoke($item, $user);
						}
					}
				}
			}
		}
		Yii::app()->end();
	}
	
	public function actionGetAuthItem() {
		$json = array();
		if(isset($_GET['item'])) {
			$auth = Yii::app()->authManager;
			$authItem = $auth->getAuthItem($_GET['item']);
			$json['name'] = $authItem->name;
			$json['description'] = $authItem->description;
			$json['bizRule'] = $authItem->bizRule;
			$json['data'] = $authItem->data;
			$json['type'] = $authItem->type;
		}
		echo json_encode($json);
		Yii::app()->end();
	}
	
	public function actionGetUsers() {
		$json = array();
		if(isset($_GET['term'])) {
			$criteria = new CDbCriteria;
			$criteria->compare($this->module->userNameColumn,$_GET['term'],true);
			$criteria->limit = 15;
			if($this->module->userActiveScope) {
				$criteria->scopes = $this->module->userActiveScope;
			}
			$class = new $this->module->userClass;
			$models = $class::model()->findAll($criteria);
			foreach($models as $model) {
				$json[] = array('value'=>$model->getAttribute($this->module->userIdColumn),'label'=>$model->getAttribute($this->module->userNameColumn));
			}
		}
		echo json_encode($json);
		Yii::app()->end();
	}
	
	private function getAssignedUsers($item) {
		$auth = Yii::app()->authManager;
		$criteria = new CDbCriteria;
		$criteria->order = $this->module->userNameColumn;
		if($this->module->userActiveScope) {
			$criteria->scopes = $this->module->userActiveScope;
		}
		$class = new $this->module->userClass;
		$models = $class::model()->findAll($criteria);
		$names = array();
		foreach($models as $model) {
			$userid = $model->getAttribute($this->module->userIdColumn);
			if($auth->isAssigned($item, $userid)) {
				$names[$userid] = $model->getAttribute($this->module->userNameColumn);
			}
		}
		return $names;
	}
	
	public function actionInfoAuthItem() {
		if(isset($_POST['item'])) {
			$auth = Yii::app()->authManager;
			$authItem = $auth->getAuthItem($_POST['item']);
			echo '<div class="authItemHeader">';
			echo '<span class="authItemLabel">' . $this->authItemTypeName[$authItem->type] . ': </span> ' . $authItem->name;
			echo '</div>' . PHP_EOL;
			echo '<div class="authItemLine">';
			echo '<span class="authItemLabel">'. Yii::t('RbacuiModule.rbacui','Description') .': </span> ' . $authItem->description;
			echo '</div>' . PHP_EOL;
			echo '<div class="authItemLine">';
			echo '<span class="authItemLabel">'. Yii::t('RbacuiModule.rbacui','Business rule') .': </span> ' . $authItem->bizRule;
			echo '</div>' . PHP_EOL;
			echo '<div class="authItemLine">';
			echo '<span class="authItemLabel">'. Yii::t('RbacuiModule.rbacui','Data') .': </span> ' . $authItem->data;
			echo '</div>' . PHP_EOL;
			echo '<hr>';
			echo '<div class="authItemHeader">';
			echo Yii::t('RbacuiModule.rbacui','Parents of {name}', array('{name}'=>$authItem->name));
			echo '</div>' . PHP_EOL;
			$parents = $this->findParents($authItem);
			if(count($parents) == 0) {
				echo '<div class="authItemLine">';
				echo '<em>'. Yii::t('RbacuiModule.rbacui','None') .'</em>';
				echo '</div>' . PHP_EOL;
			} else {
				foreach($parents as $name => $item) {
					echo '<div class="authItemLine">';
					echo $name . ' (' . $this->authItemTypeName[$item->type] . ')';
					echo '</div>' . PHP_EOL;
				}
			}
			echo '<hr>';
			echo '<div class="authItemHeader">';
			echo Yii::t('RbacuiModule.rbacui','Children of {name}', array('{name}'=>$authItem->name));
			echo '</div>' . PHP_EOL;
			$children = $authItem->children;
			if(count($children) == 0) {
				echo '<div class="authItemLine">';
				echo '<em>'. Yii::t('RbacuiModule.rbacui','None') .'</em>';
				echo '</div>' . PHP_EOL;
			} else {
				foreach($children as $name => $item) {
					echo '<div class="authItemLine">';
					echo $name . ' (' . $this->authItemTypeName[$item->type] . ')';
					echo '</div>' . PHP_EOL;
				}
			}
			echo '<hr>';
			echo '<div class="authItemHeader">';
			echo Yii::t('RbacuiModule.rbacui','Assigned to {name}', array('{name}'=>$authItem->name));
			echo '</div>' . PHP_EOL;
			echo '<div class="authItemLine">';
			$names = $this->getAssignedUsers($authItem->name);
			if(count($names)) {
				//echo implode(', ', $names);
				foreach($names as $id => $name) {
					echo '<span onclick="selectUserTab(' . $id . ')" style="cursor:pointer;">' . $name . '</span> ';
				}
			} else {
				echo '<em>'. Yii::t('RbacuiModule.rbacui','None') .'</em>';
			}
			echo '</div>' . PHP_EOL;
			echo '<hr>';
		} else {
			echo '<hr>';
		}
		Yii::app()->end();
	}
	
	public function actionInfoUserAssignments() {
		if(isset($_POST['user'])) {
			$auth = Yii::app()->authManager;
			$roles = $auth->getRoles($_POST['user']);
			echo '<div class="authItemHeader">';
			echo Yii::t('RbacuiModule.rbacui','Roles assigned to {name}', array('{name}'=>$_POST['name']));
			echo '</div>' . PHP_EOL;
			if(count($roles) == 0) {
				echo '<div class="authItemLine">';
				echo '<em>'. Yii::t('RbacuiModule.rbacui','None') .'</em>';
				echo '</div>' . PHP_EOL;
			} else {
				foreach($roles as $name => $item) {
					echo '<div class="authItemLine">';
					echo $name;
					echo '</div>' . PHP_EOL;
				}
			}
			echo '<hr>';
			$tasks = $auth->getTasks($_POST['user']);
			echo '<div class="authItemHeader">';
			echo Yii::t('RbacuiModule.rbacui','Tasks assigned to {name}', array('{name}'=>$_POST['name']));
			echo '</div>' . PHP_EOL;
			if(count($tasks) == 0) {
				echo '<div class="authItemLine">';
				echo '<em>'. Yii::t('RbacuiModule.rbacui','None') .'</em>';
				echo '</div>' . PHP_EOL;
			} else {
				foreach($tasks as $name => $item) {
					echo '<div class="authItemLine">';
					echo $name;
					echo '</div>' . PHP_EOL;
				}
			}
			echo '<hr>';
			$operations = $auth->getOperations($_POST['user']);
			echo '<div class="authItemHeader">';
			echo Yii::t('RbacuiModule.rbacui','Operations assigned to {name}', array('{name}'=>$_POST['name']));
			echo '</div>' . PHP_EOL;
			if(count($operations) == 0) {
				echo '<div class="authItemLine">';
				echo '<em>'. Yii::t('RbacuiModule.rbacui','None') .'</em>';
				echo '</div>' . PHP_EOL;
			} else {
				foreach($operations as $name => $item) {
					echo '<div class="authItemLine">';
					echo $name;
					echo '</div>' . PHP_EOL;
				}
			}
			echo '<hr>';
		}
		Yii::app()->end();
	}
	
	public function actionItemList() {
		$auth = Yii::app()->authManager;
		if(isset($_POST['item']) && isset($_POST['type']) && isset($_POST['action'])) {
			if($_POST['action'] == 'attach') {
				foreach($auth->getAuthItems($_POST['type']) as $name => $authItem) {
					if($name != $_POST['item'] && !$auth->hasItemChild($_POST['item'], $name)) {
						echo '<option name="' . $name . '">' . $name . '</option>' . PHP_EOL;
					}
				}
			} else {
				foreach($auth->getItemChildren($_POST['item']) as $name => $child) {
					if($child->type == $_POST['type']) {
						echo '<option name="' . $name . '">' . $name . '</option>' . PHP_EOL;
					}
				}
			}
		}
		Yii::app()->end();
	}
	
	public function actionItemTypeList() {
		$auth = Yii::app()->authManager;
		if(isset($_POST['type'])) {
			$items = $auth->getAuthItems($_POST['type']);
			if(isset($_POST['users'])) {
				$users = $_POST['users'];
			} else {
				$users = false;
			}
			foreach($items as $name => $item) {
				if($this->allowAssign($name) && $this->showRevokable($name, $users)) {
					echo '<option name="' . $name . '">' . $name . '</option>' . PHP_EOL;
				}
			}
		}
		Yii::app()->end();
	}
	
	private function findParents($child) {
		$auth = $child->authManager;
		$parent = array();
		$candidate = $auth->getAuthItems();
		foreach($candidate as $name => $item) {
			if($auth->hasItemChild($name, $child->getName())) {
				$parent[$name] = $item;
			}
		}
		return $parent;
	}
	
	private function detectLoop($itemName,$childName) {
		$auth = Yii::app()->authManager;
		if($childName===$itemName)
			return true;
		foreach($auth->getItemChildren($childName) as $child) {
			if($this->detectLoop($itemName,$child->getName()))
				return true;
		}
		return false;
	}
	
	private function allowAssign($item) {
		if($this->isAdmin()) {
			return true;
		} elseif($this->module->rbacUiAdmin == $item) {
			return false;	// do not assign or revoke the admin role when not an admin
		} elseif($this->isAssign()) {
			return true;
		} elseif($this->isAssignRole() && $this->isNotRole($item)) {
			return false;
		}
		return true;
	}
	
	private function isNotRole($item) {
		$auth = Yii::app()->authManager;
		$authItem = $auth->getAuthItem($item);
		return ($authItem->getType() != 2);
	}
	
	private function showRevokable($item, $users = false) {
		$auth = Yii::app()->authManager;
		if($users === false) {
			return true;
		}
		foreach($users as $user) {
			if($auth->isAssigned($item, $user)) {
				return true;
			}		
		}
		return false;
	}
}