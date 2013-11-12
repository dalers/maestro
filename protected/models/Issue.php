<?php

/**
 * This is the model class for table "tbl_issue".
 *
 * The followings are the available columns in table 'tbl_issue':
 * @property integer $id
 * @property string $number
 * @property string $name
 * @property string $description
 * @property string $project
 * @property string $type
 * @property string $corrective_action
 * @property string $cost
 * @property string $status
 * @property integer $project_id
 * @property integer $type_id
 * @property integer $part_id
 * @property integer $stock_serial_id
 * @property integer $status_id
 * @property integer $owner_id
 * @property integer $requester_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property Person $updateUser
 * @property Person $createUser
 * @property Person $owner
 * @property PvPn $part
 * @property Project $project0
 * @property Person $requester
 * @property StockSerial $stockSerial
 */
class Issue extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_issue';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name', 'required'),
			array('project_id, type_id, part_id, stock_serial_id, status_id, owner_id, requester_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('number, name, project, type, corrective_action, cost, status', 'length', 'max'=>255),
			array('description, create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, number, name, description, project, type, corrective_action, cost, status, project_id, type_id, part_id, stock_serial_id, status_id, owner_id, requester_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'updateUser' => array(self::BELONGS_TO, 'Person', 'update_user_id'),
			'createUser' => array(self::BELONGS_TO, 'Person', 'create_user_id'),
			'owner' => array(self::BELONGS_TO, 'Person', 'owner_id'),
			'part' => array(self::BELONGS_TO, 'PvPn', 'part_id'),
			'project0' => array(self::BELONGS_TO, 'Project', 'project_id'),
			'requester' => array(self::BELONGS_TO, 'Person', 'requester_id'),
			'stockSerial' => array(self::BELONGS_TO, 'StockSerial', 'stock_serial_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'number' => 'Number',
			'name' => 'Name',
			'description' => 'Description',
			'project' => 'Project',
			'type' => 'Type',
			'corrective_action' => 'Corrective Action',
			'cost' => 'Cost',
			'status' => 'Status',
			'project_id' => 'Project',
			'type_id' => 'Type',
			'part_id' => 'Part',
			'stock_serial_id' => 'Stock Serial',
			'status_id' => 'Status',
			'owner_id' => 'Owner',
			'requester_id' => 'Requester',
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
		$criteria->compare('number',$this->number,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('project',$this->project,true);
		$criteria->compare('type',$this->type,true);
		$criteria->compare('corrective_action',$this->corrective_action,true);
		$criteria->compare('cost',$this->cost,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('project_id',$this->project_id);
		$criteria->compare('type_id',$this->type_id);
		$criteria->compare('part_id',$this->part_id);
		$criteria->compare('stock_serial_id',$this->stock_serial_id);
		$criteria->compare('status_id',$this->status_id);
		$criteria->compare('owner_id',$this->owner_id);
		$criteria->compare('requester_id',$this->requester_id);
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
	 * @return Issue the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
