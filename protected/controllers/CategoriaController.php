<?php

class CategoriaController extends Controller
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
				'expression'=>'Yii::app()->user->checkAccess("mantenedor_categorias")',
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
		$model=new Categoria;

		$this->performAjaxValidationSubmit($model);
                
                if(isset($_POST['Categoria']))
		{
                        $model->attributes=$_POST['Categoria'];
                        if(isset($_POST['ajax']) && $_POST['ajax']==='categoria-form')
                        {  
                            if($model->save()){ 
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    'redirectUrl' => Yii::app()->createUrl('categoria/'.$model->idcategoria)
                                ));
                                Yii::app()->end();
                            } 
                        }else{
                            if($model->save()){
                                $this->redirect(array('view','id'=>$model->idcategoria));
                            }
                        }   
		}

		$this->render('create',array(
			'model'=>$model,
                        'url'=>'categoria/create',
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

		$this->performAjaxValidationSubmit($model);
                
                if(isset($_POST['Categoria']))
                {
                    $model->attributes=$_POST['Categoria'];
                    if(isset($_POST['ajax']) && $_POST['ajax']==='categoria-form')
                    {  
                        if($model->save()){ 
                            echo CJSON::encode(array(
                                'insert' => true,
                                'redirectUrl' => Yii::app()->createUrl('categoria/'.$model->idcategoria)
                            ));
                            Yii::app()->end();
                        } 
                    }else{
                        if($model->save()){
                            $this->redirect(array('view','id'=>$model->idcategoria));
                        }
                    }   
                }

		$this->render('update',array(
			'model'=>$model,
                        'url'=>'categoria/update/'.$id
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
                                Yii::app()->user->setFlash('success','Categoria eliminada');
                            else
                                echo "<div class='flash-success'>Categoria eliminada</div>";
                        }else{
                            if(!isset($_GET['ajax']))
                                Yii::app()->user->setFlash('error','Categoria no se puede eliminar');
                            else
                                echo "<div class='flash-error'>Categoria no se puede eliminar</div>"; //for ajax
                        }

                    }catch(CDbException $e){

                        if(!isset($_GET['ajax']))
                            Yii::app()->user->setFlash('error','Categoria no se puede eliminar');
                        else
                            echo "<div class='flash-error'>Categoria no se puede eliminar</div>"; //for ajax

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
		/*$dataProvider=new CActiveDataProvider('Categoria');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));*/
                $this->redirect(array('admin'));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Categoria('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Categoria']))
			$model->attributes=$_GET['Categoria'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Categoria the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Categoria::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Categoria $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='categoria-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        protected function performAjaxValidationSubmit($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='categoria-form')
		{
			$errors = CActiveForm::validate($model);
                        if ($errors != '[]')
                        {
                            echo $errors;
                            Yii::app()->end();
                        }
		}
	}
}
