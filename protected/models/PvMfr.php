<?php

/**
 * This is the model class for table "tbl_pv_mfr".
 *
 * The followings are the available columns in table 'tbl_pv_mfr':
 * @property integer $id
 * @property string $MFRMfrName
 * @property string $MFRAddress
 * @property string $MFRCountry
 * @property string $MFRContact1
 * @property string $MFRContact2
 * @property string $MFRPhone1
 * @property string $MFRPhone2
 * @property string $MFRFax
 * @property string $MFRWeb
 * @property string $MFRNotes
 * @property string $MFRCode
 * @property string $MFREMail1
 * @property string $MFREMail2
 * @property integer $MFRNoPhonePrefix
 */
class PvMfr extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_mfr';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('MFRMfrName', 'required'),
			array('MFRNoPhonePrefix', 'numerical', 'integerOnly'=>true),
			array('MFRMfrName, MFRCountry, MFRContact1, MFRContact2, MFREMail1, MFREMail2', 'length', 'max'=>50),
			array('MFRAddress, MFRWeb', 'length', 'max'=>255),
			array('MFRPhone1, MFRPhone2, MFRFax, MFRCode', 'length', 'max'=>20),
			array('MFRNotes', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, MFRMfrName, MFRAddress, MFRCountry, MFRContact1, MFRContact2, MFRPhone1, MFRPhone2, MFRFax, MFRWeb, MFRNotes, MFRCode, MFREMail1, MFREMail2, MFRNoPhonePrefix', 'safe', 'on'=>'search'),
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
			'MFRMfrName' => 'Mfrmfr Name',
			'MFRAddress' => 'Mfraddress',
			'MFRCountry' => 'Mfrcountry',
			'MFRContact1' => 'Mfrcontact1',
			'MFRContact2' => 'Mfrcontact2',
			'MFRPhone1' => 'Mfrphone1',
			'MFRPhone2' => 'Mfrphone2',
			'MFRFax' => 'Mfrfax',
			'MFRWeb' => 'Mfrweb',
			'MFRNotes' => 'Mfrnotes',
			'MFRCode' => 'Mfrcode',
			'MFREMail1' => 'Mfremail1',
			'MFREMail2' => 'Mfremail2',
			'MFRNoPhonePrefix' => 'Mfrno Phone Prefix',
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
		$criteria->compare('MFRMfrName',$this->MFRMfrName,true);
		$criteria->compare('MFRAddress',$this->MFRAddress,true);
		$criteria->compare('MFRCountry',$this->MFRCountry,true);
		$criteria->compare('MFRContact1',$this->MFRContact1,true);
		$criteria->compare('MFRContact2',$this->MFRContact2,true);
		$criteria->compare('MFRPhone1',$this->MFRPhone1,true);
		$criteria->compare('MFRPhone2',$this->MFRPhone2,true);
		$criteria->compare('MFRFax',$this->MFRFax,true);
		$criteria->compare('MFRWeb',$this->MFRWeb,true);
		$criteria->compare('MFRNotes',$this->MFRNotes,true);
		$criteria->compare('MFRCode',$this->MFRCode,true);
		$criteria->compare('MFREMail1',$this->MFREMail1,true);
		$criteria->compare('MFREMail2',$this->MFREMail2,true);
		$criteria->compare('MFRNoPhonePrefix',$this->MFRNoPhonePrefix);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvMfr the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
