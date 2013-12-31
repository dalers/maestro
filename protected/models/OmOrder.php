<?php

/**
 * This is the model class for table "tbl_om_order".
 *
 * The followings are the available columns in table 'tbl_om_order':
 * @property integer $id
 * @property string $type
 * @property string $name
 * @property string $status
 * @property integer $iteration
 * @property integer $project_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property Person $createUser
 * @property Person $updateUser
 * @property OmOrderItem[] $omOrderItems
 */
class OmOrder extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_om_order';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iteration, project_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('name, type, status', 'length', 'max'=>255),
			array('create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, type, status, iteration, project_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'project' => array(self::BELONGS_TO, 'Project', 'project_id'),
			'createUser' => array(self::BELONGS_TO, 'Person', 'create_user_id'),
			'updateUser' => array(self::BELONGS_TO, 'Person', 'update_user_id'),
			'omOrderItems' => array(self::HAS_MANY, 'OmOrderItem', 'order_id'),
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
			'type' => 'Type',
			'status' => 'Status',
			'iteration' => 'Iteration',
			'project_id' => 'Project',
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
		$criteria->compare('type',$this->type,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('iteration',$this->iteration);
		$criteria->compare('project_id',$this->project_id);
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
	 * @return OmOrder the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	 /**
	 * Retrieves the list of parts that are childs of the specified part.
	 * @return CActiveDataProvider the data provider that can return the needed details.
	 */
	public function childs($id, $pagesize = -1)
	{
        $pagesize = ($pagesize == -1) ? Yii::app()->params['partListPageSize'] : 0;
		$criteria = new CDbCriteria;

		$criteria->compare('order_id', $id, false);

		return new CActiveDataProvider('OmOrderItem', array(
			'criteria' => $criteria,
            'pagination'=>array(
                'pageSize'=>$pagesize,
            ),
			'sort'=>array(
				'defaultOrder'=>'part_id ASC',
			),
		));
	}
	
	public function project($id)
	{
		$pagesize = ($pagesize == -1) ? Yii::app()->params['partListPageSize'] : 0;
		$criteria = new CDbCriteria;

		$criteria->compare('id', $id, false);

		return new CActiveDataProvider('Project', array(
			'criteria' => $criteria,
            'pagination'=>array(
                'pageSize'=>$pagesize,
            ),
			'sort'=>array(
				'defaultOrder'=>'project_id ASC',
			),
		));
	}
	
	public function beforeSave()
	{
		if(parent::beforeSave())
		{
			// TODO
			//$this->update_time=time(); //Format example: 2013-12-30 00:00:00
			//$this->update_user
			return true;
		}
		return false;
	}
}
