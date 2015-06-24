<?php

/**
 * This is the model class for table "tbl_pv_hpref".
 *
 * The followings are the available columns in table 'tbl_pv_hpref':
 * @property integer $id
 * @property string $GPREFKey
 * @property string $GPREFText1
 * @property string $GPREFText2
 * @property string $GPREFText3
 * @property string $GPREFText4
 * @property string $GPREFText5
 * @property integer $GPREFBool1
 * @property integer $GPREFBool2
 * @property integer $GPREFBool3
 * @property integer $GPREFBool4
 * @property integer $GPREFInt1
 * @property string $GPREFText6
 * @property string $GPREFText7
 * @property string $GPREFText8
 * @property string $GPREFText9
 * @property string $GPREFText10
 */
class PvHpref extends CActiveRecord
{
    private static $_UserFields = array(); 

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_hpref';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('GPREFKey', 'required'),
			array('GPREFBool1, GPREFBool2, GPREFBool3, GPREFBool4, GPREFInt1', 'numerical', 'integerOnly'=>true),
			array('GPREFKey, GPREFText1, GPREFText2, GPREFText3, GPREFText4, GPREFText5, GPREFText6, GPREFText7, GPREFText8, GPREFText9, GPREFText10', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, GPREFKey, GPREFText1, GPREFText2, GPREFText3, GPREFText4, GPREFText5, GPREFBool1, GPREFBool2, GPREFBool3, GPREFBool4, GPREFInt1, GPREFText6, GPREFText7, GPREFText8, GPREFText9, GPREFText10', 'safe', 'on'=>'search'),
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
			'GPREFKey' => 'Gprefkey',
			'GPREFText1' => 'Gpreftext1',
			'GPREFText2' => 'Gpreftext2',
			'GPREFText3' => 'Gpreftext3',
			'GPREFText4' => 'Gpreftext4',
			'GPREFText5' => 'Gpreftext5',
			'GPREFBool1' => 'Gprefbool1',
			'GPREFBool2' => 'Gprefbool2',
			'GPREFBool3' => 'Gprefbool3',
			'GPREFBool4' => 'Gprefbool4',
			'GPREFInt1' => 'Gprefint1',
			'GPREFText6' => 'Gpreftext6',
			'GPREFText7' => 'Gpreftext7',
			'GPREFText8' => 'Gpreftext8',
			'GPREFText9' => 'Gpreftext9',
			'GPREFText10' => 'Gpreftext10',
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
		$criteria->compare('GPREFKey',$this->GPREFKey,true);
		$criteria->compare('GPREFText1',$this->GPREFText1,true);
		$criteria->compare('GPREFText2',$this->GPREFText2,true);
		$criteria->compare('GPREFText3',$this->GPREFText3,true);
		$criteria->compare('GPREFText4',$this->GPREFText4,true);
		$criteria->compare('GPREFText5',$this->GPREFText5,true);
		$criteria->compare('GPREFBool1',$this->GPREFBool1);
		$criteria->compare('GPREFBool2',$this->GPREFBool2);
		$criteria->compare('GPREFBool3',$this->GPREFBool3);
		$criteria->compare('GPREFBool4',$this->GPREFBool4);
		$criteria->compare('GPREFInt1',$this->GPREFInt1);
		$criteria->compare('GPREFText6',$this->GPREFText6,true);
		$criteria->compare('GPREFText7',$this->GPREFText7,true);
		$criteria->compare('GPREFText8',$this->GPREFText8,true);
		$criteria->compare('GPREFText9',$this->GPREFText9,true);
		$criteria->compare('GPREFText10',$this->GPREFText10,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

    /**
	 * Returns the Captions for user defined fields.
	 * @param string field name
	 * @return string the caption for given field.
	 */
	public static function captionByField($field)
	{
		if (count(self::$_UserFields) == 0)
			self::loadHprefs();

		return isset(self::$_UserFields[$field]) ? self::$_UserFields[$field] : $field;
	}

    /**
	 * Loads the PODs from the database.
	 */
	private static function loadHprefs()
	{
		$models = self::model()->findAll(array(
			'order'=>'id ASC',
		));

		foreach($models as $model)
        {
            if (strtolower($model->GPREFKey) == strtolower('UserFields'))
            {
                //hardcoded because at this time I do not know to do it better
                //labels for user defined fields are stored by P&V in table
				//tbl_pv_hpref using fields GPREFText[1..10] for the record
				//in which GPRefKey = "UserFields"
			    self::$_UserFields['PNUser1'] = $model->GPREFText1;
			    self::$_UserFields['PNUser2'] = $model->GPREFText2;
			    self::$_UserFields['PNUser3'] = $model->GPREFText3;
			    self::$_UserFields['PNUser4'] = $model->GPREFText4;
			    self::$_UserFields['PNUser5'] = $model->GPREFText5;
			    self::$_UserFields['PNUser6'] = $model->GPREFText6;
			    self::$_UserFields['PNUser7'] = $model->GPREFText7;
			    self::$_UserFields['PNUser8'] = $model->GPREFText8;
			    self::$_UserFields['PNUser9'] = $model->GPREFText9;
			    self::$_UserFields['PNUser10'] = $model->GPREFText10;
            }
        }
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvHpref the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
