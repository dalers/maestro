<?php

/**
 * This is the model class for table "tbl_pv_su".
 *
 * The followings are the available columns in table 'tbl_pv_su':
 * @property integer $id
 * @property string $SUSupplier
 * @property string $SUAddress
 * @property string $SUCountry
 * @property string $SUPhone1
 * @property string $SUPhone2
 * @property string $SUFAX
 * @property string $SUWeb
 * @property string $SUContact1
 * @property string $SUContact2
 * @property string $SUDateLast
 * @property integer $SUFollowup
 * @property string $SUNotes
 * @property string $SUCode
 * @property string $SUAccount
 * @property string $SUTerms
 * @property string $SUFedTaxID
 * @property string $SUStateTaxID
 * @property string $SUEMail1
 * @property string $SUEMail2
 * @property integer $SUCurDedExRate
 * @property double $SUCurExRate
 * @property integer $SUCURID
 * @property integer $SUCurReverse
 * @property integer $SUNoPhonePrefix
 *
 * The followings are the available model relations:
 * @property PvLnk[] $pvLnks
 * @property PvPl[] $pvPls
 * @property PvCur $sUCUR
 */
class PvSu extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_su';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('SUSupplier', 'required'),
			array('SUFollowup, SUCurDedExRate, SUCURID, SUCurReverse, SUNoPhonePrefix', 'numerical', 'integerOnly'=>true),
			array('SUCurExRate', 'numerical'),
			array('SUSupplier, SUCountry, SUContact1, SUContact2, SUEMail1, SUEMail2', 'length', 'max'=>50),
			array('SUAddress, SUWeb', 'length', 'max'=>255),
			array('SUPhone1, SUPhone2, SUFAX, SUCode, SUAccount, SUTerms, SUFedTaxID, SUStateTaxID', 'length', 'max'=>20),
			array('SUDateLast, SUNotes', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, SUSupplier, SUAddress, SUCountry, SUPhone1, SUPhone2, SUFAX, SUWeb, SUContact1, SUContact2, SUDateLast, SUFollowup, SUNotes, SUCode, SUAccount, SUTerms, SUFedTaxID, SUStateTaxID, SUEMail1, SUEMail2, SUCurDedExRate, SUCurExRate, SUCURID, SUCurReverse, SUNoPhonePrefix', 'safe', 'on'=>'search'),
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
			'pvLnks' => array(self::HAS_MANY, 'PvLnk', 'LNKSUID'),
			'pvPls' => array(self::HAS_MANY, 'PvPl', 'PLSUID'),
			'sUCUR' => array(self::BELONGS_TO, 'PvCur', 'SUCURID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'SUSupplier' => 'Susupplier',
			'SUAddress' => 'Suaddress',
			'SUCountry' => 'Sucountry',
			'SUPhone1' => 'Suphone1',
			'SUPhone2' => 'Suphone2',
			'SUFAX' => 'Sufax',
			'SUWeb' => 'Suweb',
			'SUContact1' => 'Sucontact1',
			'SUContact2' => 'Sucontact2',
			'SUDateLast' => 'Sudate Last',
			'SUFollowup' => 'Sufollowup',
			'SUNotes' => 'Sunotes',
			'SUCode' => 'Sucode',
			'SUAccount' => 'Suaccount',
			'SUTerms' => 'Suterms',
			'SUFedTaxID' => 'Sufed Tax',
			'SUStateTaxID' => 'Sustate Tax',
			'SUEMail1' => 'Suemail1',
			'SUEMail2' => 'Suemail2',
			'SUCurDedExRate' => 'Sucur Ded Ex Rate',
			'SUCurExRate' => 'Sucur Ex Rate',
			'SUCURID' => 'Sucurid',
			'SUCurReverse' => 'Sucur Reverse',
			'SUNoPhonePrefix' => 'Suno Phone Prefix',
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
		$criteria->compare('SUSupplier',$this->SUSupplier,true);
		$criteria->compare('SUAddress',$this->SUAddress,true);
		$criteria->compare('SUCountry',$this->SUCountry,true);
		$criteria->compare('SUPhone1',$this->SUPhone1,true);
		$criteria->compare('SUPhone2',$this->SUPhone2,true);
		$criteria->compare('SUFAX',$this->SUFAX,true);
		$criteria->compare('SUWeb',$this->SUWeb,true);
		$criteria->compare('SUContact1',$this->SUContact1,true);
		$criteria->compare('SUContact2',$this->SUContact2,true);
		$criteria->compare('SUDateLast',$this->SUDateLast,true);
		$criteria->compare('SUFollowup',$this->SUFollowup);
		$criteria->compare('SUNotes',$this->SUNotes,true);
		$criteria->compare('SUCode',$this->SUCode,true);
		$criteria->compare('SUAccount',$this->SUAccount,true);
		$criteria->compare('SUTerms',$this->SUTerms,true);
		$criteria->compare('SUFedTaxID',$this->SUFedTaxID,true);
		$criteria->compare('SUStateTaxID',$this->SUStateTaxID,true);
		$criteria->compare('SUEMail1',$this->SUEMail1,true);
		$criteria->compare('SUEMail2',$this->SUEMail2,true);
		$criteria->compare('SUCurDedExRate',$this->SUCurDedExRate);
		$criteria->compare('SUCurExRate',$this->SUCurExRate);
		$criteria->compare('SUCURID',$this->SUCURID);
		$criteria->compare('SUCurReverse',$this->SUCurReverse);
		$criteria->compare('SUNoPhonePrefix',$this->SUNoPhonePrefix);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvSu the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
