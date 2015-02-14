<?php

/**
 * This is the model class for table "tbl_stock_location".
 *
 * The followings are the available columns in table 'tbl_stock_location':
 * @property integer $id
 * @property string $name
 * @property integer $use_sublocation
 * @property integer $sublocation_min
 * @property integer $sublocation_max
 *
 * The followings are the available model relations:
 * @property PvPn[] $pvPns
 */
class StockLocation extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_stock_location';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('use_sublocation, sublocation_min, sublocation_max', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, use_sublocation, sublocation_min, sublocation_max', 'safe', 'on'=>'search'),
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
			'pvPns' => array(self::HAS_MANY, 'PvPn', 'stock_location_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'use_sublocation' => 'Use Sublocation',
			'sublocation_min' => 'Sublocation Min',
			'sublocation_max' => 'Sublocation Max',
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
		$criteria->compare('name',$this->name,true);
		$criteria->compare('use_sublocation',$this->use_sublocation);
		$criteria->compare('sublocation_min',$this->sublocation_min);
		$criteria->compare('sublocation_max',$this->sublocation_max);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

    public static function getLocations()
    {
        $models = StockLocation::model()->findAll('', array(
			'sort'=>array(
				'defaultOrder'=>'name ASC',
			),
		));

        return $models;
    }

    public static function findLocationByName($name)
    {
        $model = StockLocation::model()->find(array('condition' => 'name=:name',
            'params' => array(':name'=>$name))
        );

        return $model;
    }

	/**
	 * Retrieves a list of free bins for specified location (room)
	 *
     * @param int $room_id identfier of location
	 * @return array of free bins
     */
    public static function suggestLocation($room_id)
    {
        // Call stored procedure that returns free Bins numbers
        $sql = 'call suggest_location(' . $room_id . ');';
        // Query database
        $bins = Yii::app()->db->createCommand($sql)->queryAll();

        return $bins;
    }

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return StockLocation the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
