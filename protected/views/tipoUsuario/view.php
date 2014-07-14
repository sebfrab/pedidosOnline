<?php
/* @var $this TipoUsuarioController */
/* @var $model TipoUsuario */

$this->breadcrumbs=array(
	'Tipo Usuarios'=>array('index'),
	$model->idtipo_usuario,
);

$this->menu=array(
	array('label'=>'List TipoUsuario', 'url'=>array('index')),
	array('label'=>'Create TipoUsuario', 'url'=>array('create')),
	array('label'=>'Update TipoUsuario', 'url'=>array('update', 'id'=>$model->idtipo_usuario)),
	array('label'=>'Delete TipoUsuario', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idtipo_usuario),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage TipoUsuario', 'url'=>array('admin')),
);
?>

<h1>View TipoUsuario #<?php echo $model->idtipo_usuario; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idtipo_usuario',
		'nombre',
	),
)); ?>
