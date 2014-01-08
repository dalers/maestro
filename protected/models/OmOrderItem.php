<?php

/**
 * This is the model class for table "tbl_om_order_item".
 *
 * The followings are the available columns in table 'tbl_om_order_item':
 * @property integer $id
 * @property integer $order_id
 * @property integer $part_id
 *
 * The followings are the available model relations:
 * @property PvPn $part
 * @property OmOrder $order
 */
class OmOrderItem extends CActiveRecord
{
	public $serial_numbers = "";
	public $tokens = array();
	public $valid = array();
	public $invalid = array();

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
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, order_id, part_id', 'safe', 'on'=>'search'),
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
			'part_id' => 'Part Number',
			'desired_qty' => 'Desired Qty',
			'shipped_qty' => 'Shipped Qty',
			'serial_numbers' => 'Serial Numbers',
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
	
	public function childs($id, $pagesize = -1)
	{
        $pagesize = ($pagesize == -1) ? Yii::app()->params['partListPageSize'] : 0;
		$criteria = new CDbCriteria;

		$criteria->compare('order_item_id', $id, false);

		return new CActiveDataProvider('OmOrderItemSn', array(
			'criteria' => $criteria,
            'pagination'=>array(
                'pageSize'=>$pagesize,
            ),
			'sort'=>array(
				'defaultOrder'=>'stock_serial_id ASC',
			),
		));
	}
	
	public function beforeSave()
	{
		if(parent::beforeSave())
		{
			if (isset($this->serial_numbers))
			{
				$tokens = explode(",", $this->serial_numbers);
				foreach ($tokens as $sn)
				{
					// Lookup SN
					$sn_id = $this->isValidSN($sn,$this->part_id);
					if ($sn_id!==0)
					{
						$valid[] = $sn;
					}
					else
					{
						$invalid[] = $sn;
					}
				}
			}
			return true;
		}
		return false;
	}

	public function afterSave()
	{
		parent::afterSave();

		foreach ($this->valid as $sn)
		{
			$this->createOrderItemSN($sn_id);
			// TODO Build success message for valid SNs.
		}
		foreach ($this->invalid as $sn)
		{
			// TODO Build error message for invlaid SNs.
		}
		
		$this->serial_numbers = "";
		$this->tokens = array();
		$this->valid = array();
		$this->invalid = array();

		return true;
	}

	private function isValidSN($sn, $partId)
	{
		$command= Yii::app()->db->createCommand(
			"SELECT ss.id AS id FROM maestro.tbl_stock_serial ss, maestro.tbl_pv_pn pn WHERE ss.part_number = pn.PNPartNumber AND ss.serial_number=:sn AND pn.id=:part_id ORDER BY id"
		);
		$command->bindValue(":sn", $sn, PDO::PARAM_STR);
		$command->bindValue(":part_id", $partId, PDO::PARAM_INT);
		$list = $command->queryAll();
	
		$ssid=0;

		// Unique result is not ensured.  Return the last result.
		foreach($list as $ss)
		{
			$ssid=$item['id'];
		}
	
		return $ssid;
	}
	
	private function createOrderItemSN($sn_id)
	{
		$sql = "INSERT INTO tbl_om_order_item_sn (order_item_id, stock_serial_id) values (:order_item_id, :stock_serial_id)";

		$parameters = array(":order_item_id"=>$this->id, ":stock_serial_id"=>$sn_id );

		Yii::app()->db->createCommand($sql)->execute($parameters);
	}
}
