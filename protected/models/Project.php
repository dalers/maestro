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
 * @property Issue[] $issues
 * @property Order[] $orders
 * @property User $createUser
 * @property Customer $customer
 * @property User $owner
 * @property User $updateUser
 * @property User[] $users
 */
class Project extends MaestroActiveRecord
{
    const PHASE_IDEA=0;
    const PHASE_DEFIN=1;
    const PHASE_DESIGN=2;
    const PHASE_TEST=3;
    const PHASE_PILOT=4;
    const PHASE_PROD=5;
    const PHASE_TERM=6;

    const STATUS_NOT_STARTED=0;
    const STATUS_STARTED=1;
    const STATUS_FINISHED=2;	

	const TYPE_INT=0;
    const TYPE_EXT=1;

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
			array('customer_id, owner_id', 'numerical', 'integerOnly'=>true),
			array('phase_id', 'in', 'range'=>self::getAllowedPhaseRange()),
			array('status_id', 'in', 'range'=>self::getAllowedStatusRange()),			
			array('type_id', 'in', 'range'=>self::getAllowedTypeRange()),
			array('name, code', 'length', 'max'=>255),
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

   /**
     * Retrieves a list of project phases
     * @return Array an array of available project phases.
     */
    public function getPhaseOptions()
    {
        return array(
            self::PHASE_IDEA=>'Idea',
            self::PHASE_DEFIN=>'Definition',
            self::PHASE_DESIGN=>'Design',
            self::PHASE_TEST=>'Test',
            self::PHASE_PILOT=>'Pilot',
            self::PHASE_PROD=>'Production',
            self::PHASE_TERM=>'Termination',
        );
    }

    public function getAllowedPhaseRange()
    {
        return array(
            self::PHASE_IDEA,
            self::PHASE_DEFIN,
            self::PHASE_DESIGN,
            self::PHASE_TEST,
            self::PHASE_PILOT,
            self::PHASE_PROD,
            self::PHASE_TERM,
        );
    }	

    /**
     * @return string the status text display for the current issue
     */ 
    public function getPhaseText()
    {
        // following is equivalent to $phaseOptions=$this->getPhaseOptions();
        $phaseOptions=$this->phaseOptions;
        return isset($phaseOptions[$this->phase_id]) ? $phaseOptions[$this->phase_id] : "unknown phase ({$this->phase_id})";
    }

    /**
     * Retrieves a list of project statuses
     * @return Array an array of available project statuses.
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
     * Retrieves a list of project types
     * @return Array an array of available project types.
     */
    public function getTypeOptions()
    {
        return array(
            self::TYPE_INT=>'Internal',
            self::TYPE_EXT=>'External',
        );
    }

    public function getAllowedTypeRange()
    {
        return array(
            self::TYPE_INT,
            self::TYPE_EXT,
        );
    }

    /**
     * @return string the type text display for the current issue
     */ 
    public function getTypeText()
    {
        $typeOptions=$this->typeOptions;
        return isset($typeOptions[$this->type_id]) ? $typeOptions[$this->type_id] : "unknown type ({$this->type_id})";
    }

	/**
     * @return array of users for this project, indexed by user IDs
     */ 
    public function getUserOptions()
    {
        $usersArray = CHtml::listData($this->users, 'id', 'username');	
        return $usersArray;
    } 
}