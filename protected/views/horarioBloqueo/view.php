<?php
/* @var $this HorarioBloqueoController */
/* @var $model HorarioBloqueo */

$this->breadcrumbs=array(
	'Horario Bloqueos'=>array('index'),
	$model->idhorario_bloqueo,
);

$this->menu=array(
	array('label'=>'List HorarioBloqueo', 'url'=>array('index')),
	array('label'=>'Create HorarioBloqueo', 'url'=>array('create')),
	array('label'=>'Update HorarioBloqueo', 'url'=>array('update', 'id'=>$model->idhorario_bloqueo)),
	array('label'=>'Delete HorarioBloqueo', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idhorario_bloqueo),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage HorarioBloqueo', 'url'=>array('admin')),
);
?>

<h1>View HorarioBloqueo #<?php echo $model->idhorario_bloqueo; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idhorario_bloqueo',
		'curso',
		'dia',
		'inicio',
		'fin',
	),
)); ?>
