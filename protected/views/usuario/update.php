<?php
/* @var $this UsuarioController */
/* @var $model Usuario */

$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	$model->idusuario=>array('view','id'=>$model->idusuario),
	'Update',
);

$this->menu=array(
	array('label'=>'Nuevo Usuario', 'url'=>array('create')),
	array('label'=>'Ver Usuario', 'url'=>array('view', 'id'=>$model->idusuario)),
	array('label'=>'Mantenedor Usuario', 'url'=>array('admin')),
);
?>

<h1>actualizar Usuario <?php echo $model->idusuario; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>