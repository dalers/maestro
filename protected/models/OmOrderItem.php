<?php

/**
 * This is the model class for table "tbl_om_order_item".
 *
 * The followings are the available columns in table 'tbl_om_order_item':
 * @property integer $id
 * @property integer $order_id
 * @property integer $part_id
 * @property string $serial_no
 * @property string $action
 *
 * The followings are the available model relations:
 * @property PvPn $part
 * @property OmOrder $order
 */
class OmOrderItem extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_om_order_item';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('order_id, part_id', 'required'),
			array('order_id, part_id, desired_qty, shipped_qty', 'numerical', 'integerOnly'=>true),
			array('serial_no', 'safe'),
			array('action', 'length', 'max'=>3),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, order_id, part_id, serial_no, action', 'safe', 'on'=>'search'),
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
			'part' => array(self::BELONGS_TO, 'PvPn', 'part_id'),
			'order' => array(self::BELONGS_TO, 'OmOrder', 'order_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'order_id' => 'Order',
			'part_id' => 'Part',
			'desired_qty' => 'Desired Qty',
			'shipped_qty' => 'Shipped Qty',
			'serial_no' => 'Serial No',
			'action' => 'Action',
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
		$criteria->compare('order_id',$this->order_id);
		$criteria->compare('part_id',$this->part_id);
		$criteria->compare('desired_qty',$this->desired_qty);
		$criteria->compare('shipped_qty',$this->shipped_qty);
		$criteria->compare('serial_no',$this->serial_no,true);
		$criteria->compare('action',$this->action,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return OmOrderItem the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	public function validateSerialNumbers($array, $partNumber)
	{
		foreach($array as &$value)
		{
			$query="SELECT * FROM tbl_stock_serial WHERE serial_number=\':serial_number\' AND part_number=\'".$partNumber."\'";
			$list = Yii::app()->db->createCommand($query)->bindValue('serial_number',$value)->queryAll();
			if (count($list)==0)
			{
				unset($value);
				return false;
			}
		}
		unset($value);
		return true;
	}

	public function beforeSave()
	{
		if(parent::beforeSave())
		{
			// Parse the Serial Number field using comma as the delimer
			$array = explode(",", $this->serial_no);
			$elementCount = count($array);
			if ($elementCount > 0) {
				//$validateSNPart = validateSerialNumbers($array, $this->part->PNPartNumber);
				//if ($validateSNPart==false)
				//	return false;
			}

			if (!empty($this->part->PNUser1))
			{
				$this->shipped_qty=$elementCount;
			}

			return true;
		}
		return false;
	}
}
