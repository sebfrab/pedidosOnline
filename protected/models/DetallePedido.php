<?php

/**
 * This is the model class for table "detalle_pedido".
 *
 * The followings are the available columns in table 'detalle_pedido':
 * @property string $iddetalle_pedido
 * @property string $pedido_idpedido
 * @property string $producto_idproducto
 * @property string $cantidad
 */
class DetallePedido extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'detalle_pedido';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('pedido_idpedido, producto_idproducto', 'required'),
			array('pedido_idpedido', 'length', 'max'=>20),
			array('producto_idproducto, cantidad', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddetalle_pedido, pedido_idpedido, producto_idproducto, cantidad', 'safe', 'on'=>'search'),
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
                    'producto' => array(self::BELONGS_TO,'Producto','producto_idproducto'),
                    'pedido' => array(self::BELONGS_TO,'Pedido','pedido_idpedido'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddetalle_pedido' => '#',
			'pedido_idpedido' => 'Idpedido',
			'producto_idproducto' => 'Idproducto',
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

                $criteria->with=array('producto');
		$criteria->compare('iddetalle_pedido',$this->iddetalle_pedido,true);
		$criteria->compare('pedido_idpedido',$this->pedido_idpedido,true);
		$criteria->compare('producto.nombre',$this->producto_idproducto,true);
		$criteria->compare('t.cantidad',$this->cantidad,true);
                

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return DetallePedido the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
