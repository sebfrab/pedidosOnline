<?php

/**
 * This is the model class for table "pedido".
 *
 * The followings are the available columns in table 'pedido':
 * @property string $idpedido
 * @property string $estado_idestado
 * @property string $usuario_idusuario
 * @property string $fecha_pedido
 * @property string $fecha_entrega
 * @property string $comentario
 * 
 */
class Pedido extends CActiveRecord
{
        /************************************************************/
        /*para filtrado por curso, nombre, apellidos y N° cadete
         * en el listado de pedidos (search) */
        /************************************************************/
        public $curso;
        public $nombres;
        public $apellidos;
        public $ncadete;
        
        
        /**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'pedido';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('estado_idestado, usuario_idusuario, fecha_pedido', 'required'),
			array('estado_idestado, usuario_idusuario', 'length', 'max'=>10),
			array('fecha_entrega, comentario, curso, nombres, apellidos, ncadete', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idpedido, estado_idestado, usuario_idusuario, fecha_pedido, fecha_entrega, comentario', 'safe', 'on'=>'search'),
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
                    'usuario' => array(self::BELONGS_TO,'Usuario','usuario_idusuario'),
                    'estado' => array(self::BELONGS_TO,'Estado','estado_idestado'),
                    'detalle'=>array(self::HAS_MANY,'DetallePedido', 'pedido_idpedido'),
                    'detalleCount' => array(self::STAT, 'DetallePedido', 'pedido_idpedido'),
                    'detalleSum'=>array(self::STAT,  'DetallePedido', 'pedido_idpedido', 'select' => 'SUM(t.cantidad)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idpedido' => 'Idpedido',
			'estado_idestado' => 'Estado Idestado',
			'usuario_idusuario' => 'Usuario Idusuario',
			'fecha_pedido' => 'Fecha Pedido',
			'fecha_entrega' => 'Fecha Entrega',
                        'comentario' => 'Comentario',
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
                $usuario = Usuario::model()->findByPk(Yii::app()->user->id);
                $criteria=new CDbCriteria;
                $criteria->with=array('usuario', 'estado');
                if($usuario->tipo->idtipo_usuario==1 || $usuario->tipo->idtipo_usuario==2){
                    $criteria->compare('idpedido',$this->idpedido,true);
                    //$criteria->compare('usuario.username',$this->usuario->username,true);
                    $criteria->compare('estado.idestado',$this->estado_idestado,true);
                    //$criteria->compare('usuario.nombres',$this->usuario_idusuario,true);
                    
                    $criteria->compare('usuario.ncadete',$this->ncadete,true);
                    $criteria->compare('DATE_FORMAT(fecha_pedido,"%d-%m-%Y")',$this->fecha_pedido,true);
                    $criteria->compare('usuario.curso',$this->curso);
                    
                    /*if($this->fecha_pedido==null){
                        $fecha = date("d-m-Y");
                        $criteria->addCondition('DATE_FORMAT(fecha_pedido,"%d-%m-%Y") >  '.$fecha);
                    }else{
                        $criteria->addCondition('DATE_FORMAT(fecha_pedido,"%d-%m-%Y")='.$this->fecha_pedido);
                    }   
                    
                    
                    if($this->curso==null){
                        $dia = date("N");
                        $criteriaHorario=new CDbCriteria;
                        $criteriaHorario->addCondition('dia = '.$dia);
                        $horario = DiasEntrega::model()->findAll($criteriaHorario);
                        $sw=0;
                        foreach($horario as $hr){
                            if($sw==0)
                                $criteria->compare('usuario.curso',$hr->curso,true);
                            else{
                                $criteria->compare('usuario.curso',$hr->curso,true,'OR');
                                $sw=1;
                            }
                        }
                    }else{
                       $criteria->addCondition('usuario.curso ='. $this->curso); 
                    }*/
                    
                    
                    /*foreach($horario as $hr){
                        $criteria->addCondition('usuario.curso',$hr->curso,'OR');
                        //$criteria->addSearchCondition('usuario.curso', $hr->curso, true);
                    }*/

                    $criteria->addSearchCondition('usuario.nombres', $this->nombres);
                    $criteria->addSearchCondition('usuario.apellidos', $this->apellidos);
                    
                }else{
                    $criteria->compare('idpedido',$this->idpedido,true);
                    //$criteria->compare('usuario.username',$this->usuario->username,true);
                    $criteria->compare('estado.idestado',$this->estado_idestado,true);
                    $criteria->compare('usuario.nombres',$this->usuario_idusuario,true);
                    $criteria->compare('fecha_pedido',$this->fecha_pedido,true);
                    $criteria->addCondition('usuario_idusuario = '.Yii::app()->user->id);
                }
            
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Pedido the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
        
        public function getFechaPedido()
        {
            return $newDate = date("d-m-Y", strtotime($this->fecha_pedido));
        }
        
        public function getHoraPedido()
        {
            return $newDate = date("H:i:s", strtotime($this->fecha_pedido));
        }
        
        function beforeSave(){
            if($this->estado_idestado==4){
                $this->fecha_entrega = date("Y-m-d H:i:s");
            }
            return parent::beforeSave();
        }
        
        protected function afterSave() {
            parent::afterSave();
            if (!$this->isNewRecord) {
                if($this->estado_idestado ==3){
                    $usuario = Usuario::model()->findByPk($this->usuario_idusuario);
                    if($usuario->email){
                        $body = "Pedido #$this->idpedido se encuentra listo para ser retirado.";
                        $name='=?UTF-8?B?'.base64_encode('Pedidos Online').'?=';
                        $subject='=?UTF-8?B?'.base64_encode("Pedido Ok").'?=';
                        $headers="From: $name <{".Yii::app()->params['adminEmail']."}>\r\n".
                                    "Reply-To: {".Yii::app()->params['adminEmail']."}\r\n".
                                    "MIME-Version: 1.0\r\n".
                                    "Content-Type: text/plain; charset=UTF-8";

                        mail($usuario->email,$subject,$body,$headers);    
                    }
                    
                }
            }
        }
}
