<?php

/**
 * This is the model class for table "tbl_pv_pod".
 *
 * The followings are the available columns in table 'tbl_pv_pod':
 * @property integer $id
 * @property string $PODField
 * @property string $PODCaption
 * @property integer $PODOrder
 * @property integer $PODUse
 * @property integer $PODNewLine
 * @property integer $PODUseCaption
 * @property integer $PODMode
 * @property integer $PODOrderJOB
 * @property integer $PODUseJOB
 * @property integer $PODNewLineJOB
 * @property integer $PODUseCaptionJOB
 */
class PvPod extends CActiveRecord
{

    private static $_pods = array(); 
    private static $_podsByField = array(); 


	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_pod';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('PODOrder, PODUse, PODNewLine, PODUseCaption, PODMode, PODOrderJOB, PODUseJOB, PODNewLineJOB, PODUseCaptionJOB', 'numerical', 'integerOnly'=>true),
			array('PODField, PODCaption', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, PODField, PODCaption, PODOrder, PODUse, PODNewLine, PODUseCaption, PODMode, PODOrderJOB, PODUseJOB, PODNewLineJOB, PODUseCaptionJOB', 'safe', 'on'=>'search'),
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
			'PODField' => 'Podfield',
			'PODCaption' => 'Podcaption',
			'PODOrder' => 'Podorder',
			'PODUse' => 'Poduse',
			'PODNewLine' => 'Podnew Line',
			'PODUseCaption' => 'Poduse Caption',
			'PODMode' => 'Podmode',
			'PODOrderJOB' => 'Podorder Job',
			'PODUseJOB' => 'Poduse Job',
			'PODNewLineJOB' => 'Podnew Line Job',
			'PODUseCaptionJOB' => 'Poduse Caption Job',
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
		$criteria->compare('PODField',$this->PODField,true);
		$criteria->compare('PODCaption',$this->PODCaption,true);
		$criteria->compare('PODOrder',$this->PODOrder);
		$criteria->compare('PODUse',$this->PODUse);
		$criteria->compare('PODNewLine',$this->PODNewLine);
		$criteria->compare('PODUseCaption',$this->PODUseCaption);
		$criteria->compare('PODMode',$this->PODMode);
		$criteria->compare('PODOrderJOB',$this->PODOrderJOB);
		$criteria->compare('PODUseJOB',$this->PODUseJOB);
		$criteria->compare('PODNewLineJOB',$this->PODNewLineJOB);
		$criteria->compare('PODUseCaptionJOB',$this->PODUseCaptionJOB);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

    /**
	 * Returns the POD for the specified field name.
	 * @param string field name
	 * @return string the caption for given field.
	 */
	public static function captionByField($field)
	{
		if (count(self::$_podsByField) == 0)
			self::loadPods();

		return isset(self::$_podsByField[$field]) ? self::$_podsByField[$field]->PODCaption : $field;
	}

    /**
	 * Loads the PODs from the database.
	 */
	private static function loadPods()
	{
		$models = self::model()->findAll(array(
			'order'=>'id ASC',
		));

		foreach($models as $model)
        {
			self::$_pods[$model->id] = $model;
			self::$_podsByField[$model->PODField] = $model;
        }
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvPod the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
