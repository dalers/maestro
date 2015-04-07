<?php

/**
 * This is the model class for table "tbl_pv_lin".
 *
 * The followings are the available columns in table 'tbl_pv_lin':
 * @property integer $id
 * @property integer $LINSUID
 * @property integer $LINMFRID
 *
 * The followings are the available model relations:
 * @property PvMfr $lINMFR
 * @property PvLin $lINSU
 * @property PvLin[] $pvLins
 */
class PvLin extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_lin';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('LINSUID, LINMFRID', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, LINSUID, LINMFRID', 'safe', 'on'=>'search'),
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
			'lINMFR' => array(self::BELONGS_TO, 'PvMfr', 'LINMFRID'),
			'lINSU' => array(self::BELONGS_TO, 'PvLin', 'LINSUID'),
			'pvLins' => array(self::HAS_MANY, 'PvLin', 'LINSUID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'LINSUID' => 'Linsuid',
			'LINMFRID' => 'Linmfrid',
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
		$criteria->compare('LINSUID',$this->LINSUID);
		$criteria->compare('LINMFRID',$this->LINMFRID);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvLin the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}