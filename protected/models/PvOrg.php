<?php

/**
 * This is the model class for table "tbl_pv_org".
 *
 * The followings are the available columns in table 'tbl_pv_org':
 * @property integer $id
 * @property string $ORGKey
 * @property string $ORGName
 * @property string $ORGAddress
 * @property string $ORGPhone
 * @property string $ORGFaax
 * @property integer $ORGPOUseShpgAddr
 * @property integer $ORGRFQUseShpgAddr
 * @property integer $ORGListOrder
 */
class PvOrg extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_org';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ORGPOUseShpgAddr, ORGRFQUseShpgAddr, ORGListOrder', 'numerical', 'integerOnly'=>true),
			array('ORGKey, ORGPhone, ORGFaax', 'length', 'max'=>20),
			array('ORGName', 'length', 'max'=>50),
			array('ORGAddress', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, ORGKey, ORGName, ORGAddress, ORGPhone, ORGFaax, ORGPOUseShpgAddr, ORGRFQUseShpgAddr, ORGListOrder', 'safe', 'on'=>'search'),
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
			'ORGKey' => 'Orgkey',
			'ORGName' => 'Orgname',
			'ORGAddress' => 'Orgaddress',
			'ORGPhone' => 'Orgphone',
			'ORGFaax' => 'Orgfaax',
			'ORGPOUseShpgAddr' => 'Orgpouse Shpg Addr',
			'ORGRFQUseShpgAddr' => 'Orgrfquse Shpg Addr',
			'ORGListOrder' => 'Orglist Order',
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
		$criteria->compare('ORGKey',$this->ORGKey,true);
		$criteria->compare('ORGName',$this->ORGName,true);
		$criteria->compare('ORGAddress',$this->ORGAddress,true);
		$criteria->compare('ORGPhone',$this->ORGPhone,true);
		$criteria->compare('ORGFaax',$this->ORGFaax,true);
		$criteria->compare('ORGPOUseShpgAddr',$this->ORGPOUseShpgAddr);
		$criteria->compare('ORGRFQUseShpgAddr',$this->ORGRFQUseShpgAddr);
		$criteria->compare('ORGListOrder',$this->ORGListOrder);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvOrg the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
