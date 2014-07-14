<?php

/**
 * This is the model class for table "estado".
 *
 * The followings are the available columns in table 'estado':
 * @property string $idestado
 * @property string $nombre
 * @property string $abreviatura
 */
class Estado extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'estado';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, abreviatura', 'required'),
			array('nombre', 'length', 'max'=>50),
			array('abreviatura', 'length', 'max'=>15),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idestado, nombre, abreviatura', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idestado' => 'Idestado',
			'nombre' => 'Nombre',
			'abreviatura' => 'Abreviatura',
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

		$criteria->compare('idestado',$this->idestado,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('abreviatura',$this->abreviatura,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Estado the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
        
        public static function getListEstadosPedido(){
            $criteria = new CDbCriteria;  
            $criteria->addCondition('idestado IN (2, 3, 4)');
            return CHtml::listData(Estado::model()->findAll($criteria),'idestado','nombre');
        }
        
        public static function getListEstadosBool(){
            $criteria = new CDbCriteria;  
            $criteria->addCondition('idestado IN (0, 1)');
            return CHtml::listData(Estado::model()->findAll($criteria),'idestado','nombre');
        }
}
