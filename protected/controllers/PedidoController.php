<?php

class PedidoController extends Controller
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
				'actions'=>array('list','view','update','voucher'),
				'expression'=>'Yii::app()->user->checkAccess("pedidos")',
			),
                        array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete','create','update','index','view','list'),
				'expression'=>'Yii::app()->user->checkAccess("mantenedor_pedidos")',
			),
                        array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('informe'),
				'expression'=>'Yii::app()->user->checkAccess("view_informes")',
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
                $model=$this->loadModel($id);
                $usuario = Usuario::model()->findByPk(Yii::app()->user->id);

		$this->render('view',array(
			'model'=>$model,
                        'tipoUsuario'=>$usuario->tipo->idtipo_usuario,
                        'url'=>'pedido/update/'.$id,
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Pedido;

		$this->performAjaxValidationSubmit($model);

                if(isset($_POST['Pedido']))
		{
                        $model->attributes=$_POST['Pedido'];
                        if(isset($_POST['ajax']) && $_POST['ajax']==='pedido-form')
                        {  
                            if($model->save()){ 
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    'redirectUrl' => Yii::app()->createUrl('pedido/'.$model->idpedido)
                                ));
                                Yii::app()->end();
                            } 
                        }else{
                            if($model->save()){
                                $this->redirect(array('view','id'=>$model->idpedido));
                            }
                        }   
		}

		$this->render('create',array(
			'model'=>$model,
                        'url'=>'pedido/create'
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

		if(isset($_POST['Pedido']))
		{
			$model->attributes=$_POST['Pedido'];
                        if(isset($_POST['ajax']) && $_POST['ajax']==='pedido-form')
                        {  
                            if($model->save()){ 
                                Yii::app()->user->setFlash("success","Pedido #$model->idpedido actualizado, estado: ". $model->estado->nombre);
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    //redirecciona a la lista de pedidos
                                    'redirectUrl' => Yii::app()->createUrl('pedido/list')
                                    //redirecciona al mismo pedido
                                    //'redirectUrl' => Yii::app()->createUrl('pedido/'.$model->idpedido)
                                ));
                                Yii::app()->end();
                            } 
                        }else{
                            if($model->save()){
                                Yii::app()->user->setFlash("success","Pedido actualizado");
                                $this->redirect(array('view','id'=>$model->idpedido));
                            }
                        }   	
		}

		$this->render('update',array(
			'model'=>$model,
                        'url'=>'pedido/update/'.$id
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
		/*$dataProvider=new CActiveDataProvider('Pedido');
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
		$model=new Pedido('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Pedido']))
			$model->attributes=$_GET['Pedido'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

        public function actionList()
	{
            $this->layout='//layouts/column1';
                /*$usuario = Usuario::model()->findByPk(Yii::app()->user->id);
                if($usuario->tipo->idtipo_usuario==1){
                    $model = Pedido::model()->findAll();
                }else{
                    $criteria = new CDbCriteria;  
                    $criteria->addCondition('usuario_idusuario = '.Yii::app()->user->id);
                    $criteria->order = 'idpedido ASC';
                    $model = Pedido::model()->findAll($criteria);
                }
                

		$this->render('list',array(
			'model'=>$model,
		));*/

                $model=new Pedido('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Pedido'])){
			$model->attributes=$_GET['Pedido'];
                        
                }
                
                if($model->curso==null && $model->fecha_pedido==null){
                    $fecha = date("d-m-Y");
                    
                    $dia = date("N");
                    $criteriaHorario=new CDbCriteria;
                    $criteriaHorario->addCondition('dia = '.$dia);
                    $horario = DiasEntrega::model()->find($criteriaHorario);
                    
                    $model->curso = $horario->curso;
                    $model->fecha_pedido = '<'.$fecha;
                    
                    $model->estado_idestado = 2;
                }
                
		$this->render('list',array(
			'model'=>$model,
		));
	}
        
        public function actionVoucher($id){
            $model=$this->loadModel($id);
            
            
            $this->layout = '//layouts/mainVoucher';
            
            # mPDF
            $mPDF1 = Yii::app()->ePdf->mpdf();
            # You can easily override default constructor's params
            $mPDF1 = Yii::app()->ePdf->mpdf('utf-8','PAPER80','','',0,0,3,1,0,0,'P');
            # render (full page)
            $mPDF1->WriteHTML($this->render('voucher', array('model'=>$model), true));
            # Outputs ready PDF
            $mPDF1->Output();
            
            //$this->render('voucher', array('model'=>$model));
        }

        public function actionInforme(){
            $criteria=new CDbCriteria;
            $criteria->with=array(
                    'pedido',
                    'producto',
                );
            $criteria->order = 'pedido.idpedido ASC';
            
            $model = DetallePedido::model()->findAll($criteria);
            
            /*$this->render('excel',array(
			'model'=>$model,
		));*/
            
            $content = $this->renderPartial("excel",array("model"=>$model),true);
            Yii::app()->request->sendFile("pedidos_".date("d-m-Y H:i:s").".xls",$content);
        }
        
	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Pedido the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Pedido::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Pedido $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='pedido-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        protected function performAjaxValidationSubmit($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='pedido-form')
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
