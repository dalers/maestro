<?php

/**
 * This is the model class for table "tbl_pv_lnk".
 *
 * The followings are the available columns in table 'tbl_pv_lnk':
 * @property integer $id
 * @property integer $LNKSUID
 * @property integer $LNKMFRPNID
 * @property integer $LNKMFRID
 * @property integer $LNKUNID
 * @property integer $LNKPNID
 * @property integer $LNKToPNID
 * @property integer $LNKUse
 * @property string $LNKLeadtime
 * @property integer $LNKChoice
 * @property string $LNKVendorPN
 * @property string $LNKVendorDesc
 * @property double $LNKAtQty
 * @property string $LNKRFQDate
 * @property double $LNKMinIncrement
 * @property double $LNKCurrentCost
 * @property double $LNKSetupCost
 * @property integer $LNKRoHS
 * @property string $LNKRoHSDoc
 * @property string $LNKRoHSNote
 *
 * The followings are the available model relations:
 * @property PvPn $lNKPN
 * @property PvMfr $lNKMFR
 * @property PvMfrpn $lNKMFRPN
 * @property PvSu $lNKSU
 * @property PvUn $lNKUN
 * @property PvPl[] $pvPls
 */
class PvLnk extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_lnk';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('LNKSUID, LNKMFRPNID, LNKMFRID, LNKUNID, LNKPNID, LNKToPNID, LNKUse, LNKChoice, LNKRoHS', 'numerical', 'integerOnly'=>true),
			array('LNKAtQty, LNKMinIncrement, LNKCurrentCost, LNKSetupCost', 'numerical'),
			array('LNKLeadtime', 'length', 'max'=>20),
			array('LNKVendorPN, LNKVendorDesc, LNKRoHSDoc', 'length', 'max'=>50),
			array('LNKRoHSNote', 'length', 'max'=>255),
			array('LNKRFQDate', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, LNKSUID, LNKMFRPNID, LNKMFRID, LNKUNID, LNKPNID, LNKToPNID, LNKUse, LNKLeadtime, LNKChoice, LNKVendorPN, LNKVendorDesc, LNKAtQty, LNKRFQDate, LNKMinIncrement, LNKCurrentCost, LNKSetupCost, LNKRoHS, LNKRoHSDoc, LNKRoHSNote', 'safe', 'on'=>'search'),
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
			'lNKPN' => array(self::BELONGS_TO, 'PvPn', 'LNKPNID'),
			'lNKMFR' => array(self::BELONGS_TO, 'PvMfr', 'LNKMFRID'),
			'lNKMFRPN' => array(self::BELONGS_TO, 'PvMfrpn', 'LNKMFRPNID'),
			'lNKSU' => array(self::BELONGS_TO, 'PvSu', 'LNKSUID'),
			'lNKUN' => array(self::BELONGS_TO, 'PvUn', 'LNKUNID'),
			'pvPls' => array(self::HAS_MANY, 'PvPl', 'PLLNKID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'LNKSUID' => 'Lnksuid',
			'LNKMFRPNID' => 'Lnkmfrpnid',
			'LNKMFRID' => 'Lnkmfrid',
			'LNKUNID' => 'Lnkunid',
			'LNKPNID' => 'Lnkpnid',
			'LNKToPNID' => 'Lnkto Pnid',
			'LNKUse' => 'Lnkuse',
			'LNKLeadtime' => 'Lnkleadtime',
			'LNKChoice' => 'Lnkchoice',
			'LNKVendorPN' => 'Lnkvendor Pn',
			'LNKVendorDesc' => 'Lnkvendor Desc',
			'LNKAtQty' => 'Lnkat Qty',
			'LNKRFQDate' => 'Lnkrfqdate',
			'LNKMinIncrement' => 'Lnkmin Increment',
			'LNKCurrentCost' => 'Lnkcurrent Cost',
			'LNKSetupCost' => 'Lnksetup Cost',
			'LNKRoHS' => 'Lnkro Hs',
			'LNKRoHSDoc' => 'Lnkro Hsdoc',
			'LNKRoHSNote' => 'Lnkro Hsnote',
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
		$criteria->compare('LNKSUID',$this->LNKSUID);
		$criteria->compare('LNKMFRPNID',$this->LNKMFRPNID);
		$criteria->compare('LNKMFRID',$this->LNKMFRID);
		$criteria->compare('LNKUNID',$this->LNKUNID);
		$criteria->compare('LNKPNID',$this->LNKPNID);
		$criteria->compare('LNKToPNID',$this->LNKToPNID);
		$criteria->compare('LNKUse',$this->LNKUse);
		$criteria->compare('LNKLeadtime',$this->LNKLeadtime,true);
		$criteria->compare('LNKChoice',$this->LNKChoice);
		$criteria->compare('LNKVendorPN',$this->LNKVendorPN,true);
		$criteria->compare('LNKVendorDesc',$this->LNKVendorDesc,true);
		$criteria->compare('LNKAtQty',$this->LNKAtQty);
		$criteria->compare('LNKRFQDate',$this->LNKRFQDate,true);
		$criteria->compare('LNKMinIncrement',$this->LNKMinIncrement);
		$criteria->compare('LNKCurrentCost',$this->LNKCurrentCost);
		$criteria->compare('LNKSetupCost',$this->LNKSetupCost);
		$criteria->compare('LNKRoHS',$this->LNKRoHS);
		$criteria->compare('LNKRoHSDoc',$this->LNKRoHSDoc,true);
		$criteria->compare('LNKRoHSNote',$this->LNKRoHSNote,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvLnk the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
