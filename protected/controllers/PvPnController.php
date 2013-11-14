<?php

class PvPnController extends Controller
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
				'actions'=>array('index','view', 'saveaspdf', 'view4pdf'),
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
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView4PDF($id)
	{
        $this->layout='//layouts/pdf';

        $this->render('view4PDF',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionSaveAsPDF($id)
	{
        $url = "http://" . $_SERVER['HTTP_HOST'] . Yii::app()->request->baseUrl . "/index.php/pvPn/view4PDF/" . $id;
        $fname = Yii::getPathOfAlias('application.runtime') . "/part_" . $id . ".pdf";
        $path = Yii::getPathOfAlias('application.bin') . "/wkhtmltopdf-i386";
        $output = array();
        $error = 0;
        $cmd = $path . ' -s Letter "' . $url . '" "' . $fname . '"';

        //echo $cmd . "<br/>";

        exec($cmd, $output, $error);

        if ($error == 0)
        {
            Yii::app()->request->sendFile("part_" . $id . ".pdf", file_get_contents($fname), null, true);
            //Yii::app()->request->xSendFile($fname, array('mimeType'=>'application/pdf', 'terminate'=>true));
        }
        else
        {
            echo "Error " . $error;
        }
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new PvPn;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['PvPn']))
		{
			$model->attributes=$_POST['PvPn'];
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

		if(isset($_POST['PvPn']))
		{
			$model->attributes=$_POST['PvPn'];
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
        $model = new PvPn('search');

        $model->unsetAttributes();

		if (isset($_GET['PvPn']))
			$model->attributes = $_GET['PvPn'];

        $this->render('index', array(
            'dataProvider' => $model->search(),
			'model' => $model,
		));

        /*
		$dataProvider=new CActiveDataProvider('PvPn');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
        */
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new PvPn('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['PvPn']))
			$model->attributes=$_GET['PvPn'];

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
		$model=PvPn::model()->findByPk($id);
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
