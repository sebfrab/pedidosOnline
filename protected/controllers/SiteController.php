<?php

class SiteController extends Controller
{
    public $layout='//layouts/main';
	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
                        'SoapPedidosOnline'=>array(
				'class'=>'CWebServiceAction',
			),
		);
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
                $model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{
				$name='=?UTF-8?B?'.base64_encode($model->name).'?=';
				$subject='=?UTF-8?B?'.base64_encode($model->subject).'?=';
				$headers="From: $name <{$model->email}>\r\n".
					"Reply-To: {$model->email}\r\n".
					"MIME-Version: 1.0\r\n".
					"Content-Type: text/plain; charset=UTF-8";

				mail(Yii::app()->params['adminEmail'],$subject,$model->body,$headers);
				Yii::app()->user->setFlash('contact','Gracias por contactarnos, nosotros le responderemos tan pronto como sea posible.');
				$this->refresh();
			}
		}
            
		$this->render('index',array('model'=>$model));
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
		if($error=Yii::app()->errorHandler->error)
		{
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else
				$this->render('error', $error);
		}
	}

	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
            
            
		$model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{
				$name='=?UTF-8?B?'.base64_encode($model->name).'?=';
				$subject='=?UTF-8?B?'.base64_encode($model->subject).'?=';
				$headers="From: $name <{$model->email}>\r\n".
					"Reply-To: {$model->email}\r\n".
					"MIME-Version: 1.0\r\n".
					"Content-Type: text/plain; charset=UTF-8";

				mail(Yii::app()->params['adminEmail'],$subject,$model->body,$headers);
				Yii::app()->user->setFlash('contact','Thank you for contacting us. We will respond to you as soon as possible.');
				$this->refresh();
			}
		}
		$this->render('contact',array('model'=>$model));
	}

	/**
	 * Displays the login page
	 */
	public function actionLogin()
	{
            if(!Yii::app()->user->isGuest){
                $this->actionIndex();
            }else{
                $this->layout = '//layouts/mainNoFooter';
		$model=new LoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login()){
                            $usuario = Usuario::model()->findByPk(Yii::app()->user->id);
                            if($usuario->password_2=="239065c4aa235b54edfbe23be799786d"){
                                $this->redirect(array('usuario/changepassword/'.Yii::app()->user->id));
                            }else{
                                $this->redirect(Yii::app()->user->returnUrl);
                            } 
                        }
				
		}
		// display the login form
		$this->render('login',array('model'=>$model)); 
            }
            
            
	}
        
        public function actionSupport()
	{
                $this->layout='//layouts/column1';
		$this->render('support');
	}
        

	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
        
        /**
	 * @param string $productosJson
	 * @return string
	 * @soap
	 */
        public function productos($productosJson){
            $result = '';
            if(!empty($productosJson)){
                $productos = CJSON::decode($productosJson, true);
                if (is_null($productos)) {
                    $result = "No es un objeto JSON";
                }  else {
                    $result = Producto::saveWeb($productos);  
                } 
            }else{
                $result = "Datos enviado no deben estar vacios";
            }
            return CJSON::encode($result);
        }
}