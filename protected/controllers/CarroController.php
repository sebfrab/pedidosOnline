<?php

class CarroController extends Controller
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
				'actions'=>array('create','updateCarro','list', 'delete', 'index', 'realizarPedido'),
				'expression'=>'Yii::app()->user->checkAccess("carro")',
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	public function actionCreate()
	{
    		/*$model=new Carro;

		if(isset($_POST['Carro']))
		{
			$model->attributes=$_POST['Carro'];
                        
                        $this->performAjaxValidation($model);
                        
                        //
                        if(isset($_POST['ajax']) && $_POST['ajax']==='carro-form')
                        {  
                            if($model->save()){ 
                                Yii::app()->user->setFlash("success","Producto agregado al carro <b>($model->cantidad)</b>");
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    'redirectUrl' => Yii::app()->createUrl('carro/list')
                                ));
                                Yii::app()->end();
                            } 
                        }else{
                            if($model->save()){
                                Yii::app()->user->setFlash("success","Producto agregado al carro <b>($model->cantidad)</b>");
                                //$url = $this->createUrl(array('producto','id'=>$model->producto_idproducto));
                                $this->redirect(array('/carro/list/'));
                            }
                        }  
		}*/
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	/*public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

                $this->performAjaxValidation($model);

		if(isset($_POST['Carro']))
		{
			$model->attributes=$_POST['Carro'];
			if($model->save()){
                            $this->redirect(array('view','id'=>$model->idcarro));
                        }
				
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}*/
        
        public function actionUpdateCarro($id)
	{
		$model=$this->loadModel($id);

                $this->performAjaxValidationSubmit($model);
                
		if(isset($_POST['Carro']))
		{
			$model->attributes=$_POST['Carro'];
                        
                        
                        if(isset($_POST['ajax']) && $_POST['ajax']==='carro-form')
                        {  
                            if($model->save()){ 
                                Yii::app()->user->setFlash("success","Cantidad modificada <b>($model->cantidad)</b>");
                                echo CJSON::encode(array(
                                    'insert' => true,
                                    'redirectUrl' => Yii::app()->createUrl('carro/list')
                                ));
                                Yii::app()->end();
                            } 
                        }else{
                            if($model->save()){
                                Yii::app()->user->setFlash("success","Cantidad modificada <b>($model->cantidad)</b>");
                                $this->redirect(array('carro/list'));
                            }
                        }   				
		}

	}

	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('list'));
	}

	public function actionIndex()
	{
		/*$dataProvider=new CActiveDataProvider('Carro');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));*/
                $this->redirect(array('carro/list'));
	}

	public function actionAdmin()
	{
		$model=new Carro('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Carro']))
			$model->attributes=$_GET['Carro'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}
        
        
        public function actionList()
        {
            $this->layout='//layouts/column1';
            $model = Carro::model()->CarroUser();
            $this->render('list',array(
			'model'=>$model,
		));
        }
        
        public function actionRealizarPedido()
	{
            $criteria = new CDbCriteria;  
            $criteria->addCondition('usuario_idusuario = '.Yii::app()->user->id);
            $model = Carro::model()->findAll($criteria);
            if($model){
                $sw =1;
                foreach($model as $item){
                    $producto = Producto::model()->findByPk($item->producto_idproducto);
                    if($item->cantidad > $producto->cantidad){
                        $sw = 0;
                        break;
                    }
                }
                
                if($sw == 1){
                    $pedido = new Pedido();
                    $pedido->usuario_idusuario = Yii::app()->user->id;
                    $pedido->fecha_pedido = date("Y-m-d H:i:s");
                    $pedido->estado_idestado = 2;
                    if($pedido->save()){
                        foreach($model as $item){
                            $producto = Producto::model()->findByPk($item->producto_idproducto);
                            $detalle = new DetallePedido();
                            $detalle->pedido_idpedido = $pedido->idpedido;
                            $detalle->cantidad = $item->cantidad;
                            $detalle->producto_idproducto = $item->producto_idproducto;
                            $detalle->save();
                            $producto->cantidad -= $item->cantidad;
                            $producto->save();
                            $item->delete();
                        }
                        Yii::app()->user->setFlash("success","Pedido realizado #$pedido->idpedido");
                        $this->redirect(array('carro/list'));
                    }else{
                        Yii::app()->user->setFlash("error","No se pudo realizar el pedido, intentelo más tarde");
                        $this->redirect(array('carro/list'));
                    }
                }else{
                    Yii::app()->user->setFlash("error","No se pudo realizar el pedido, intentelo más tarde");
                    $this->redirect(array('carro/list'));
                }
                
            }else{
                Yii::app()->user->setFlash("error","seleccione algún articulo para realizar un pedido");
                $this->redirect(array('carro/list'));
            }
        }
        

	public function loadModel($id)
	{
		$model=Carro::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	protected function performAjaxValidation($model)
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
}
