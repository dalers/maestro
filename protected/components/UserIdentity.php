<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	/**
	 * Authenticate user
	 * Username and password are authenticated against database
	 * @return boolean whether authentication succeeds.
	 */
	 
	private $_id;

	public function authenticate()
	{
		$user=User::model()->find('LOWER(username)=?',array(strtolower($this->username)));
		if($user===null)
			$this->errorCode=self::ERROR_USERNAME_INVALID;
		else if(!$user->validatePassword($this->password))
			$this->errorCode=self::ERROR_PASSWORD_INVALID;
		else
		{
			$this->_id=$user->id;
			$this->username=$user->username;
			$this->setState('lastLogin', date("Y-m-d g:i A", strtotime($user->last_login_time)));
			$user->saveAttributes(array(
				'last_login_time'=>date("Y-m-d H:i:s", time()),
			));
			$this->errorCode=self::ERROR_NONE;
		}
		return $this->errorCode==self::ERROR_NONE;
	}

	//override parent to return numeric id from database instead of username
	public function getId()
	{
		return $this->_id;
	}
	 
}