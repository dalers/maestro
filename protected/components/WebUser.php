<?php

class WebUser extends CWebUser {

	private $_model;
	
	function getFirstName()
	{
		$user = $this->loadUser(Yii::app()->user->id);
		if ($user!==null)
		{
			return $user->getAttribute('fname');
		}
		else
		{
			return "Guest";
		}		
	}
	
	function getFullName()
	{
		$user = $this->loadUser(Yii::app()->user->id);
		if ($user!==null)
		{
			return $user->getAttribute('fname') . " " . $user->getAttribute('lname');
		}
		else
		{
			return "Guest";
		}
	}
	
	function getProfile()
	{
		$user = $this->loadUser(Yii::app()->user->id);
		if ($user!==null)
		{
			return intval($user->profile);
		}
		else
		{
			return intval(-1);
		}
	}
	
	// This a function that checks the field 'profile'
	// in the Person model to be equal to ROLE_ADMIN, that means it's admin
	// access it by Yii::app()->user->isAdmin()
	function isAdmin()
	{
		$user = $this->loadUser(Yii::app()->user->id);
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