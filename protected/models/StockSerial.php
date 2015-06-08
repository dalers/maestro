<?php

/**
 * This is the model class for table "tbl_stock_serial".
 *
 * The followings are the available columns in table 'tbl_stock_serial':
 * @property integer $id
 * @property string $serial_number
 * @property string $part_number
 * @property string $description
 * @property string $version
 * @property string $status
 * @property integer $part_id
 *
 * The followings are the available model relations:
 * @property Issue[] $issues
 * @property Part $part
 */
class StockSerial extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_stock_serial';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('part_id', 'numerical', 'integerOnly'=>true),
			array('serial_number, part_number, description, version, status', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, serial_number, part_number, description, version, status, part_id', 'safe', 'on'=>'search'),
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
			'issues' => array(self::HAS_MANY, 'Issue', 'stock_serial_id'),
			'part' => array(self::BELONGS_TO, 'Part', 'part_id'),
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
			'part_number' => 'Part Number',
			'description' => 'Description',
			'version' => 'Version',
			'status' => 'Status',
			'part_id' => 'Part',
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
		$criteria->compare('part_number',$this->part_number,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('version',$this->version,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('part_id',$this->part_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return StockSerial the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
