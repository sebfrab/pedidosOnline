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
 */
class Pedido extends CActiveRecord
{
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
			array('fecha_entrega', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idpedido, estado_idestado, usuario_idusuario, fecha_pedido, fecha_entrega', 'safe', 'on'=>'search'),
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
                    'detalleCount' => array(self::STAT, 'DetallePedido', 'pedido_idpedido'),
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
                    $criteria->compare('usuario.username',$this->usuario->username,true);
                    $criteria->compare('estado.idestado',$this->estado_idestado,true);
                    $criteria->compare('usuario.nombres',$this->usuario_idusuario,true);
                    $criteria->compare('fecha_pedido',$this->fecha_pedido,true);
                }else{
                    $criteria->compare('idpedido',$this->idpedido,true);
                    $criteria->compare('usuario.username',$this->usuario->username,true);
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
        
        protected function afterSave() {
            parent::afterSave();
            if (!$this->isNewRecord) {
                if($this->idpedido==3){
                    $usuario = Usuario::model()->findByPk(Yii::app()->user->id);
                    $model=new ContactForm;
                    
                    $model->email = $usuario->email;
                    $model->name = $usuario->nombreCompleto;
                    $model->subject = "Retiro de productos";
                    $model->body = "Pedido #$this->idpedido de encuentra listo para ser retirado";
                    
                    if($model->validate()){
                        $name='=?UTF-8?B?'.base64_encode($model->name).'?=';
			$subject='=?UTF-8?B?'.base64_encode($model->subject).'?=';
			$headers="From: $name <{$model->email}>\r\n".
					"Reply-To: {$model->email}\r\n".
					"MIME-Version: 1.0\r\n".
					"Content-Type: text/plain; charset=UTF-8";

			mail(Yii::app()->params['adminEmail'],$subject,$model->body,$headers);
                    }  
                }
            }
        }
}
