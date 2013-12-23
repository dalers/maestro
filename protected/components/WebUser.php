<?php

class WebUser extends CWebUser {

	private $_model;
	
	function getFirstName()
	{
		$user = $this->loadUser(Yii::app()->person->id);
		return $user->fname;
	}
	
	function getFullName()
	{
		$user = $this->loadUser(Yii::app()->person->id);
		return $user->fullName();
	}
	
	function getProfile()
	{
		$user = $this->loadUser(Yii::app()->person->id);
		return $user->profile;
	}
	
	function isAdmin()
	{
		$user = $this->loadUser(Yii::app()->person->id);
		if ($user!==null)
		{
			return intval($user->profile) == Person::ROLE_ADMIN;
		}
		else
		{
			return false; 
		}
	}
	
	protected function loadUser($id=null)
	{
		if ($this->_model===null)
		{
			if ($id!==null)
			{
				$this->_model=Person::model()->findByPK($id);
			}
		}
		
		return $this->_model;
	}
}
?>