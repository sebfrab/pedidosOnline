<?php

/**
 * This is the model class for table "sugerencia_productos".
 *
 * The followings are the available columns in table 'sugerencia_productos':
 * @property string $idsugerencia_productos
 * @property string $producto_idproducto
 * @property string $usuario_idusuario
 * @property string $fecha
 */
class SugerenciaProductos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'sugerencia_productos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('producto_idproducto, usuario_idusuario, fecha', 'required'),
			array('producto_idproducto, usuario_idusuario', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idsugerencia_productos, producto_idproducto, usuario_idusuario, fecha', 'safe', 'on'=>'search'),
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
			'idsugerencia_productos' => 'Idsugerencia Productos',
			'producto_idproducto' => 'Producto Idproducto',
			'usuario_idusuario' => 'Usuario Idusuario',
			'fecha' => 'Fecha',
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

		$criteria->compare('idsugerencia_productos',$this->idsugerencia_productos,true);
		$criteria->compare('producto_idproducto',$this->producto_idproducto,true);
		$criteria->compare('usuario_idusuario',$this->usuario_idusuario,true);
		$criteria->compare('fecha',$this->fecha,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return SugerenciaProductos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
        
        public function getFechaSolicitud()
        {
            return $newDate = date("d-m-Y", strtotime($this->fecha));
        }
        
        public function beforeSave() {
            if ($this->isNewRecord)
                $this->fecha  = date("Y-m-d H:i:s");
            else
                $this->fecha  = date("Y-m-d H:i:s");

            return parent::beforeSave();
        }
}
