<?php

/**
 * This is the model class for table "tbl_person".
 *
 * The followings are the available columns in table 'tbl_person':
 * @property integer $id
 * @property string $username
 * @property integer $status
 * @property string $password
 * @property string $email
 * @property string $nick
 * @property string $lname
 * @property string $fname
 * @property string $initial
 * @property integer $profile
 * @property string $last_login_time
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property Issue[] $issues
 * @property Issue[] $issues1
 * @property Issue[] $issues2
 * @property Issue[] $issues3
 * @property Project[] $projects
 * @property Project[] $projects1
 * @property PvPn[] $pvPns
 * @property PvPn[] $pvPns1
 * @property PvPn[] $pvPns2
 */
class Person extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_person';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('username, password', 'required'),
			array('status, profile, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('username, password, email, nick, lname, fname, initial', 'length', 'max'=>255),
			array('last_login_time, create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, username, status, password, email, nick, lname, fname, initial, profile, last_login_time, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'issues' => array(self::HAS_MANY, 'Issue', 'update_user_id'),
			'issues1' => array(self::HAS_MANY, 'Issue', 'create_user_id'),
			'issues2' => array(self::HAS_MANY, 'Issue', 'owner_id'),
			'issues3' => array(self::HAS_MANY, 'Issue', 'requester_id'),
			'projects' => array(self::HAS_MANY, 'Project', 'update_user_id'),
			'projects1' => array(self::HAS_MANY, 'Project', 'create_user_id'),
			'pvPns' => array(self::HAS_MANY, 'PvPn', 'update_user_id'),
			'pvPns1' => array(self::HAS_MANY, 'PvPn', 'create_user_id'),
			'pvPns2' => array(self::HAS_MANY, 'PvPn', 'requester_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'username' => 'Username',
			'status' => 'Status',
			'password' => 'Password',
			'email' => 'Email',
			'nick' => 'Nick',
			'lname' => 'Lname',
			'fname' => 'Fname',
			'initial' => 'Initial',
			'profile' => 'Profile',
			'last_login_time' => 'Last Login Time',
			'create_time' => 'Create Time',
			'create_user_id' => 'Create User',
			'update_time' => 'Update Time',
			'update_user_id' => 'Update User',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('nick',$this->nick,true);
		$criteria->compare('lname',$this->lname,true);
		$criteria->compare('fname',$this->fname,true);
		$criteria->compare('initial',$this->initial,true);
		$criteria->compare('profile',$this->profile);
		$criteria->compare('last_login_time',$this->last_login_time,true);
		$criteria->compare('create_time',$this->create_time,true);
		$criteria->compare('create_user_id',$this->create_user_id);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('update_user_id',$this->update_user_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Person the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
