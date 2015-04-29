<?php

/**
 * This is the model class for table "tbl_order".
 *
 * The followings are the available columns in table 'tbl_order':
 * @property integer $id
 * @property string $type
 * @property string $name
 * @property string $status
 * @property integer $project_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property User $createUser
 * @property User $updateUser
 * @property OrderItem[] $OrderItems
 */
class Order extends CActiveRecord
{

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_order';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('project_id, parts_list_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('name, type, status', 'length', 'max'=>255),
			array('create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, type, status, project_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'project' => array(self::BELONGS_TO, 'Project', 'project_id'),
			'createUser' => array(self::BELONGS_TO, 'User', 'create_user_id'),
			'updateUser' => array(self::BELONGS_TO, 'User', 'update_user_id'),
			'OrderItems' => array(self::HAS_MANY, 'OrderItem', 'order_id'),
			'partslist' => array(self::BELONGS_TO, 'PvPn', 'parts_list_id'),
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
			'type' => 'Type',
			'status' => 'Status',
			'project_id' => 'Project',
			'parts_list_id' => 'Parts List',
			'create_time' => 'Create Time',
			'create_user_id' => 'Create User',
			'update_time' => 'Update Time',
			'update_user_id' => 'Update User',
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
		$criteria->compare('type',$this->type,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('project_id',$this->project_id);
		$criteria->compare('create_time',$this->create_time,true);
		$criteria->compare('create_user_id',$this->create_user_id);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('update_user_id',$this->update_user_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Order the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	 /**
	 * Retrieves the list of parts that are childs of the specified part.
	 * @return CActiveDataProvider the data provider that can return the needed details.
	 */
	public function childs($id, $pagesize = -1)
	{
        $pagesize = ($pagesize == -1) ? Yii::app()->params['partListPageSize'] : 0;
		$criteria = new CDbCriteria;

		$criteria->compare('order_id', $id, false);

		return new CActiveDataProvider('OrderItem', array(
			'criteria' => $criteria,
            'pagination'=>array(
                'pageSize'=>$pagesize,
            ),
			'sort'=>array(
				'defaultOrder'=>'part_id ASC',
			),
		));
	}
	
	public function project($id)
	{
		$pagesize = ($pagesize == -1) ? Yii::app()->params['partListPageSize'] : 0;
		$criteria = new CDbCriteria;

		$criteria->compare('id', $id, false);

		return new CActiveDataProvider('Project', array(
			'criteria' => $criteria,
            'pagination'=>array(
                'pageSize'=>$pagesize,
            ),
			'sort'=>array(
				'defaultOrder'=>'project_id ASC',
			),
		));
	}
	
	public function partslists($id)
	{
		$pagesize = ($pagesize == -1) ? Yii::app()->params['partListPageSize'] : 0;
		$criteria = new CDbCriteria;

		$criteria->compare('id', $id, false);

		return new CActiveDataProvider('PvPn', array(
			'criteria' => $criteria,
            'pagination'=>array(
                'pageSize'=>$pagesize,
            ),
		));
	}

	public function beforeSave()
	{
		if(parent::beforeSave())
		{
			if ($this->isNewRecord)
			{
				$this->setAttribute('create_user_id', Yii::app()->user->id);
				$this->create_time = new CDbExpression('NOW()');
				$this->setAttribute('update_user_id', Yii::app()->user->id);
				$this->update_time = new CDbExpression('NOW()');
			}
			else
			{
				$this->setAttribute('update_user_id', Yii::app()->user->id);
				$this->update_time = new CDbExpression('NOW()');
			}
			return true;
		}
		return false;
	}

	public function afterSave()
	{
		parent::afterSave();
		if ($this->isNewRecord)
		{
			$rows = $this->fetchPartsFromPartsList($this->parts_list_id);
			foreach ($rows as $row)
			{
				$this->createOrderItems($this->id, $row[0], $row[1]);
			}
		}
	}

	private function fetchPartsFromPartsList($id)
	{
		$list= Yii::app()->db->createCommand('SELECT pl.PLPartID AS PLPartID, pl.PLQty AS PNQty FROM tbl_pv_pl pl, tbl_pv_pn pn WHERE pl.PLPartID = pn.id AND pl.PLListID=:plid')->bindValue('plid',$id)->queryAll();
	
		$rs=array();
	
		foreach($list as $item){
			$rs[]=array($item['PLPartID'],$item['PNQty']);
		}
	
		return $rs;
	}
	
	private function createOrderItems($id, $pn, $desired_qty)
	{
		$sql = "INSERT INTO tbl_order_item (order_id, part_id, desired_qty, shipped_qty) values (:order_id, :part_id, :desired_qty, :shipped_qty)";

		$parameters = array(":order_id"=>$id, ":part_id"=>$pn, ":desired_qty"=>$desired_qty, ":shipped_qty"=>0 );

		Yii::app()->db->createCommand($sql)->execute($parameters);
	}

	public function getPartsList()
	{
		$partslist= Yii::app()->db->createCommand('SELECT id, PNTitle FROM tbl_pv_pn WHERE PNType = \'PL\'')->queryAll();

		$list = CHtml::listData($partslist,'id','PNTitle');

		return $list;
	}
}
