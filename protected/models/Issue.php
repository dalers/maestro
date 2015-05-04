<?php

/**
 * This is the model class for table "tbl_issue".
 *
 * The followings are the available columns in table 'tbl_issue':
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property string $begin_date
 * @property string $end_date
 * @property integer $duration
 * @property double $completion
 * @property string $outline_number
 * @property double $cost
 * @property string $web_link
 * @property integer $owner_id
 * @property integer $project_id
 * @property integer $requester_id
 * @property integer $status_id
 * @property integer $type_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property User $createUser
 * @property User $owner
 * @property Project $project
 * @property User $requester
 * @property User $updateUser
 * @property IssueList[] $issueLists
 * @property IssueList[] $issueLists1
 * @property Part[] $parts
 * @property IssuePredecessorAssignment[] $issuePredecessorAssignments
 * @property IssuePredecessorAssignment[] $issuePredecessorAssignments1
 * @property Stock[] $stocks
 * @property User[] $users
 */
class Issue extends CActiveRecord
{
	const TYPE_BUG=0;
	const TYPE_FEATURE=1;
	const TYPE_TASK=2;

	const STATUS_NOT_STARTED=0;
	const STATUS_STARTED=1;
	const STATUS_FINISHED=2;

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
			array('duration, owner_id, project_id, requester_id, status_id, type_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('type_id', 'in', 'range'=>self::getAllowedTypeRange()),
			array('status_id', 'in', 'range'=>self::getAllowedStatusRange()),			
			array('completion, cost', 'numerical'),
			array('name, outline_number, web_link', 'length', 'max'=>255),
			array('description, begin_date, end_date, create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, description, begin_date, end_date, duration, completion, outline_number, cost, web_link, owner_id, project_id, requester_id, status_id, type_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'createUser' => array(self::BELONGS_TO, 'User', 'create_user_id'),
			'owner' => array(self::BELONGS_TO, 'User', 'owner_id'),
			'project' => array(self::BELONGS_TO, 'Project', 'project_id'),
			'requester' => array(self::BELONGS_TO, 'User', 'requester_id'),
			'updateUser' => array(self::BELONGS_TO, 'User', 'update_user_id'),
			'issueLists' => array(self::HAS_MANY, 'IssueList', 'related_id'),
			'issueLists1' => array(self::HAS_MANY, 'IssueList', 'issue_id'),
			'parts' => array(self::MANY_MANY, 'Part', 'tbl_issue_part_assignment(issue_id, part_id)'),
			'issuePredecessorAssignments' => array(self::HAS_MANY, 'IssuePredecessorAssignment', 'issue_id'),
			'issuePredecessorAssignments1' => array(self::HAS_MANY, 'IssuePredecessorAssignment', 'predecessor_id'),
			'stocks' => array(self::MANY_MANY, 'Stock', 'tbl_issue_stock_assignment(issue_id, stock_id)'),
			'users' => array(self::MANY_MANY, 'User', 'tbl_issue_user_assignment(issue_id, user_id)'),
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
			'description' => 'Description',
			'begin_date' => 'Begin Date',
			'end_date' => 'End Date',
			'duration' => 'Duration',
			'completion' => 'Completion',
			'outline_number' => 'Outline Number',
			'cost' => 'Cost',
			'web_link' => 'Web Link',
			'owner_id' => 'Owner',
			'project_id' => 'Project',
			'requester_id' => 'Requester',
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
		$criteria->compare('description',$this->description,true);
		$criteria->compare('begin_date',$this->begin_date,true);
		$criteria->compare('end_date',$this->end_date,true);
		$criteria->compare('duration',$this->duration);
		$criteria->compare('completion',$this->completion);
		$criteria->compare('outline_number',$this->outline_number,true);
		$criteria->compare('cost',$this->cost);
		$criteria->compare('web_link',$this->web_link,true);
		$criteria->compare('owner_id',$this->owner_id);
		$criteria->compare('project_id',$this->project_id);
		$criteria->compare('requester_id',$this->requester_id);
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
	 * @return Issue the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	/**
	 * Retrieves a list of issue types
	 * @return Array an array of available issue types.
	 */
	public function getTypeOptions()
	{
		return array(
			self::TYPE_BUG=>'Bug',
			self::TYPE_FEATURE=>'Feature',
			self::TYPE_TASK=>'Task',
		);
	}

	public static function getAllowedTypeRange()
	{
		return array(
			self::TYPE_BUG,
			self::TYPE_FEATURE,
			self::TYPE_TASK,
		);
	}
	
	/**
	 * Retrieves a list of issue statuses
	 * @return Array an array of available issue statuses.
	 */
	public function getStatusOptions()
	{
		return array(
			self::STATUS_NOT_STARTED=>'Not Yet Started',
			self::STATUS_STARTED=>'Started',
			self::STATUS_FINISHED=>'Finished',
		);
	}
	
	public function getAllowedStatusRange()
	{
		return array(
			self::STATUS_NOT_STARTED,
			self::STATUS_STARTED,
			self::STATUS_FINISHED,
		);
	}	

	/**
	 * @return string the status text display for the current issue
	 */ 
	public function getStatusText()
	{
		// following is equivalent to $statusOptions=$this->getStatusOptions();
		$statusOptions=$this->statusOptions;
		return isset($statusOptions[$this->status_id]) ? $statusOptions[$this->status_id] : "unknown status ({$this->status_id})";
	}

	/**
	 * @return string the type text display for the current issue
	 */ 
	public function getTypeText()
	{
		$typeOptions=$this->typeOptions;
		return isset($typeOptions[$this->type_id]) ? $typeOptions[$this->type_id] : "unknown type ({$this->type_id})";
	}
	
}
