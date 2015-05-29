<?php

/**
 * This is the model class for table "tbl_part".
 *
 * The followings are the available columns in table 'tbl_part':
 * @property integer $id
 * @property integer $PNIDToLNK
 * @property integer $PNUNID
 * @property integer $PNTabParentID
 * @property string $PNPrefix
 * @property string $PNPartNumber
 * @property string $PNSuffix
 * @property string $type_id
 * @property string $PNRevision
 * @property string $PNTitle
 * @property string $PNDetail
 * @property string $status_id
 * @property string $PNReqBy
 * @property string $PNNotes
 * @property string $PNUser1
 * @property string $PNUser2
 * @property string $PNUser3
 * @property string $PNUser4
 * @property string $PNUser5
 * @property string $PNUser6
 * @property string $PNUser7
 * @property string $PNUser8
 * @property string $PNUser9
 * @property string $PNUser10
 * @property string $PNDate
 * @property integer $PNTab
 * @property integer $PNControlled
 * @property string $PNAux1
 * @property double $PNQty
 * @property double $PNQty2
 * @property integer $PNCostChanged
 * @property integer $PNParentCost
 * @property integer $PNExpandList
 * @property integer $PNAssyCostOption
 * @property integer $PNInclAssyOnPurchList
 * @property integer $PNMadeFrom
 * @property double $PNMinStockQty
 * @property integer $PNOrderToMaintain
 * @property integer $PNOnECO
 * @property integer $PNOverKit
 * @property double $PNOverKitQty
 * @property integer $PNOverKitBy
 * @property integer $PNOverKitFor
 * @property double $PNCurrentCost
 * @property double $PNLastRollupCost
 * @property integer $PNUSRID
 * @property integer $PNUserLock
 * @property integer $is_serialized
 * @property integer $requester_id
 * @property integer $stock_location_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property File[] $files
 * @property Issue[] $tblIssues
 * @property Order[] $orders
 * @property OrderItem[] $orderItems
 * @property User $createUser
 * @property User $requester
 * @property StockLocation $stockLocation
 * @property Part $pNTabParent
 * @property Part[] $parts
 * @property Unit $pNUN
 * @property User $updateUser
 * @property PartList[] $partLists
 * @property PartList[] $partLists1
 * @property PartSourceAssignment[] $partSourceAssignments
 * @property Stock[] $stocks
 * @property StockTransaction[] $stockTransactions
 */
class Part extends CActiveRecord
{
	const TYPE_CAT="CAT";
    const TYPE_PL="PL";
    const TYPE_DWG="DWG";
    const TYPE_PS="PS";
    const TYPE_AW="AW";
    const TYPE_DOC="DOC";

