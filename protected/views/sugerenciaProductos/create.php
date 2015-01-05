<?php
/* @var $this SugerenciaProductosController */
/* @var $model SugerenciaProductos */

$this->breadcrumbs=array(
	'Sugerencia Productoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List SugerenciaProductos', 'url'=>array('index')),
	array('label'=>'Manage SugerenciaProductos', 'url'=>array('admin')),
);
?>

<h1>Create SugerenciaProductos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>