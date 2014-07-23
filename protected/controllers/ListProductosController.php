<?php

class ListProductosController extends Controller
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
				'actions'=>array('index'),
				'expression'=>'Yii::app()->user->checkAccess("lista_productos")',
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
	public function actionIndex($id)
	{
            $this->layout='//layouts/column2';
            if($id==1){
                $titulo = 'Vestimenta';
            }elseif($id==2){
                $titulo = 'Calzado';
            }else{
                $titulo = 'Otros';
            }
		$this->render('index',array(
			'model'=>$this->loadModel($id),
                        'titulo' => $titulo,
		));
	}

	public function loadModel($id)
	{
                if($id>2){
                    $Criteria = new CDbCriteria();
                    $Criteria->with = array('subcategoria');
                    $Criteria->condition = "categoria_idcategoria > 2";
                    //$Criteria->condition = "estado_idestado = 1";
                    $model = Producto::model()->findAll($Criteria);
                }else{
                    $Criteria = new CDbCriteria();
                    $Criteria->with = array('subcategoria');
                    $Criteria->condition = "categoria_idcategoria = $id";
                    //$Criteria->condition = "estado_idestado = 1";
                    $model = Producto::model()->findAll($Criteria);
                }

		//$model= Producto::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

        
}