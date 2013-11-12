<?php

/**
 * This is the model class for table "tbl_project".
 *
 * The followings are the available columns in table 'tbl_project':
 * @property integer $id
 * @property string $acct1
 * @property string $acct2
 * @property string $acct3
 * @property string $acct4
 * @property string $name
 * @property string $client
 * @property string $description
 * @property string $type
 * @property string $status
 * @property string $milestone
 * @property string $milestone_date
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property Issue[] $issues
 * @property Person $updateUser
 * @property Person $createUser
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
			array('create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('acct1, acct2, acct3, acct4, name, client, type, status, milestone', 'length', 'max'=>255),
			array('description, milestone_date, create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, acct1, acct2, acct3, acct4, name, client, description, type, status, milestone, milestone_date, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'issues' => array(self::HAS_MANY, 'Issue', 'project_id'),
			'updateUser' => array(self::BELONGS_TO, 'Person', 'update_user_id'),
			'createUser' => array(self::BELONGS_TO, 'Person', 'create_user_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'acct1' => 'Acct1',
			'acct2' => 'Acct2',
			'acct3' => 'Acct3',
			'acct4' => 'Acct4',
			'name' => 'Name',
			'client' => 'Client',
			'description' => 'Description',
			'type' => 'Type',
			'status' => 'Status',
			'milestone' => 'Milestone',
			'milestone_date' => 'Milestone Date',
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
		$criteria->compare('acct1',$this->acct1,true);
		$criteria->compare('acct2',$this->acct2,true);
		$criteria->compare('acct3',$this->acct3,true);
		$criteria->compare('acct4',$this->acct4,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('client',$this->client,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('type',$this->type,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('milestone',$this->milestone,true);
		$criteria->compare('milestone_date',$this->milestone_date,true);
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
