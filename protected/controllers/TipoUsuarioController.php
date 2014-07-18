<?php

class TipoUsuarioController extends Controller
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
				'actions'=>array('create','update','index','view','admin','delete'),
				'expression'=>'Yii::app()->user->checkAccess("mantenedor_tipo_usuario")',
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
		$model=new TipoUsuario;

		$this->performAjaxValidationSubmit($model);
                
                if(isset($_POST['TipoUsuario']))
		{
                        $model->attributes=$_POST['TipoUsuario'];
                        if(isset($_POST['ajax']) && $_POST['ajax']==='tipo-usuario-form')
                        {  
                            if($model->save()){ 
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    'redirectUrl' => Yii::app()->createUrl('tipousuario/'.$model->idtipo_usuario)
                                ));
                                Yii::app()->end();
                            } 
                        }else{
                            if($model->save()){
                                $this->redirect(array('view','id'=>$model->idtipo_usuario));
                            }
                        }   
		}

		$this->render('create',array(
			'model'=>$model,
                        'url'=>'tipousuario/create',
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
                
                if(isset($_POST['TipoUsuario']))
                {
                    $model->attributes=$_POST['TipoUsuario'];
                    if(isset($_POST['ajax']) && $_POST['ajax']==='tipo-usuario-form')
                    {  
                        if($model->save()){ 
                            echo CJSON::encode(array(
                                'insert' => true,
                                'redirectUrl' => Yii::app()->createUrl('tipousuario/'.$model->idtipo_usuario)
                            ));
                            Yii::app()->end();
                        } 
                    }else{
                        if($model->save()){
                            $this->redirect(array('view','id'=>$model->idtipo_usuario));
                        }
                    }   
                }

		$this->render('update',array(
			'model'=>$model,
                        'url'=>'tipousuario/update/'.$id
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
                                Yii::app()->user->setFlash('success','Tipo de Usuario eliminado');
                            else
                                echo "<div class='flash-success'>Tipo de Usuario eliminado</div>";
                        }else{
                            if(!isset($_GET['ajax']))
                                Yii::app()->user->setFlash('error','Tipo de Usuario no se puede eliminar');
                            else
                                echo "<div class='flash-error'>Tipo de Usuario no se puede eliminar</div>"; //for ajax
                        }

                    }catch(CDbException $e){

                        if(!isset($_GET['ajax']))
                            Yii::app()->user->setFlash('error','Tipo de Usuario no se puede eliminar');
                        else
                            echo "<div class='flash-error'>Tipo de Usuario no se puede eliminar</div>"; //for ajax

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
		/*$dataProvider=new CActiveDataProvider('TipoUsuario');
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
		$model=new TipoUsuario('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['TipoUsuario']))
			$model->attributes=$_GET['TipoUsuario'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return TipoUsuario the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=TipoUsuario::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param TipoUsuario $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='tipo-usuario-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        protected function performAjaxValidationSubmit($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='tipo-usuario-form')
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
