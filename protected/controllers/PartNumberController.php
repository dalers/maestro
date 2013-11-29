<?php

class PartNumberController extends Controller
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
				'actions'=>array('index','view', 'saveaspdf', 'view4pdf', 'SuggestLocation'),
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
	 * Displays a particular model in a view prepared for saving into PDF .
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
	 * Use wkhtmltopdf to convert HTML (special view of Part Number) to PDF and download to user
	 * https://code.google.com/p/wkhtmltopdf/
	 * 
	 * @param integer $id the ID of the model to be displayed
	 */
    public function actionSaveAsPDF_wkhtmltopdf($id, $pdfname)
    {
        //URL to HTML file (view) that will be converted to PDF
        $url = "http://" . $_SERVER['HTTP_HOST'] . Yii::app()->request->baseUrl . "/index.php/partNumber/view4PDF/" . $id;
        //Name with full path of PDF file that will be created
        $fname = Yii::getPathOfAlias('application.runtime') . '/' . $pdfname;
        // Path to wkhtmltopdf converter 
        //$path = Yii::getPathOfAlias('application.bin') . "/wkhtmltopdf-i386";
        $path = Yii::app()->params['Path2Wkhtmltopdf'];

        $output = array();
        $error = 0;

        // Composing a command that will download HTML file (view) and convert it to PDF 
        // and then dowload it to user
        $cmd = $path . ' -s ' . Yii::app()->params['PDFPageSize'] . ' "' . $url . '" "' . $fname . '"';

        //echo $cmd;

        exec($cmd, $output, $error);

        if ($error == 0)
        {
            //if no error send converted PDF file to user
            Yii::app()->request->sendFile($pdfname, file_get_contents($fname), null, true);
            // TODO: Remove local PDF file! When you remove the file right after calling sendFile then the file can not be downloaded somewhy
        }
        else
        {
            // TODO: Show error message
            echo "Error " . $error;
        }
    }

	/**
	 * Converts HTML file (special view of Part Number) to PDF format and downloads it to user
     * mPDF PHP class is used for convertations HTML->PDF 
     * You have to install yii-pdf extension (http://www.yiiframework.com/extension/pdf#hh3) and store it in protected/extensions folder
     * and mPDF PHP library (http://mpdf1.com/) and store it under name 'mpdf' in protected/vendor folder
	 * @param integer $id the ID of the model to be displayed
	 */
    public function actionSaveAsPDF_mpdf($id, $pdfname)
    {
        // Set layout that will dispay HTML for converting to PDF
        $this->layout='//layouts/pdf';

        // You can easily override default constructor's params
        $mPDF1 = Yii::app()->ePdf->mpdf('', Yii::app()->params['PDFPageSize']);

        // Set needed CSS files
        $stylesheet = file_get_contents(Yii::getPathOfAlias('webroot.css') . '/screen.css');
        $mPDF1->WriteHTML($stylesheet, 1);

        $stylesheet = file_get_contents(Yii::getPathOfAlias('webroot.css') . '/print.css');
        $mPDF1->WriteHTML($stylesheet, 1);

        $stylesheet = file_get_contents(Yii::getPathOfAlias('webroot.css') . '/form.css');
        $mPDF1->WriteHTML($stylesheet, 1);

        $stylesheet = file_get_contents(Yii::getPathOfAlias('webroot.css') . '/ie.css');
        $mPDF1->WriteHTML($stylesheet, 1);

        //$stylesheet = file_get_contents(Yii::getPathOfAlias('webroot.css') . '/main.css');
        //$mPDF1->WriteHTML($stylesheet, 1);

        // render (full page)
        $mPDF1->WriteHTML($this->render('view4PDF', array(
			'model'=>$this->loadModel($id),
		), true));

        // Outputs ready PDF
        $mPDF1->Output($pdfname, "D");
    }

	/**
	 * Converts HTML file (special view of Part Number) to PDF format and downloads it to user
     * html2pdf PHP class is used for convertations HTML->PDF 
     * You have to install yii-pdf extension (http://www.yiiframework.com/extension/pdf#hh3) and store it in protected/extensions folder
     * and html2pdf PHP library (http://html2pdf.fr/en/default) and store it under name 'html2pdf' in protected/vendor folder
	 * @param integer $id the ID of the model to be displayed
	 */
    public function actionSaveAsPDF_html2pdf($id, $pdfname)
    {
        // HTML2PDF has very similar syntax
        $html2pdf = Yii::app()->ePdf->HTML2PDF('P', Yii::app()->params['PDFPageSize']);
        $html2pdf->WriteHTML($this->renderPartial('view4PDF', array('model'=>$this->loadModel($id)), true));
        $html2pdf->Output($pdfname);
    }

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionSaveAsPDF($id)
	{
        $pdfname = "part_" . $id . ".pdf";

        switch (Yii::app()->params['PDFconverter'])
        {
            case 1: $this->actionSaveAsPDF_wkhtmltopdf($id, $pdfname); break;
            case 2: $this->actionSaveAsPDF_mpdf($id, $pdfname); break;
            case 3: $this->actionSaveAsPDF_html2pdf($id, $pdfname); break;
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
        //print_r(StockLocation::getLocations()); die;

        $model = new PvPn('search');

        $model->unsetAttributes();

		if (isset($_GET['PvPn']))
			$model->attributes = $_GET['PvPn'];

        $this->render('index', array(
            'dataProvider' => $model->search(),
			'model' => $model,
		));
	}

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
