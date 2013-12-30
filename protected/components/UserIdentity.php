<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	/**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
	 private $_id;
	 private $_username;
	 public function getName()
	 {
		return $this->_username;
	 }
	 public function getId()
	 {
		return $this->_id;
	 }
	public function authenticate()
	{
		$user=Person::model()->find('lower(username)=?', array(strtolower($this->username)));
		if ($user === null)
		{
			$this->errorCode= self::ERROR_UNKNOWN_IDENTITY;
		}
		elseif($user->password !== $this->password) //Plain-text password
		{
			$this->errorCode= self::ERROR_PASSWORD_INVALID;
		}
		else
		{
			$this->_id = $user->id;
			$this->_username = $user->username;
			$this->errorCode=self::ERROR_NONE;
		}
		return !$this->errorCode;
	}
}