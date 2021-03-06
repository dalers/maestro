<?php

/**
 * This is the model class for table "tbl_unit".
 *
 * The followings are the available columns in table 'tbl_unit':
 * @property integer $id
 * @property string $UNUseUnits
 * @property string $UNPurchUnits
 * @property double $UNConvUnits
 *
 * The followings are the available model relations:
 * @property Part[] $parts
 * @property PartSourceAssignment[] $partSourceAssignments
 */
class Unit extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_unit';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('UNUseUnits, UNPurchUnits', 'required'),
			array('UNConvUnits', 'numerical'),
			array('UNUseUnits, UNPurchUnits', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, UNUseUnits, UNPurchUnits, UNConvUnits', 'safe', 'on'=>'search'),
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
			'parts' => array(self::HAS_MANY, 'Part', 'PNUNID'),
			'partSourceAssignments' => array(self::HAS_MANY, 'PartSourceAssignment', 'LNKUNID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'UNUseUnits' => 'Unuse Units',
			'UNPurchUnits' => 'Unpurch Units',
			'UNConvUnits' => 'Unconv Units',
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
		$criteria->compare('UNUseUnits',$this->UNUseUnits,true);
		$criteria->compare('UNPurchUnits',$this->UNPurchUnits,true);
		$criteria->compare('UNConvUnits',$this->UNConvUnits);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Unit the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
