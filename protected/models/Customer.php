<?php

/**
 * This is the model class for table "tbl_customer".
 *
 * The followings are the available columns in table 'tbl_customer':
 * @property integer $id
 * @property string $CUCustomer
 * @property string $CUAddress
 * @property string $CUShipAddress
 * @property string $CUPhone1
 * @property string $CUPhone2
 * @property string $CUContact1
 * @property string $CUContact2
 * @property string $CUFax
 * @property string $CUEmail1
 * @property string $CUEmail2
 * @property string $CUNotes
 * @property string $CUWeb
 * @property string $CUCode
 * @property string $CUAccount
 * @property string $CUTerms
 * @property string $CUFedTaxID
 * @property string $CUStateTaxID
 * @property integer $CUNoPhonePrefix
 *
 * The followings are the available model relations:
 * @property Project[] $projects
 */
class Customer extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_customer';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('CUNoPhonePrefix', 'numerical', 'integerOnly'=>true),
			array('CUCustomer, CUAddress, CUShipAddress', 'length', 'max'=>255),
			array('CUPhone1, CUPhone2, CUFax, CUCode, CUAccount, CUTerms, CUFedTaxID, CUStateTaxID', 'length', 'max'=>20),
			array('CUContact1, CUContact2, CUEmail1, CUEmail2', 'length', 'max'=>50),
			array('CUWeb', 'length', 'max'=>100),
			array('CUNotes', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, CUCustomer, CUAddress, CUShipAddress, CUPhone1, CUPhone2, CUContact1, CUContact2, CUFax, CUEmail1, CUEmail2, CUNotes, CUWeb, CUCode, CUAccount, CUTerms, CUFedTaxID, CUStateTaxID, CUNoPhonePrefix', 'safe', 'on'=>'search'),
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
			'projects' => array(self::HAS_MANY, 'Project', 'customer_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'CUCustomer' => 'Cucustomer',
			'CUAddress' => 'Cuaddress',
			'CUShipAddress' => 'Cuship Address',
			'CUPhone1' => 'Cuphone1',
			'CUPhone2' => 'Cuphone2',
			'CUContact1' => 'Cucontact1',
			'CUContact2' => 'Cucontact2',
			'CUFax' => 'Cufax',
			'CUEmail1' => 'Cuemail1',
			'CUEmail2' => 'Cuemail2',
			'CUNotes' => 'Cunotes',
			'CUWeb' => 'Cuweb',
			'CUCode' => 'Cucode',
			'CUAccount' => 'Cuaccount',
			'CUTerms' => 'Cuterms',
			'CUFedTaxID' => 'Cufed Tax',
			'CUStateTaxID' => 'Custate Tax',
			'CUNoPhonePrefix' => 'Cuno Phone Prefix',
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
		$criteria->compare('CUCustomer',$this->CUCustomer,true);
		$criteria->compare('CUAddress',$this->CUAddress,true);
		$criteria->compare('CUShipAddress',$this->CUShipAddress,true);
		$criteria->compare('CUPhone1',$this->CUPhone1,true);
		$criteria->compare('CUPhone2',$this->CUPhone2,true);
		$criteria->compare('CUContact1',$this->CUContact1,true);
		$criteria->compare('CUContact2',$this->CUContact2,true);
		$criteria->compare('CUFax',$this->CUFax,true);
		$criteria->compare('CUEmail1',$this->CUEmail1,true);
		$criteria->compare('CUEmail2',$this->CUEmail2,true);
		$criteria->compare('CUNotes',$this->CUNotes,true);
		$criteria->compare('CUWeb',$this->CUWeb,true);
		$criteria->compare('CUCode',$this->CUCode,true);
		$criteria->compare('CUAccount',$this->CUAccount,true);
		$criteria->compare('CUTerms',$this->CUTerms,true);
		$criteria->compare('CUFedTaxID',$this->CUFedTaxID,true);
		$criteria->compare('CUStateTaxID',$this->CUStateTaxID,true);
		$criteria->compare('CUNoPhonePrefix',$this->CUNoPhonePrefix);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Customer the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
