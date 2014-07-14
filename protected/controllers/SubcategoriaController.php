<?php

class SubcategoriaController extends Controller
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
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','admin','delete','index','view'),
				'users'=>array('@'),
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
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Subcategoria;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Subcategoria']))
		{
			$model->attributes=$_POST['Subcategoria'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->idsubcategoria));
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

		if(isset($_POST['Subcategoria']))
		{
			$model->attributes=$_POST['Subcategoria'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->idsubcategoria));
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
            if(Yii::app()->request->isPostRequest)
            {
                try{
                    $status = $this->loadModel($id)->delete();
                    if ($status){
                        if(!isset($_GET['ajax']))
                            Yii::app()->user->setFlash('success','Subcategoria eliminada');
                        else
                            echo "<div class='flash-success'>Subcategoria eliminada</div>";
                    }else{
                        if(!isset($_GET['ajax']))
                            Yii::app()->user->setFlash('error','Subcategoria no se puede eliminar');
                        else
                            echo "<div class='flash-error'>Subcategoria no se puede eliminar</div>"; //for ajax
                    }

                }catch(CDbException $e){

                    if(!isset($_GET['ajax']))
                        Yii::app()->user->setFlash('error','Subcategoria no se puede eliminar');
                    else
                        echo "<div class='flash-error'>Subcategoria no se puede eliminar</div>"; //for ajax

                }

                if(!isset($_GET['ajax']))
                    $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
            }
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Subcategoria');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Subcategoria('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Subcategoria']))
			$model->attributes=$_GET['Subcategoria'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Subcategoria the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Subcategoria::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Subcategoria $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='subcategoria-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
