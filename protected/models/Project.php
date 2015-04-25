<?php

/**
 * This is the model class for table "tbl_project".
 *
 * The followings are the available columns in table 'tbl_project':
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property string $description
 * @property integer $customer_id
 * @property integer $owner_id
 * @property integer $phase_id
 * @property integer $status_id
 * @property integer $type_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property Activity[] $activities
 * @property Issue[] $issues
 * @property Order[] $orders
 * @property User $createUser
 * @property Customer $customer
 * @property User $owner
 * @property User $updateUser
 * @property User[] $users
 */
class Project extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_project';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, description', 'required'),
			array('customer_id, owner_id, phase_id, status_id, type_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('name, code', 'length', 'max'=>255),
			array('create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, code, description, customer_id, owner_id, phase_id, status_id, type_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'activities' => array(self::HAS_MANY, 'Activity', 'project_id'),
			'issues' => array(self::HAS_MANY, 'Issue', 'project_id'),
			'orders' => array(self::HAS_MANY, 'Order', 'project_id'),
			'createUser' => array(self::BELONGS_TO, 'User', 'create_user_id'),
			'customer' => array(self::BELONGS_TO, 'Customer', 'customer_id'),
			'owner' => array(self::BELONGS_TO, 'User', 'owner_id'),
			'updateUser' => array(self::BELONGS_TO, 'User', 'update_user_id'),
			'users' => array(self::MANY_MANY, 'User', 'tbl_project_user_assignment(project_id, user_id)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'code' => 'Code',
			'description' => 'Description',
			'customer_id' => 'Customer',
			'owner_id' => 'Owner',
			'phase_id' => 'Phase',
			'status_id' => 'Status',
			'type_id' => 'Type',
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
		$criteria->compare('name',$this->name,true);
		$criteria->compare('code',$this->code,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('customer_id',$this->customer_id);
		$criteria->compare('owner_id',$this->owner_id);
		$criteria->compare('phase_id',$this->phase_id);
		$criteria->compare('status_id',$this->status_id);
		$criteria->compare('type_id',$this->type_id);
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
	 * @return Project the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
