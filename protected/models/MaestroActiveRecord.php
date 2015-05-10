<?php

/**
 * Maestro master-data class file.
 *
 * @author Dale Scott <dale@dalescott.net>
 * @link http://www.dalescott.net
 * @copyright 2015 Dale R. Scott
 * @license https://github.com/dalers/maestro/blob/master/LICENSE
 */

/* 
 * The maestro master-data base class is used to set create/update user/time
 * audit fields
 */

abstract class MaestroActiveRecord extends CActiveRecord
{
	/**
	* Prepares create_user_id and update_user_id attributes before saving.
	*/

	protected function beforeSave()
	{

		if(null !== Yii::app()->user)
			$id=Yii::app()->user->id;
		else
			$id=1; //assumes default admin user exists and with id "1"

		if($this->isNewRecord)
			$this->create_user_id=$id;

		$this->update_user_id=$id;

		return parent::beforeSave();
	}
  
  /**
   * Attaches the timestamp behavior to update our create and update times
   */
	public function behaviors() 
	{
		return array(
			'CTimestampBehavior' => array(
				'class' => 'zii.behaviors.CTimestampBehavior',
				'createAttribute' => 'create_time',
				'updateAttribute' => 'update_time',
				'setUpdateOnCreate' => true,
			),
		);
	}

}