<?php

/**
 * This is the model class for table "carro".
 *
 * The followings are the available columns in table 'carro':
 * @property string $idcarro
 * @property string $usuario_idusuario
 * @property string $producto_idproducto
 * @property string $fecha
 * @property string $cantidad
 */
class Carro extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'carro';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('usuario_idusuario, producto_idproducto, fecha, cantidad', 'required'),
			array('usuario_idusuario, producto_idproducto, cantidad', 'length', 'max'=>10),
                        array('cantidad', 'numerical', 'integerOnly'=>true),
                        array('cantidad', 'stock'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idcarro, usuario_idusuario, producto_idproducto, fecha, cantidad', 'safe', 'on'=>'search'),
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
                    'producto' => array(self::BELONGS_TO,'Producto','producto_idproducto'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idcarro' => 'Idcarro',
			'usuario_idusuario' => 'Usuario Idusuario',
			'producto_idproducto' => 'Producto Idproducto',
			'fecha' => 'Fecha',
			'cantidad' => 'Cantidad',
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

		$criteria->compare('idcarro',$this->idcarro,true);
		$criteria->compare('usuario_idusuario',$this->usuario_idusuario,true);
		$criteria->compare('producto_idproducto',$this->producto_idproducto,true);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('cantidad',$this->cantidad,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Carro the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
        
        public static function countCarro(){
            $Criteria = new CDbCriteria();
            $Criteria->condition = "usuario_idusuario = ".Yii::app()->user->id;
            return Carro::model()->count($Criteria);
        }
        
        public static function CarroUser(){
            $Criteria = new CDbCriteria();
            $Criteria->condition = "usuario_idusuario = ".Yii::app()->user->id;
            return Carro::model()->findAll($Criteria);
        }
        
        public function stock($attribute, $params) {
            if($this->cantidad<1){
                $this->addError('cantidad', 'Cantidad mayor a 0');
            }else{
                $model = Producto::model()->findByPk($this->producto_idproducto);
                if($this->cantidad > $model->cantidad){
                    $this->addError('cantidad', 'stock insuficiente');
                }
            }   
        }
        
        /*public function beforeSave(){
            if(parent::beforeSave()){
                if($this->isNewRecord){
                    $criteria = new CDbCriteria;  
                    $criteria->addCondition('usuario_idusuario = '.Yii::app()->user->id);
                    $criteria->addCondition('producto_idproducto = '.$this->producto_idproducto);
                    $model = Carro::model()->find($criteria);

                    if($model){
                        $this->idcarro = $model->idcarro;
                        $this->cantidad += $model->cantidad;
                    }
                }
                return true;
            }
            return false;
        }*/
}
