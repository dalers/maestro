<?php

/**
 * This is the model class for table "tbl_part_list".
 *
 * The followings are the available columns in table 'tbl_part_list':
 * @property integer $id
 * @property integer $PLListID
 * @property integer $PLPartID
 * @property integer $PLItem
 * @property string $PLQty
 * @property string $PLRefMemo
 * @property string $PLRefText
 * @property double $PLAssyOrder
 * @property string $PLAssySpec
 * @property integer $PLMFRPNID
 * @property integer $PLMFRID
 * @property integer $PLSUID
 * @property integer $PLLNKID
 *
 * The followings are the available model relations:
 * @property Part $pLPart
 * @property Manufacturer $pLMFR
 * @property ManufacturerPart $pLMFRPN
 * @property Part $pLList
 * @property PartSourceAssignment $pLLNK
 * @property Supplier $pLSU
 */
class PartList extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_part_list';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('PLListID, PLPartID, PLItem, PLMFRPNID, PLMFRID, PLSUID, PLLNKID', 'numerical', 'integerOnly'=>true),
			array('PLAssyOrder', 'numerical'),
			array('PLQty', 'length', 'max'=>10),
			array('PLRefText, PLAssySpec', 'length', 'max'=>255),
			array('PLRefMemo', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, PLListID, PLPartID, PLItem, PLQty, PLRefMemo, PLRefText, PLAssyOrder, PLAssySpec, PLMFRPNID, PLMFRID, PLSUID, PLLNKID', 'safe', 'on'=>'search'),
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
			'pLPart' => array(self::BELONGS_TO, 'Part', 'PLPartID'),
			'pLMFR' => array(self::BELONGS_TO, 'Manufacturer', 'PLMFRID'),
			'pLMFRPN' => array(self::BELONGS_TO, 'ManufacturerPart', 'PLMFRPNID'),
			'pLList' => array(self::BELONGS_TO, 'Part', 'PLListID'),
			'pLLNK' => array(self::BELONGS_TO, 'PartSourceAssignment', 'PLLNKID'),
			'pLSU' => array(self::BELONGS_TO, 'Supplier', 'PLSUID'),

			'detail' => array(self::BELONGS_TO, 'Part', 'PLPartID'),
			'partof' => array(self::BELONGS_TO, 'Part', 'PLListID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'PLListID' => 'List ID',
			'PLPartID' => 'Part',
			'PLItem' => 'Item',
			'PLQty' => 'Qty',
			'PLRefMemo' => 'Ref. Memo',
			'PLRefText' => 'Ref. Text',
			'PLAssyOrder' => 'Assy Order',
			'PLAssySpec' => 'Assy Spec',
			'PLMFRPNID' => 'MFR Part Number',
			'PLMFRID' => 'MFR ID',
			'PLLNKID' => 'Pllnkid',
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
		$criteria->compare('PLListID',$this->PLListID);
		$criteria->compare('PLPartID',$this->PLPartID);
		$criteria->compare('PLItem',$this->PLItem);
		$criteria->compare('PLQty',$this->PLQty,true);
		$criteria->compare('PLRefMemo',$this->PLRefMemo,true);
		$criteria->compare('PLRefText',$this->PLRefText,true);
		$criteria->compare('PLAssyOrder',$this->PLAssyOrder);
		$criteria->compare('PLAssySpec',$this->PLAssySpec,true);
		$criteria->compare('PLMFRPNID',$this->PLMFRPNID);
		$criteria->compare('PLMFRID',$this->PLMFRID);
		$criteria->compare('PLSUID',$this->PLSUID);
		$criteria->compare('PLLNKID',$this->PLLNKID);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PartList the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
