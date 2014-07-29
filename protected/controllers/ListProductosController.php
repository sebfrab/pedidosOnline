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
				'actions'=>array('index', 'search'),
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
            
            $Criteria = new CDbCriteria();
            $Criteria->condition = "idsubcategoria  = $id";
            $model = Subcategoria::model()->findByPk($id);
            $titulo = "";
            if($model){
                $titulo = $model->nombre;
            }
            
		$this->render('index',array(
			'model'=>$this->loadModel($id),
                        'titulo' => $titulo,
		));
	}

        
        public function actionSearch()
	{
            $this->layout='//layouts/column2';
                $Criteria = new CDbCriteria();
		if(isset($_GET['search'])){
                    $Criteria->compare('idproducto',$_GET['search'],true, 'OR');
                    $Criteria->compare('nombre',$_GET['search'],true, 'OR');
                    $Criteria->compare('descripcion',$_GET['search'],true, 'OR');
                    $Criteria->compare('marca',$_GET['search'],true, 'OR');
                    $Criteria->compare('talla',$_GET['search'],true, 'OR');
                    $Criteria->compare('cantidad',$_GET['search'],true, 'OR');
                    $Criteria->compare('ROUND(precio*1.05)',$_GET['search'],true, 'OR');
                    $Criteria->compare('estado_idestado',1,true);
                    
                }
                $model = Producto::model()->findAll($Criteria);
			
		$this->render('search',array(
                        'model'=>$model,
                        'busqueda'=>$_GET['search'],
		));
	}
        
	public function loadModel($id)
	{
                /*if($id>2){
                    $Criteria = new CDbCriteria();
                    $Criteria->with = array('subcategoria');
                    $Criteria->condition = "subcategoria_idsubcategoria  > 2 and estado_idestado=1";
                    //$Criteria->condition = "estado_idestado = 1";
                    $model = Producto::model()->findAll($Criteria);
                }else{
                    $Criteria = new CDbCriteria();
                    $Criteria->with = array('subcategoria');
                    $Criteria->condition = "subcategoria_idsubcategoria  = $id and estado_idestado=1";
                    //$Criteria->condition = "estado_idestado = 1";
                    $model = Producto::model()->findAll($Criteria);
                }*/
            
                $Criteria = new CDbCriteria();
                $Criteria->condition = "subcategoria_idsubcategoria  = $id and estado_idestado=1";
                //$Criteria->condition = "estado_idestado = 1";
                $model = Producto::model()->findAll($Criteria);

		//$model= Producto::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

        
}