    const STATUS_UNRELEASED="U";
    const STATUS_RELEASED="R";
    const STATUS_OBSOLETE="O";

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_part';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('PNPartNumber', 'required'),
			array('PNIDToLNK, PNUNID, PNTabParentID, PNTab, PNControlled, PNCostChanged, PNParentCost, PNExpandList, PNAssyCostOption, PNInclAssyOnPurchList, PNMadeFrom, PNOrderToMaintain, PNOnECO, PNOverKit, PNOverKitBy, PNOverKitFor, PNUSRID, PNUserLock, is_serialized, iteration_number, is_current_iteration, requester_id, stock_location_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('PNQty, PNQty2, PNMinStockQty, PNOverKitQty, PNCurrentCost, PNLastRollupCost', 'numerical'),
			array('PNPrefix, PNPartNumber, PNSuffix, PNAux1', 'length', 'max'=>50),
            array('type_id', 'in', 'range'=>self::getAllowedTypeRange()),
			array('PNRevision, PNReqBy', 'length', 'max'=>10),
			array('PNTitle, PNDetail', 'length', 'max'=>255),
            array('status_id', 'in', 'range'=>self::getAllowedStatusRange()),			
			array('PNUser1, PNUser2, PNUser3, PNUser4, PNUser5, PNUser6, PNUser7, PNUser8, PNUser9, PNUser10', 'length', 'max'=>100),
			array('PNNotes, PNDate, create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, PNIDToLNK, PNUNID, PNTabParentID, PNPrefix, PNPartNumber, PNSuffix, type_id, PNRevision, PNTitle, PNDetail, status_id, PNReqBy, PNNotes, PNUser1, PNUser2, PNUser3, PNUser4, PNUser5, PNUser6, PNUser7, PNUser8, PNUser9, PNUser10, PNDate, PNTab, PNControlled, PNAux1, PNQty, PNQty2, PNCostChanged, PNParentCost, PNExpandList, PNAssyCostOption, PNInclAssyOnPurchList, PNMadeFrom, PNMinStockQty, PNOrderToMaintain, PNOnECO, PNOverKit, PNOverKitQty, PNOverKitBy, PNOverKitFor, PNCurrentCost, PNLastRollupCost, PNUSRID, PNUserLock, is_serialized, iteration_number, is_current_iteration, requester_id, status_id, stock_location_id, type_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
			
//			maestro v0.0.1
//			array('PNPartNumber', 'required'),
//			array('PNIDToLNK, PNUNID, PNTabParentID, PNTab, PNControlled, PNCostChanged, PNParentCost, PNExpandList, PNAssyCostOption, PNInclAssyOnPurchList, PNMadeFrom, PNOrderToMaintain, PNOnECO, PNOverKit, PNOverKitBy, PNOverKitFor, PNUSRID, PNUserLock, type_id, stock_location_id, requester_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
//			array('PNQty, PNQty2, PNMinStockQty, PNOverKitQty, PNCurrentCost, PNLastRollupCost', 'numerical'),
//			array('PNPrefix, PNPartNumber, PNSuffix, PNAux1', 'length', 'max'=>50),
//			array('type_id', 'length', 'max'=>5),
//			array('PNRevision, PNReqBy', 'length', 'max'=>10),
//			array('PNTitle, PNDetail', 'length', 'max'=>255),
//			array('status_id', 'length', 'max'=>1),
//			array('PNUser1, PNUser2, PNUser3, PNUser4, PNUser5, PNUser6, PNUser7, PNUser8, PNUser9, PNUser10', 'length', 'max'=>100),
//			array('PNNotes, PNDate, create_time, update_time', 'safe'),
//			// The following rule is used by search().
//			// @todo Please remove those attributes that should not be searched.
//			array('id, PNIDToLNK, PNUNID, PNTabParentID, PNPrefix, PNPartNumber, PNSuffix, type_id, PNRevision, PNTitle, PNDetail, status_id, PNReqBy, PNNotes, PNUser1, PNUser2, PNUser3, PNUser4, PNUser5, PNUser6, PNUser7, PNUser8, PNUser9, PNUser10, PNDate, PNTab, PNControlled, PNAux1, PNQty, PNQty2, PNCostChanged, PNParentCost, PNExpandList, PNAssyCostOption, PNInclAssyOnPurchList, PNMadeFrom, PNMinStockQty, PNOrderToMaintain, PNOnECO, PNOverKit, PNOverKitQty, PNOverKitBy, PNOverKitFor, PNCurrentCost, PNLastRollupCost, PNUSRID, PNUserLock, type_id, stock_location_id, requester_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'files' => array(self::HAS_MANY, 'File', 'part_id'),
			'tblIssues' => array(self::MANY_MANY, 'Issue', 'tbl_issue_part_assignment(part_id, issue_id)'),
			'orders' => array(self::HAS_MANY, 'Order', 'partslist_id'),
			'orderItems' => array(self::HAS_MANY, 'OrderItem', 'TASKPNID'),
			'createUser' => array(self::BELONGS_TO, 'User', 'create_user_id'),
			'requester' => array(self::BELONGS_TO, 'User', 'requester_id'),
			'stockLocation' => array(self::BELONGS_TO, 'StockLocation', 'stock_location_id'),
			'pNTabParent' => array(self::BELONGS_TO, 'Part', 'PNTabParentID'),
			'parts' => array(self::HAS_MANY, 'Part', 'PNTabParentID'),
			'type' => array(self::BELONGS_TO, 'PartType', 'type_id'),
			'pNUN' => array(self::BELONGS_TO, 'Unit', 'PNUNID'),
			'updateUser' => array(self::BELONGS_TO, 'User', 'update_user_id'),
			'partLists' => array(self::HAS_MANY, 'PartList', 'PLPartID'),
			'partLists1' => array(self::HAS_MANY, 'PartList', 'PLListID'),
			'partSourceAssignments' => array(self::HAS_MANY, 'PartSourceAssignment', 'LNKPNID'),
			'stocks' => array(self::HAS_MANY, 'Stock', 'part_id'),
			'stockTransactions' => array(self::HAS_MANY, 'StockTransaction', 'part_id'),
			
			'unit' => array(self::BELONGS_TO, 'Unit', 'PNUNID'),
			'tabparent' => array(self::BELONGS_TO, 'Part', 'PNTabParentID'),			
			
//			maestro 0.0.1
//			'issues' => array(self::HAS_MANY, 'Issue', 'part_id'),
//			'pvFils' => array(self::HAS_MANY, 'PvFil', 'FILPNID'),
//			'pvLnks' => array(self::HAS_MANY, 'PvLnk', 'LNKPNID'),
//			'pvPls' => array(self::HAS_MANY, 'PvPl', 'PLPartID'),
//			'pvPls1' => array(self::HAS_MANY, 'PvPl', 'PLListID'),
//			'updateUser' => array(self::BELONGS_TO, 'User', 'update_user_id'),
//			'createUser' => array(self::BELONGS_TO, 'User', 'create_user_id'),
//			'requester' => array(self::BELONGS_TO, 'User', 'requester_id'),
//			'stockLocation' => array(self::BELONGS_TO, 'StockLocation', 'stock_location_id'),
//			'pNTabParent' => array(self::BELONGS_TO, 'PvPn', 'PNTabParentID'),
//			'pvPns' => array(self::HAS_MANY, 'PvPn', 'PNTabParentID'),
//			'type' => array(self::BELONGS_TO, 'PvType', 'type_id'),
//			'pNUN' => array(self::BELONGS_TO, 'PvUn', 'PNUNID'),
//			'stockSerials' => array(self::HAS_MANY, 'StockSerial', 'part_id'),
//
//			'unit' => array(self::BELONGS_TO, 'PvUn', 'PNUNID'),
//			'tabparent' => array(self::BELONGS_TO, 'PvPn', 'PNTabParentID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'PNIDToLNK' => 'PNIDToLNK',
			'PNUNID' => 'UOM',
			'PNTabParentID' => 'Parent Part Number',
			'PNPrefix' => 'Prefix',
			'PNPartNumber' => 'Part Number',
			'PNSuffix' => 'Suffix',
			'type_id' => 'Type',
			'PNRevision' => 'Revision',
			'PNTitle' => 'Title',
			'PNDetail' => 'Detail',
			'status_id' => 'Status',
			'PNReqBy' => 'Req. By',
			'PNNotes' => 'Notes',
			'PNUser1' => 'User 1',
			'PNUser2' => 'User 2',
			'PNUser3' => 'User 3',
			'PNUser4' => 'User 4',
			'PNUser5' => 'User 5',
			'PNUser6' => 'User 6',
			'PNUser7' => 'User 7',
			'PNUser8' => 'User 8',
			'PNUser9' => 'User 9',
			'PNUser10' => 'User 10',
			'PNDate' => 'Date',
			'PNTab' => 'Tab',
			'PNControlled' => 'Controlled',
			'PNAux1' => 'Pnaux1',
			'PNQty' => 'Stock Qty',
			'PNQty2' => 'Stock Qty 2',
			'PNCostChanged' => 'Cost Changed',
			'PNParentCost' => 'Use Parent Cost',
			'PNExpandList' => 'Expand List',
			'PNAssyCostOption' => 'Linked Vendor Cost',
			'PNInclAssyOnPurchList' => 'Include Assy On Purch List',
			'PNMadeFrom' => 'Made From',
			'PNMinStockQty' => 'Minimum Stock Qty',
			'PNOrderToMaintain' => 'When Ordering: Maintain Minimum',
			'PNOnECO' => 'On Eco',
			'PNOverKit' => 'Over Kit',
			'PNOverKitQty' => 'Over Kit Qty',
			'PNOverKitBy' => 'Over Kit By',
			'PNOverKitFor' => 'Over Kit For',
			'PNCurrentCost' => 'Current Cost',
			'PNLastRollupCost' => 'Last Calculated Cost',
			'PNUSRID' => 'User ID',
			'PNUserLock' => 'User Lock',
			
			'is_serialized' => 'Is Serialized',
			'iteration_number' => 'Iteration Number',
			'is_current_iteration' => 'Is Current Iteration',
			'requester_id' => 'Requester',
			'stock_location_id' => 'Stock Location',
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
		$criteria=new CDbCriteria;

		$criteria->compare('PNPartNumber',$this->PNPartNumber,true);
		$criteria->compare('type_id',$this->type_id,true);
		$criteria->compare('PNRevision',$this->PNRevision,true);
		$criteria->compare('PNTitle',$this->PNTitle,true);
		$criteria->compare('PNDetail',$this->PNDetail,true);
		$criteria->compare('status_id',$this->status_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
            'pagination'=>array(
                'pageSize'=>Yii::app()->params['pagesize'],
            ),
			'sort'=>array(
				'defaultOrder'=>'PNPartNumber ASC',
			),
		));
	}

