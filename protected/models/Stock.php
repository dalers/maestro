<?php

/**
 * This is the model class for table "tbl_stock_serial".
 *
 * This is the model class for table "tbl_stock".
 *
 * The followings are the available columns in table 'tbl_stock':
 * @property integer $id
 * @property string $serial_number
 * @property string $version
 * @property integer $part_id
 * @property integer $status_id
 *
 * The followings are the available model relations:
 * @property Issue[] $tblIssues
 * @property OrderItemStockAssignment[] $orderItemStockAssignments
 * @property Part $part
 * @property StockTransaction[] $stockTransactions
 */
class Stock extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_stock';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
            array('part_id, status_id', 'numerical', 'integerOnly'=>true),
            array('serial_number, version', 'length', 'max'=>255),
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            array('id, serial_number, version, part_id, status_id', 'safe', 'on'=>'search'),
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
            'tblIssues' => array(self::MANY_MANY, 'Issue', 'tbl_issue_stock_assignment(stock_id, issue_id)'),
            'orderItemStockAssignments' => array(self::HAS_MANY, 'OrderItemStockAssignment', 'stock_id'),
            'part' => array(self::BELONGS_TO, 'Part', 'part_id'),
            'stockTransactions' => array(self::HAS_MANY, 'StockTransaction', 'stock_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
            'id' => 'ID',
            'serial_number' => 'Serial Number',
            'version' => 'Version',
            'part_id' => 'Part',
            'status_id' => 'Status',
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
        $criteria->compare('serial_number',$this->serial_number,true);
        $criteria->compare('version',$this->version,true);
        $criteria->compare('part_id',$this->part_id);
        $criteria->compare('status_id',$this->status_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Stock the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
