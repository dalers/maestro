<?php
class OmOrderController extends Controller
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
	 * Lists all models (with the the highest iteration group by id)
	 */
	public function actionIndex()
	{
		$criteria = new CDbCriteria();
		$criteria->select = 'id, size, tool_type, locale, order_type, status, create_time, create_user_id, update_time, MAX(iteration) iteration';
		$criteria->group = 'id';
		
        $model = new OmOrder('search');

        $model->unsetAttributes();
		
		if(isset($_GET['OmOrder']))
		{
			$criteria->addSearchCondition('tags',$_GET['OmOrder']);
			$model->attributes = $_GET['OmOrder'];
		}
	 
		$dataProvider=new CActiveDataProvider('OmOrder', array(
			'pagination'=>array(
				'pageSize'=>10,
			),
			'criteria'=>$criteria,
		));
	 
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
			'model' => $model,
		));
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
				'actions'=>array('index','view'),
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
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
	    $model=new OmOrder;

	    if(isset($_POST['ajax']) && $_POST['ajax']==='client-account-create-form')
	    {
	        echo CActiveForm::validate($model);
	        Yii::app()->end();
	    }

	    if(isset($_POST['OmOrder']))
	    {
	        $model->attributes=$_POST['OmOrder'];
	        if($model->validate())
	        {
				$this->saveModel($model);
				$this->redirect(array('view','id'=>$model->id, 'iteration'=>$model->iteration));
	        }
	    }
	    $this->render('create',array('model'=>$model));
	} 
	
	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id, $iteration)
	{
		if(Yii::app()->request->isPostRequest)
		{
			try
			{
				// we only allow deletion via POST request
				$this->loadModel($id, $iteration)->delete();
			}
			catch(Exception $e) 
			{
				$this->showError($e);
			}

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 * @param integer $iteration the iteration of the model to be updated
	 */
	public function actionUpdate($id, $iteration)
	{
		$model=$this->loadModel($id, $iteration);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['OmOrder']))
		{
			$model->attributes=$_POST['OmOrder'];
			$this->saveModel($model);
			$this->redirect(array('view',
	                    'id'=>$model->id, 'iteration'=>$model->iteration));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new OmOrder('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['OmOrder']))
			$model->attributes=$_GET['OmOrder'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id, $iteration)
	{		
		$model=$this->loadModel($id, $iteration);
		$this->render('view',array('model'=>$model));
	}

	/**
	 * Returns the data model based on the primary keys given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @param integer $iteration the iteration of the model to be loaded
	 * @return OmOrder the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id, $iteration)
	{
		$model=OmOrder::model()->findByPk(array('id'=>$id, 'iteration'=>$iteration));
		if($model==null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	public function saveModel($model)
	{
		try
		{
			$model->save();
		}
		catch(Exception $e)
		{
			$this->showError($e);
		}		
	}

	function showError(Exception $e)
	{
		if($e->getCode()==23000)
			$message = "This operation is not permitted due to an existing foreign key reference.";
		else
			$message = "Invalid operation.";
		throw new CHttpException($e->getCode(), $message);
	}		
}