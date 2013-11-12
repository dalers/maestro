<?php

/**
 * This is the model class for table "tbl_pv_cur".
 *
 * The followings are the available columns in table 'tbl_pv_cur':
 * @property integer $id
 * @property string $CURCurrencyName
 * @property double $CURExchangeRate
 * @property string $CURCurrencyChar
 * @property string $CURFormat
 * @property string $CURFormatExt
 */
class PvCur extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_cur';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('CURExchangeRate', 'numerical'),
			array('CURCurrencyName', 'length', 'max'=>50),
			array('CURCurrencyChar', 'length', 'max'=>4),
			array('CURFormat, CURFormatExt', 'length', 'max'=>35),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, CURCurrencyName, CURExchangeRate, CURCurrencyChar, CURFormat, CURFormatExt', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'CURCurrencyName' => 'Curcurrency Name',
			'CURExchangeRate' => 'Curexchange Rate',
			'CURCurrencyChar' => 'Curcurrency Char',
			'CURFormat' => 'Curformat',
			'CURFormatExt' => 'Curformat Ext',
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
		$criteria->compare('CURCurrencyName',$this->CURCurrencyName,true);
		$criteria->compare('CURExchangeRate',$this->CURExchangeRate);
		$criteria->compare('CURCurrencyChar',$this->CURCurrencyChar,true);
		$criteria->compare('CURFormat',$this->CURFormat,true);
		$criteria->compare('CURFormatExt',$this->CURFormatExt,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvCur the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
