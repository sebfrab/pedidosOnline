<?php

/**
 * This is the model class for table "horario_bloqueo".
 *
 * The followings are the available columns in table 'horario_bloqueo':
 * @property string $idhorario_bloqueo
 * @property string $curso
 * @property string $dia
 * @property string $inicio
 * @property string $fin
 */
class HorarioBloqueo extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'horario_bloqueo';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('curso, dia, inicio, fin', 'required'),
			array('curso, dia', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idhorario_bloqueo, curso, dia, inicio, fin', 'safe', 'on'=>'search'),
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
			'idhorario_bloqueo' => 'Idhorario Bloqueo',
			'curso' => 'Curso',
			'dia' => 'Dia',
			'inicio' => 'Inicio',
			'fin' => 'Fin',
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

		$criteria->compare('idhorario_bloqueo',$this->idhorario_bloqueo,true);
		$criteria->compare('curso',$this->curso,true);
		$criteria->compare('dia',$this->dia,true);
		$criteria->compare('inicio',$this->inicio,true);
		$criteria->compare('fin',$this->fin,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return HorarioBloqueo the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
