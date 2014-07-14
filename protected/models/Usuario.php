<?php

/**
 * This is the model class for table "usuario".
 *
 * The followings are the available columns in table 'usuario':
 * @property string $idusuario
 * @property string $tipo_usuario_idtipo_usuario
 * @property string $estado_idestado
 * @property string $username
 * @property string $password_2
 * @property string $nombres
 * @property string $apellidos
 * @property string $sexo
 * @property string $last_login
 * @property string $email
 */
class Usuario extends CActiveRecord
{
	public static $generos=array('H'=>'Hombre','M'=>'Mujer');
        
	public function tableName()
	{
		return 'usuario';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tipo_usuario_idtipo_usuario, estado_idestado, username, password_2, nombres, apellidos, sexo', 'required'),
			array('tipo_usuario_idtipo_usuario, estado_idestado', 'length', 'max'=>10),
			array('username, nombres, apellidos', 'length', 'max'=>50),
			array('password_2', 'length', 'max'=>200),
			array('sexo', 'length', 'max'=>1),
			array('email', 'length', 'max'=>150),
                        array('email','email'),
                        array('username','unique','attributeName' => 'username' ,'className' => 'Usuario'),
			array('last_login', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idusuario, tipo_usuario_idtipo_usuario, estado_idestado, username, password_2, nombres, apellidos, sexo, last_login, email', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
                    'carro' => array(self::HAS_MANY,'Carro','usuario_idusuario'),
                    'carroCount' => array(self::STAT, 'Carro', 'usuario_idusuario'),
                    'tipo' => array(self::BELONGS_TO,'TipoUsuario','tipo_usuario_idtipo_usuario'),
                    'estado' => array(self::BELONGS_TO,'Estado','estado_idestado'),
                    'pedido' => array(self::HAS_MANY,'Pedido','usuario_idusuario'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idusuario' => 'Idusuario',
			'tipo_usuario_idtipo_usuario' => 'Tipo',
			'estado_idestado' => 'Estado',
			'username' => 'Username',
			'password_2' => 'Password',
			'nombres' => 'Nombres',
			'apellidos' => 'Apellidos',
			'sexo' => 'Sexo',
			'last_login' => 'Last Login',
			'email' => 'Email',
                        'nombrecompleto' => 'Nombre',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

                $criteria->with=array('estado', 'tipo');
		$criteria->compare('idusuario',$this->idusuario,true);
		$criteria->compare('tipo.idtipo_usuario',$this->tipo_usuario_idtipo_usuario,true);
		$criteria->compare('estado.idestado',$this->estado_idestado,true);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('password_2',$this->password_2,true);
		$criteria->compare('nombres',$this->nombres,true);
		$criteria->compare('apellidos',$this->apellidos,true);
		$criteria->compare('sexo',$this->sexo,true);
		$criteria->compare('last_login',$this->last_login,true);
		$criteria->compare('email',$this->email,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Usuario the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
        
        public function beforeSave() {
            if ($this->isNewRecord)
                $this->password_2 = $this->hashPassword ($this->password_2);

            return parent::beforeSave();
        }
        
        protected function afterSave() {
            parent::afterSave();
            
            $auth = Yii::app()->authManager;
            $items = $auth->getTasks($this->idusuario);
            foreach ($items as $item) {
                $auth->revoke($item->name, $this->idusuario);
                Yii::app()->authManager->save();
            }
            
            switch ($this->tipo_usuario_idtipo_usuario) {
                case 1:
                    $auth->assign('mantenedor_usuario', $this->idusuario);
                    $auth->assign('mantenedor_producto', $this->idusuario);
                    $auth->assign('mantenedor_pedidos', $this->idusuario);
                    $auth->assign('mantenedor_detalle_pedido', $this->idusuario);
                    break;
                case 2:
                    $auth->assign('pedidos', $this->idusuario);
                    break;
                case 3:
                    $auth->assign('lista_productos', $this->idusuario);
                    $auth->assign('carro', $this->idusuario);
                    $auth->assign('pedidos', $this->idusuario);
                    break;
                case 4:
                    $auth->assign('lista_productos', $this->idusuario);
                    $auth->assign('carro', $this->idusuario);
                    $auth->assign('pedidos', $this->idusuario);
                    break;
            }
        }
        
        function beforeDelete(){
            if( $this->carro !== array() )
                return false;
            elseif( $this->pedido !== array() )
                return false;
            return parent::beforeDelete();
        }

        public function validatePassword($password){
            return $this->hashPassword($password)===$this->password_2;
        }
        
        public function hashPassword($password){
            return md5($password);
        }
        
        public function getNombreCompleto()
        {
            return $this->nombres.' '.$this->apellidos;
        }
        
        public static function getGenero($key=null){
            if($key!==null)
                return self::$generos[$key];
            return self::$generos;
        }
        
        public static function getListUsuarios(){
            return CHtml::listData(Usuario::model()->findAll(),'idusuario','nombreCompleto');
        }
        
}
