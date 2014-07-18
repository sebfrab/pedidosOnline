<?php

class ProductoController extends Controller
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
				'actions'=>array('view'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete','create','update','index','view'),
				'expression'=>'Yii::app()->user->checkAccess("mantenedor_producto")',
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
            
                $producto = $this->loadModel($id);
                //*******verificacion de si existe ya este producto en el carro
                $criteria = new CDbCriteria;  
                $criteria->addCondition('usuario_idusuario = '.Yii::app()->user->id);
                $criteria->addCondition('producto_idproducto = '.$id);
                $actual = Carro::model()->find($criteria);
                if($actual){
                    $model= $actual;
                }else{
                    $model=new Carro;
                    $model->producto_idproducto =$id;
                    $model->usuario_idusuario = Yii::app()->user->id;
                    $model->fecha = date("d/m/y H:i:s");
                    $model->cantidad = 0;
                }
 
                if(isset($_POST['Carro']))
		{
			$model->attributes=$_POST['Carro'];
                        $this->performAjaxValidationSubmitCarro($model);
                        
                        if($producto->estado_idestado==0){
                            if(isset($_POST['ajax']) && $_POST['ajax']==='carro-form')
                            { 
                                Yii::app()->user->setFlash("error","Producto no se encuentra disponible");
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    'redirectUrl' => Yii::app()->createUrl('producto/'.$model->producto_idproducto)
                                ));
                            }else{
                                Yii::app()->user->setFlash("error","Producto no se encuentra disponible");
                                $this->redirect(array('/producto/'.$model->producto_idproducto));
                            }
                            Yii::app()->end();
                        }
                        
                        if(isset($_POST['ajax']) && $_POST['ajax']==='carro-form')
                        {  
                            if($model->save()){ 
                                Yii::app()->user->setFlash("success","Producto agregado al carro <b>($model->cantidad)</b>");
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    'redirectUrl' => Yii::app()->createUrl('producto/'.$model->producto_idproducto)
                                ));
                                Yii::app()->end();
                            } 
                        }else{
                            if($model->save()){
                                Yii::app()->user->setFlash("success","Producto agregado al carro <b>($model->cantidad)</b>");
                                //$url = $this->createUrl(array('producto','id'=>$model->producto_idproducto));
                                $this->redirect(array('/producto/'.$model->producto_idproducto));
                            }
                        }  
		}

		$this->render('view',array(
			'model'=>$producto,
                        'modelCarro'=>$model,
                        'url'=>'producto/'.$id,
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Producto;

		$this->performAjaxValidationSubmit($model);

                if(isset($_POST['Producto']))
		{
                        $model->attributes=$_POST['Producto'];
                        
                        ////////////////////////////////////////////////////////////////////
                        $path_picture = "images/productos/";
                        $rnd = rand(0,9999);
                        $rnd = "pedidosOnline".$rnd;
                        $uploadedFile=CUploadedFile::getInstance($model,'img');
                        $fileName = "{$rnd}-{$uploadedFile}";

                        if(!empty($uploadedFile)){
                            $uploadedFile->saveAs($path_picture.$fileName);
                            $model->img= $fileName;
                        }
                        ////////////////////////////////////////////////////////////////////
                        
                        if(isset($_POST['ajax']) && $_POST['ajax']==='producto-form')
                        {  
                            if($model->save()){ 
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    'redirectUrl' => Yii::app()->createUrl('producto/'.$model->idproducto)
                                ));
                                Yii::app()->end();
                            } 
                        }else{
                            if($model->save()){
                                $this->redirect(array('view','id'=>$model->idproducto));
                            }
                        }   
		}

		$this->render('create',array(
			'model'=>$model,
                        'url'=>'producto/create'
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

                if(isset($_POST['Producto']))
                {
                    $model->attributes=$_POST['Producto'];
                    
                    ////////////////////////////////////////////////////////////////////
                    $path_picture = "images/productos/";
                    $rnd = rand(0,9999);
                    $rnd = "pedidosOnline".$rnd;
                    $uploadedFile=CUploadedFile::getInstance($model,'img');
                    $fileName = "{$rnd}-{$uploadedFile}";

                    if(!empty($uploadedFile)){
                        $uploadedFile->saveAs($path_picture.$fileName);
                        $model->img= $fileName;
                    }
                    ////////////////////////////////////////////////////////////////////
                    
                    
                    if(isset($_POST['ajax']) && $_POST['ajax']==='producto-form')
                    {  
                        if($model->save()){ 
                            echo CJSON::encode(array(
                                'insert' => true,
                                'redirectUrl' => Yii::app()->createUrl('producto/'.$model->idproducto)
                            ));
                            Yii::app()->end();
                        } 
                    }else{
                        if($model->save()){
                            $this->redirect(array('view','id'=>$model->idproducto));
                        }
                    }   
                }

		$this->render('update',array(
			'model'=>$model,
                        'url'=>'producto/update/'.$id,
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
                                Yii::app()->user->setFlash('success','Producto eliminado');
                            else
                                echo "<div class='flash-success'>Producto eliminado</div>";
                        }else{
                            if(!isset($_GET['ajax']))
                                Yii::app()->user->setFlash('error','Producto no se puede eliminar');
                            else
                                echo "<div class='flash-error'>Producto no se puede eliminar</div>"; //for ajax
                        }

                    }catch(CDbException $e){

                        if(!isset($_GET['ajax']))
                            Yii::app()->user->setFlash('error','Producto no se puede eliminar');
                        else
                            echo "<div class='flash-error'>Producto no se puede eliminar</div>"; //for ajax

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
		$model=new Producto('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Producto']))
			$model->attributes=$_GET['Producto'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Producto('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Producto']))
			$model->attributes=$_GET['Producto'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Producto the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
                /*$criteria = new CDbCriteria;  
                $criteria->addCondition('idproducto = '.$id);
                $criteria->addCondition('estado_idestado = 1');*/
                
		$model=Producto::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'Producto no existe o no se encuentra disponible.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Producto $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='producto-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        protected function performAjaxValidationSubmitCarro($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='carro-form')
		{
			$errors = CActiveForm::validate($model);
                        if ($errors != '[]')
                        {
                            echo $errors;
                            Yii::app()->end();
                        }
		}
	}
        
        protected function performAjaxValidationSubmit($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='producto-form')
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
