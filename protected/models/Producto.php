<?php

/**
 * This is the model class for table "producto".
 *
 * The followings are the available columns in table 'producto':
 * @property string $idproducto
 * @property string $usuario_idusuario_update
 * @property string $estado_idestado
 * @property string $subcategoria_idsubcategoria
 * @property string $nombre
 * @property string $descripcion
 * @property string $marca
 * @property string $talla
 * @property string $precio
 * @property string $cantidad
 * @property string $img
 * @property string $idexterno
 */
class Producto extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'producto';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('estado_idestado, subcategoria_idsubcategoria, nombre, marca, talla, precio, cantidad', 'required'),
			array('estado_idestado, subcategoria_idsubcategoria, usuario_idusuario_update, precio, cantidad', 'length', 'max'=>10),
			array('nombre', 'length', 'max'=>150),
                        array('talla', 'length', 'max'=>25),
			array('marca', 'length', 'max'=>50),
			array('img', 'length', 'max'=>350),
                        array('idexterno', 'length', 'max'=>150),
			array('descripcion', 'safe'),
                        array('idproducto', 'required'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idproducto, estado_idestado, subcategoria_idsubcategoria, nombre, descripcion, marca, talla, precio, cantidad, img, idexterno', 'safe', 'on'=>'search'),
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
                    'subcategoria' => array(self::BELONGS_TO,'Subcategoria','subcategoria_idsubcategoria'),
                    'estado' => array(self::BELONGS_TO,'Estado','estado_idestado'),
                    'detallePedido' => array(self::HAS_MANY,'DetallePedido','producto_idproducto'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idproducto' => 'Idproducto',
			'estado_idestado' => 'Estado Idestado',
			'subcategoria_idsubcategoria' => 'Subcategoria',
			'nombre' => 'Nombre',
			'descripcion' => 'Descripcion',
			'marca' => 'Marca',
			'talla' => 'Talla',
			'precio' => 'Precio',
			'cantidad' => 'Stock',
			'img' => 'Img',
                        'idexterno' => 'ID externo',
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
                
		$criteria->compare('idproducto',$this->idproducto,true);
		$criteria->compare('estado_idestado',$this->estado_idestado,true);
                
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('descripcion',$this->descripcion,true);
		$criteria->compare('marca',$this->marca,true);
		$criteria->compare('talla',$this->talla,true);
		$criteria->compare('precio',$this->precio,true);
		$criteria->compare('cantidad',$this->cantidad,true);
                $criteria->compare('idexterno',$this->idexterno,true);
                
                if($this->subcategoria_idsubcategoria!=null)
                    $criteria->addCondition('subcategoria_idsubcategoria = '.$this->subcategoria_idsubcategoria);
                
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
                        'pagination' => array(
                            'pageSize' => 40,
                        ),
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Producto the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
        
        public static function stock($id){
            return Producto::model()->findByPk($id);
        }
        
        protected function afterSave() {
            parent::afterSave();
            if (!$this->isNewRecord) {
                if($this->estado_idestado==0){
                    $criteria = new CDbCriteria;  
                    $criteria->addCondition('producto_idproducto = '.$this->idproducto);
                    $carro = Carro::model()->find($criteria);
                    if($carro)
                        $carro->delete();
                }
            }
        }
        
        protected function beforeSave(){
            //if (!$this->isNewRecord)
            //    $this->usuario_idusuario_update = Yii::app()->user->id;

            return parent::beforeSave();
        }


        function beforeDelete(){
            if( $this->detallePedido !== array() )
                return false;
            return parent::beforeDelete();
        }
        
        public function imagen(){
            if($this->img){
                return Yii::app()->request->baseUrl."/images/productos/$this->img";
            }else{
                return Yii::app()->request->baseUrl."/images/image-not-found.jpg";
            }
        }
        
        public function imagenThumbs(){
            if($this->img){
                return Yii::app()->request->baseUrl."/images/productos/thumbs/$this->img";
            }else{
                return Yii::app()->request->baseUrl."/images/image-not-found.jpg";
            }
        }
        
        
        public static function saveWeb($productos){
            $errores = "";
            foreach ($productos as $producto){
                $update = false;
                $idproducto = 0;
                $cantidad = 0;
                $model= Producto::model()->findByPk($producto["idproducto"]);
                if(empty($model)){
                    $model =  new Producto();
                    $model->idproducto = $producto["idproducto"];
                    $model->subcategoria_idsubcategoria = 1;
                    $model->usuario_idusuario_update = 1;
                    $model->estado_idestado = 1;
                    $model->cantidad = $producto["cantidad"];
                    $model->precio = $producto["precio"];
                }else{
                    $update = true;
                    $cantidad = $producto["cantidad"];
                    $idproducto = $producto["idproducto"];
                    $model->precio = $producto["precio"];
                }

                if(empty($producto["idexterno"])){
                    $model->idexterno = 0;
                }else{
                    $model->idexterno = $producto["idexterno"];
                }   
                
                if(empty($producto["marca"])){
                    $model->marca = "Sin Marca";
                }else{
                    $model->marca = $producto["marca"];
                }
                
                if(empty($producto["talla"])){
                    $model->talla = "Sin Talla";
                }else{
                    $model->talla = $producto["talla"];
                }
                
                $model->nombre = $producto["nombre"];

                try{
                    if(!$model->save()){
                        foreach($model->errors as $error){
                            $er = new Error('99999', $model->idproducto, 'producto', $error[0]);
                            $errores[] = $er;
                        }
                    }
                        if($update){
                            $connection=Yii::app()->db;
                            $sql = "UPDATE `producto` SET producto.talla = '".$model->talla."', producto.cantidad = (".$cantidad." -(select ifnull(sum(detalle_pedido.cantidad),0) from detalle_pedido inner join pedido ON detalle_pedido.pedido_idpedido=pedido.idpedido and pedido.estado_idestado IN (2,3) and detalle_pedido.producto_idproducto=".$idproducto.")) where producto.idproducto=".$idproducto.";";
                            $command = $connection->createCommand($sql);
                            $command->execute();
                        }
                        
                    
                } catch (CDbException $e){
                    $er = new Error($e->errorInfo[1], $model->idproducto, 'producto', $e->errorInfo[2]);
                    $errores[] = $er;
                } 
            }
            
            return $errores;
        }
}
