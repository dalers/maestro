<?php

/**
 * This is the model class for table "tbl_pv_mfrpn".
 *
 * The followings are the available columns in table 'tbl_pv_mfrpn':
 * @property integer $id
 * @property integer $MFRPNMFRID
 * @property string $MFRPNPart
 *
 * The followings are the available model relations:
 * @property PvLnk[] $pvLnks
 * @property PvMfr $mFRPNMFR
 * @property PvPl[] $pvPls
 */
class PvMfrpn extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_mfrpn';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('MFRPNMFRID', 'numerical', 'integerOnly'=>true),
			array('MFRPNPart', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, MFRPNMFRID, MFRPNPart', 'safe', 'on'=>'search'),
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
			'pvLnks' => array(self::HAS_MANY, 'PvLnk', 'LNKMFRPNID'),
			'mFRPNMFR' => array(self::BELONGS_TO, 'PvMfr', 'MFRPNMFRID'),
			'pvPls' => array(self::HAS_MANY, 'PvPl', 'PLMFRPNID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'MFRPNMFRID' => 'Mfrpnmfrid',
			'MFRPNPart' => 'Mfrpnpart',
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
		$criteria->compare('MFRPNMFRID',$this->MFRPNMFRID);
		$criteria->compare('MFRPNPart',$this->MFRPNPart,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvMfrpn the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}