<?php

/**
 * This is the model class for table "tbl_om_order_item_sn".
 *
 * The followings are the available columns in table 'tbl_om_order_item_sn':
 * @property integer $id
 * @property integer $order_item_id
 * @property integer $stock_serial_id
 *
 * The followings are the available model relations:
 * @property TblOmOrderItem $orderItem
 * @property TblStockSerial $stockSerial
 */
class OmOrderItemSn extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_om_order_item_sn';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('order_item_id, stock_serial_id', 'required'),
			array('order_item_id, stock_serial_id', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, order_item_id, stock_serial_id', 'safe', 'on'=>'search'),
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
			'orderItem' => array(self::BELONGS_TO, 'OmOrderItem', 'order_item_id'),
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
			'order_item_id' => 'Order Item',
			'stock_serial_id' => 'Stock Serial',
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
		$criteria->compare('order_item_id',$this->order_item_id);
		$criteria->compare('stock_serial_id',$this->stock_serial_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return OmOrderItemSn the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function afterSave()
	{
		parent::afterSave();
		
		// Update associated Order Item Shipped Qty if associated Part is serialized
		if (!empty($this->orderItem->part->PNUser1))
		{
			$criteria=new CDbCriteria;
			$criteria->compare('order_item_id',$this->order_item_id);
			$models = $this->findAll($criteria);

			$sns = count($models);
			
			$this->orderItem->shipped_qty = $sns;
			$this->orderItem->save();
		}

		return true;
	}
	
	public function afterDelete()
	{
		parent::afterDelete();

		// Update associated Order Item Shipped Qty if associated Part is serialized
		if (!empty($this->orderItem->part->PNUser1))
		{
			$criteria=new CDbCriteria;
			$criteria->compare('order_item_id',$this->order_item_id);
			$models = $this->findAll($criteria);

			$sns = count($models);
			
			$this->orderItem->shipped_qty = $sns;
			$this->orderItem->save();
		}

		return true;
	}
}
