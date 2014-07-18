<?php
/* @var $this TipoUsuarioController */
/* @var $model TipoUsuario */

$this->breadcrumbs=array(
	'Tipo Usuarios'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Mantenedor Tipo de Usuario', 'url'=>array('admin')),
);
?>

<h1>Nuevo Tipo de Usuario</h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>