    /**
     * Retrieves a list of part types
     * @return Array an array of available part types.
     */
    public function getTypeOptions()
    {
        return array(
            self::TYPE_CAT=>'Catalogue Part',
            self::TYPE_PL=>'Assembly',
            self::TYPE_DWG=>'Custom',
            self::TYPE_PS=>'Specification',
            self::TYPE_AW=>'Artwork',
            self::TYPE_DOC=>'Documentation',
        );
    }

    public static function getAllowedTypeRange()
    {
        return array(
            self::TYPE_CAT,
            self::TYPE_PL,
            self::TYPE_DWG,
            self::TYPE_PS,
            self::TYPE_AW,
            self::TYPE_DOC,
        );
    }

    /**
     * Retrieves a list of part statuses
     * @return Array an array of available part statuses.
     */
    public function getStatusOptions()
    {
        return array(
            self::STATUS_UNRELEASED=>'Not Released',
            self::STATUS_RELEASED=>'Released',
            self::STATUS_OBSOLETE=>'Obsolete',
        );
    }

    public function getAllowedStatusRange()
    {
        return array(
            self::STATUS_UNRELEASED,
            self::STATUS_RELEASED,
            self::STATUS_OBSOLETE,
        );
    }	

    /**
     * @return string the status text display for the current issue
     */ 
    public function getStatusText()
    {
        // following is equivalent to $statusOptions=$this->getStatusOptions();
        $statusOptions=$this->statusOptions;
        return isset($statusOptions[$this->status_id]) ? $statusOptions[$this->status_id] : "unknown status ({$this->status_id})";
    }

