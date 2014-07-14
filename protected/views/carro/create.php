<?php
/* @var $this CarroController */
/* @var $model Carro */

$this->breadcrumbs=array(
	'Carros'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Carro', 'url'=>array('index')),
	array('label'=>'Manage Carro', 'url'=>array('admin')),
);
?>

<h1>Create Carro</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>