<?php

/**
 * This is the model class for table "tbl_om_order".
 *
 * The followings are the available columns in table 'tbl_om_order':
 * @property integer $id
 * @property integer $client_id
 * @property string $reman_no
 * @property string $job_no
 * @property integer $size_id
 * @property string $shipment_dt
 * @property integer $person_id
 * @property integer $tool_type_id
 * @property integer $product_id
 * @property integer $location_id
 * @property integer $status_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property lient $client
 * @property Person $createUser
 * @property Location $location
 * @property Person $person
 * @property Product $product
 * @property Size $size
 * @property Status $status
 * @property ToolType $toolType
 * @property Person $updateUser
 */
class Order extends CActiveRecord
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
			array('client_id, job_no, size_id, person_id, tool_type_id, product_id, location_id', 'required'),
			array('client_id, size_id, person_id, tool_type_id, product_id, location_id, status_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('reman_no, job_no', 'length', 'max'=>255),
			array('shipment_dt, create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, client_id, reman_no, job_no, size_id, shipment_dt, person_id, tool_type_id, product_id, location_id, status_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'client' => array(self::BELONGS_TO, 'Client', 'client_id'),
			'createUser' => array(self::BELONGS_TO, 'Person', 'create_user_id'),
			'location' => array(self::BELONGS_TO, 'Location', 'location_id'),
			'person' => array(self::BELONGS_TO, 'Person', 'person_id'),
			'product' => array(self::BELONGS_TO, 'Product', 'product_id'),
			'size' => array(self::BELONGS_TO, 'Size', 'size_id'),
			'status' => array(self::BELONGS_TO, 'Status', 'status_id'),
			'toolType' => array(self::BELONGS_TO, 'ToolType', 'tool_type_id'),
			'updateUser' => array(self::BELONGS_TO, 'Person', 'update_user_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'client_id' => 'Client',
			'reman_no' => 'Reman No',
			'job_no' => 'Job No',
			'size_id' => 'Size',
			'shipment_dt' => 'Shipment Date',
			'person_id' => 'Assigned To',
			'tool_type_id' => 'Tool Type',
			'product_id' => 'Product',
			'location_id' => 'Locale',
			'status_id' => 'Status',
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
		$criteria->compare('client_id',$this->client_id);
		$criteria->compare('reman_no',$this->reman_no,true);
		$criteria->compare('job_no',$this->job_no,true);
		$criteria->compare('size_id',$this->size_id);
		$criteria->compare('shipment_dt',$this->shipment_dt,true);
		$criteria->compare('person_id',$this->person_id);
		$criteria->compare('tool_type_id',$this->tool_type_id);
		$criteria->compare('product_id',$this->product_id);
		$criteria->compare('location_id',$this->location_id);
		$criteria->compare('status_id',$this->status_id);
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
	 * @return Order the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	/**
	 * Actions to take prior to saving the model.
	 * @return boolean parent::beforeSave()
	 */
	public function beforeSave()
	{
		if ($this->shipment_dt == '') {
				$this->setAttribute('shipment_dt', null);
		} else {
		   $this->shipment_dt=date('Y-m-d', strtotime($this->shipment_dt));
		}

		return parent::beforeSave();
	} //End beforeSave()

	/**
	 * Actions to take after to saving the model.
	 * @return boolean parent::afterFind()
	 */
	public function afterFind()
	{
		$retVal = parent::afterSave();
		$this->shipment_dt=date('Y-m-d', strtotime($this->shipment_dt)); 

		return $retVal;
	} //End beforeFind()
}