    /**
     * @return string the type text display for the current issue
     */ 
    public function getTypeText()
    {
        $typeOptions=$this->typeOptions;
        return isset($typeOptions[$this->type_id]) ? $typeOptions[$this->type_id] : "unknown type ({$this->type_id})";
    }
	

    /**
	 * Retrieves a list of child parts of the specified part.
	 * @return CActiveDataProvider the data provider that can return the needed details.
	 */
	public function childs($id, $pagesize = -1)
	{
        $pagesize = ($pagesize == -1) ? Yii::app()->params['partListPageSize'] : 0;
		$criteria = new CDbCriteria;

		$criteria->compare('PLListID', $id, false);

		return new CActiveDataProvider('PartList', array(
			'criteria' => $criteria,
            'pagination'=>array(
                'pageSize'=>$pagesize,
            ),
			'sort'=>array(
				'defaultOrder'=>'PLItem ASC',
			),
		));
	}

    /**
	 * Retrieves a list of parts that are parents of the specified part.
	 * @return CActiveDataProvider the data provider that can return the needed details.
	 */
	public function parents($id, $pagesize = -1)
	{
        $pagesize = ($pagesize == -1) ? Yii::app()->params['partListPageSize'] : 0;

		$criteria = new CDbCriteria;

		$criteria->compare('PLPartID', $id, false);

		return new CActiveDataProvider('PartList', array(
			'criteria' => $criteria,
            'pagination'=>array(
                'pageSize'=>$pagesize,
            ),
			'sort'=>array(
				'defaultOrder'=>'PLItem ASC',
			),
		));
	}

    public function YesNo($value, $equal_to, $yes_text, $no_text)
    {
        return ($value == $equal_to) ? $yes_text : $no_text;
    }

    public function valueToText($value, $params)
    {
        return isset($params[$value]) ? strval($params[$value]) : strval($value);
    }

    public static function partsCount()
    {
        return parent::model('PartNumber')->count();
    }

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PvPn the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}