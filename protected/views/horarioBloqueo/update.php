<?php
/* @var $this HorarioBloqueoController */
/* @var $model HorarioBloqueo */

$this->breadcrumbs=array(
	'Horario Bloqueos'=>array('index'),
	$model->idhorario_bloqueo=>array('view','id'=>$model->idhorario_bloqueo),
	'Update',
);

$this->menu=array(
	array('label'=>'List HorarioBloqueo', 'url'=>array('index')),
	array('label'=>'Create HorarioBloqueo', 'url'=>array('create')),
	array('label'=>'View HorarioBloqueo', 'url'=>array('view', 'id'=>$model->idhorario_bloqueo)),
	array('label'=>'Manage HorarioBloqueo', 'url'=>array('admin')),
);
?>

<h1>Update HorarioBloqueo <?php echo $model->idhorario_bloqueo; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>