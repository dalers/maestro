<?php

//partslist save as csv
Yii::import('ext.ECSVExport');
require_once('protected/extensions/ECSVExport/ECSVExport.php');

class PartController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view', 'saveaspdf', 'view4pdf', 'SuggestLocation', 'saveascsv'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Save Part view as PDF (and download to user)
	 * @param integer $id the ID of the model to be converted to PDF
	 * 
	 * html2pdf PHP class is used to convert HTML (created using "pdf"
	 * Part view) to PDF.
	 * 
	 * Requires:
	 *   Yii-pdf extension (http://www.yiiframework.com/extension/pdf#hh3)
	 *   is installed to protected/extensions/
	 * 
	 *   HTML2PDF (http://html2pdf.fr/en/default) is installed to
	 *   protected/vendor/html2pdf/
	 */
	public function actionSaveAsPDF($id)
	{
        $model = $this->loadModel($id);
        $pdfname = $model->PNPartNumber . ".pdf";
        $this->layout='//layouts/pdf';

        $html2pdf = Yii::app()->ePdf->HTML2PDF('P', Yii::app()->params['PDFPageSize'], 'en');

        //echo $this->renderPartial('view4html2pdf', array('model' => $model));return;

        $html2pdf->WriteHTML($this->renderPartial('view4html2pdf', array('model' => $model), true));
        $html2pdf->Output($pdfname);		
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Part;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Part']))
		{
			$model->attributes=$_POST['Part'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Part']))
		{
			$model->attributes=$_POST['Part'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$model = new Part('search');
		$model->unsetAttributes();  //clear any default values

		if (isset($_GET['Part']))
			$model->attributes = $_GET['Part'];

		$this->render('index', array(
			'model' => $model,
		));
	}

	/**
	 * Suggest stocking location based on provided attributes
	 */
	public function actionSuggestLocation($id)
    {
		$bins = array();

		$model = $this->loadModel($id);
		$location = StockLocation::findLocationByName($model->PNUser9);
		if ($location != null)
			$bins = StockLocation::suggestLocation($location->id);

		$this->render('suggestLocation', array(
			'location' => $location,
			'bins' => $bins,
			'model' => $model,
		));
    }

	/**
	* Save as CSV
	* TODO create filters for query
	* - hide/show column names?
	* - dynamically build SELECT statement?
	* TODO investigate potential bug in CSV extension
	* - may not correctly handle nulls other than in last (right-most) column
	*/
	public function actionSaveAsCSV()
	{
		$csvname = "parts.csv";
		$path = Yii::app()->basePath;
		$filename = $path."/runtime/".$csvname;		
		$cmd = Yii::app()->db->createCommand("SELECT PNPartNumber, type_id, status_id, PNRevision, PNTitle, PNDetail FROM maestro.tbl_part");
		
		$csv = new ECSVExport($cmd);
		
		$csv->setHeader('PNPartNumber', 'PartNumber');
		$csv->setHeader('type_id', 'Type');
		$csv->setHeader('status_id', 'Status');
		$csv->setHeader('PNRevision', 'Revision');
		$csv->setHeader('PNTitle', 'Title');
		$csv->setHeader('PNDetail', 'Detail');

		$csv->setOutputFile($filename);
		$output = $csv->toCSV();
		
		Yii::app()->getRequest()->sendFile($csvname, file_get_contents($filename));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Part('search');
		$model->unsetAttributes();  //clear any default values
		
		if(isset($_GET['Part']))
			$model->attributes=$_GET['Part'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return PvPn the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Part::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param PvPn $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='pv-pn-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
