<?php
/* @var $this TipoUsuarioController */
/* @var $model TipoUsuario */

$this->breadcrumbs=array(
	'Tipo Usuarios'=>array('index'),
	$model->idtipo_usuario=>array('view','id'=>$model->idtipo_usuario),
	'Update',
);

$this->menu=array(
	array('label'=>'Nuevo Tipo de Usuario', 'url'=>array('create')),
	array('label'=>'Ver Tipo de Usuario', 'url'=>array('view', 'id'=>$model->idtipo_usuario)),
	array('label'=>'Mantenedor Tipo de Usuario', 'url'=>array('admin')),
);
?>

<h1>Actualizar Tipo de Usuario <?php echo $model->idtipo_usuario; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>