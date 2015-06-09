<?php

/**
 * This is the model class for table "tbl_file".
 *
 * The followings are the available columns in table 'tbl_file':
 * @property integer $id
 * @property string $FILPNPartNumber
 * @property string $FILFilePath
 * @property string $FILFileName
 * @property integer $FILView
 * @property string $FILNotes
 * @property integer $part_id
 *
 * The followings are the available model relations:
 * @property Part $part
 */
class File extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_file';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('FILView, part_id', 'numerical', 'integerOnly'=>true),
			array('FILPNPartNumber, FILNotes', 'length', 'max'=>50),
			array('FILFilePath, FILFileName', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, FILPNPartNumber, FILFilePath, FILFileName, FILView, FILNotes, part_id', 'safe', 'on'=>'search'),
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
			'part' => array(self::BELONGS_TO, 'Part', 'part_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'FILPNPartNumber' => 'Part Number',
			'FILFilePath' => 'Filfile Path',
			'FILFileName' => 'File Name',
			'FILView' => 'Filview',
			'FILNotes' => 'Filnotes',
			'part_id' => 'Part',
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
		$criteria->compare('FILPNPartNumber',$this->FILPNPartNumber,true);
		$criteria->compare('FILFilePath',$this->FILFilePath,true);
		$criteria->compare('FILFileName',$this->FILFileName,true);
		$criteria->compare('FILView',$this->FILView);
		$criteria->compare('FILNotes',$this->FILNotes,true);
		$criteria->compare('part_id',$this->part_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return File the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
