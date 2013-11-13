<?php

/**
 * This is the model class for table "tbl_pv_pn".
 *
 * The followings are the available columns in table 'tbl_pv_pn':
 * @property integer $id
 * @property integer $PNIDToLNK
 * @property integer $PNUNID
 * @property integer $PNTabParentID
 * @property string $PNPrefix
 * @property string $PNPartNumber
 * @property string $PNSuffix
 * @property string $PNType
 * @property string $PNRevision
 * @property string $PNTitle
 * @property string $PNDetail
 * @property string $PNStatus
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
 * @property integer $type_id
 * @property integer $stock_location_id
 * @property integer $requester_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property Issue[] $issues
 * @property PvFil[] $pvFils
 * @property PvLnk[] $pvLnks
 * @property PvPl[] $pvPls
 * @property PvPl[] $pvPls1
 * @property Person $updateUser
 * @property Person $createUser
 * @property Person $requester
 * @property StockLocation $stockLocation
 * @property PvPn $pNTabParent
 * @property PvPn[] $pvPns
 * @property PvType $type
 * @property PvUn $pNUN
 * @property StockSerial[] $stockSerials
 */
class PvPn extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_pv_pn';
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
			array('PNIDToLNK, PNUNID, PNTabParentID, PNTab, PNControlled, PNCostChanged, PNParentCost, PNExpandList, PNAssyCostOption, PNInclAssyOnPurchList, PNMadeFrom, PNOrderToMaintain, PNOnECO, PNOverKit, PNOverKitBy, PNOverKitFor, PNUSRID, PNUserLock, type_id, stock_location_id, requester_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('PNQty, PNQty2, PNMinStockQty, PNOverKitQty, PNCurrentCost, PNLastRollupCost', 'numerical'),
			array('PNPrefix, PNPartNumber, PNSuffix, PNAux1', 'length', 'max'=>50),
			array('PNType', 'length', 'max'=>5),
			array('PNRevision, PNReqBy', 'length', 'max'=>10),
			array('PNTitle, PNDetail', 'length', 'max'=>255),
			array('PNStatus', 'length', 'max'=>1),
			array('PNUser1, PNUser2, PNUser3, PNUser4, PNUser5, PNUser6, PNUser7, PNUser8, PNUser9, PNUser10', 'length', 'max'=>100),
			array('PNNotes, PNDate, create_time, update_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, PNIDToLNK, PNUNID, PNTabParentID, PNPrefix, PNPartNumber, PNSuffix, PNType, PNRevision, PNTitle, PNDetail, PNStatus, PNReqBy, PNNotes, PNUser1, PNUser2, PNUser3, PNUser4, PNUser5, PNUser6, PNUser7, PNUser8, PNUser9, PNUser10, PNDate, PNTab, PNControlled, PNAux1, PNQty, PNQty2, PNCostChanged, PNParentCost, PNExpandList, PNAssyCostOption, PNInclAssyOnPurchList, PNMadeFrom, PNMinStockQty, PNOrderToMaintain, PNOnECO, PNOverKit, PNOverKitQty, PNOverKitBy, PNOverKitFor, PNCurrentCost, PNLastRollupCost, PNUSRID, PNUserLock, type_id, stock_location_id, requester_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'issues' => array(self::HAS_MANY, 'Issue', 'part_id'),
			'pvFils' => array(self::HAS_MANY, 'PvFil', 'FILPNID'),
			'pvLnks' => array(self::HAS_MANY, 'PvLnk', 'LNKPNID'),
			'pvPls' => array(self::HAS_MANY, 'PvPl', 'PLPartID'),
			'pvPls1' => array(self::HAS_MANY, 'PvPl', 'PLListID'),
			'updateUser' => array(self::BELONGS_TO, 'Person', 'update_user_id'),
			'createUser' => array(self::BELONGS_TO, 'Person', 'create_user_id'),
			'requester' => array(self::BELONGS_TO, 'Person', 'requester_id'),
			'stockLocation' => array(self::BELONGS_TO, 'StockLocation', 'stock_location_id'),
			'pNTabParent' => array(self::BELONGS_TO, 'PvPn', 'PNTabParentID'),
			'pvPns' => array(self::HAS_MANY, 'PvPn', 'PNTabParentID'),
			'type' => array(self::BELONGS_TO, 'PvType', 'type_id'),
			'pNUN' => array(self::BELONGS_TO, 'PvUn', 'PNUNID'),
			'stockSerials' => array(self::HAS_MANY, 'StockSerial', 'part_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'PNIDToLNK' => 'Pnidto Lnk',
			'PNUNID' => 'Pnunid',
			'PNTabParentID' => 'Pntab Parent',
			'PNPrefix' => 'Pnprefix',
			'PNPartNumber' => 'Pnpart Number',
			'PNSuffix' => 'Pnsuffix',
			'PNType' => 'Pntype',
			'PNRevision' => 'Pnrevision',
			'PNTitle' => 'Pntitle',
			'PNDetail' => 'Pndetail',
			'PNStatus' => 'Pnstatus',
			'PNReqBy' => 'Pnreq By',
			'PNNotes' => 'Pnnotes',
			'PNUser1' => 'Pnuser1',
			'PNUser2' => 'Pnuser2',
			'PNUser3' => 'Pnuser3',
			'PNUser4' => 'Pnuser4',
			'PNUser5' => 'Pnuser5',
			'PNUser6' => 'Pnuser6',
			'PNUser7' => 'Pnuser7',
			'PNUser8' => 'Pnuser8',
			'PNUser9' => 'Pnuser9',
			'PNUser10' => 'Pnuser10',
			'PNDate' => 'Pndate',
			'PNTab' => 'Pntab',
			'PNControlled' => 'Pncontrolled',
			'PNAux1' => 'Pnaux1',
			'PNQty' => 'Pnqty',
			'PNQty2' => 'Pnqty2',
			'PNCostChanged' => 'Pncost Changed',
			'PNParentCost' => 'Pnparent Cost',
			'PNExpandList' => 'Pnexpand List',
			'PNAssyCostOption' => 'Pnassy Cost Option',
			'PNInclAssyOnPurchList' => 'Pnincl Assy On Purch List',
			'PNMadeFrom' => 'Pnmade From',
			'PNMinStockQty' => 'Pnmin Stock Qty',
			'PNOrderToMaintain' => 'Pnorder To Maintain',
			'PNOnECO' => 'Pnon Eco',
			'PNOverKit' => 'Pnover Kit',
			'PNOverKitQty' => 'Pnover Kit Qty',
			'PNOverKitBy' => 'Pnover Kit By',
			'PNOverKitFor' => 'Pnover Kit For',
			'PNCurrentCost' => 'Pncurrent Cost',
			'PNLastRollupCost' => 'Pnlast Rollup Cost',
			'PNUSRID' => 'Pnusrid',
			'PNUserLock' => 'Pnuser Lock',
			'type_id' => 'Type',
			'stock_location_id' => 'Stock Location',
			'requester_id' => 'Requester',
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
		$criteria->compare('PNIDToLNK',$this->PNIDToLNK);
		$criteria->compare('PNUNID',$this->PNUNID);
		$criteria->compare('PNTabParentID',$this->PNTabParentID);
		$criteria->compare('PNPrefix',$this->PNPrefix,true);
		$criteria->compare('PNPartNumber',$this->PNPartNumber,true);
		$criteria->compare('PNSuffix',$this->PNSuffix,true);
		$criteria->compare('PNType',$this->PNType,true);
		$criteria->compare('PNRevision',$this->PNRevision,true);
		$criteria->compare('PNTitle',$this->PNTitle,true);
		$criteria->compare('PNDetail',$this->PNDetail,true);
		$criteria->compare('PNStatus',$this->PNStatus,true);
		$criteria->compare('PNReqBy',$this->PNReqBy,true);
		$criteria->compare('PNNotes',$this->PNNotes,true);
		$criteria->compare('PNUser1',$this->PNUser1,true);
		$criteria->compare('PNUser2',$this->PNUser2,true);
		$criteria->compare('PNUser3',$this->PNUser3,true);
		$criteria->compare('PNUser4',$this->PNUser4,true);
		$criteria->compare('PNUser5',$this->PNUser5,true);
		$criteria->compare('PNUser6',$this->PNUser6,true);
		$criteria->compare('PNUser7',$this->PNUser7,true);
		$criteria->compare('PNUser8',$this->PNUser8,true);
		$criteria->compare('PNUser9',$this->PNUser9,true);
		$criteria->compare('PNUser10',$this->PNUser10,true);
		$criteria->compare('PNDate',$this->PNDate,true);
		$criteria->compare('PNTab',$this->PNTab);
		$criteria->compare('PNControlled',$this->PNControlled);
		$criteria->compare('PNAux1',$this->PNAux1,true);
		$criteria->compare('PNQty',$this->PNQty);
		$criteria->compare('PNQty2',$this->PNQty2);
		$criteria->compare('PNCostChanged',$this->PNCostChanged);
		$criteria->compare('PNParentCost',$this->PNParentCost);
		$criteria->compare('PNExpandList',$this->PNExpandList);
		$criteria->compare('PNAssyCostOption',$this->PNAssyCostOption);
		$criteria->compare('PNInclAssyOnPurchList',$this->PNInclAssyOnPurchList);
		$criteria->compare('PNMadeFrom',$this->PNMadeFrom);
		$criteria->compare('PNMinStockQty',$this->PNMinStockQty);
		$criteria->compare('PNOrderToMaintain',$this->PNOrderToMaintain);
		$criteria->compare('PNOnECO',$this->PNOnECO);
		$criteria->compare('PNOverKit',$this->PNOverKit);
		$criteria->compare('PNOverKitQty',$this->PNOverKitQty);
		$criteria->compare('PNOverKitBy',$this->PNOverKitBy);
		$criteria->compare('PNOverKitFor',$this->PNOverKitFor);
		$criteria->compare('PNCurrentCost',$this->PNCurrentCost);
		$criteria->compare('PNLastRollupCost',$this->PNLastRollupCost);
		$criteria->compare('PNUSRID',$this->PNUSRID);
		$criteria->compare('PNUserLock',$this->PNUserLock);
		$criteria->compare('type_id',$this->type_id);
		$criteria->compare('stock_location_id',$this->stock_location_id);
		$criteria->compare('requester_id',$this->requester_id);
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
	 * @return PvPn the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
