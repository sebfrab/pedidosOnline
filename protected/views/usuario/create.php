<?php
/* @var $this UsuarioController */
/* @var $model Usuario */

$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Mantenedor Usuario', 'url'=>array('admin')),
);
?>

<h1>Nuevo Usuario</h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>