<?php
/* @var $this HorarioBloqueoController */
/* @var $model HorarioBloqueo */

$this->breadcrumbs=array(
	'Horario Bloqueos'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List HorarioBloqueo', 'url'=>array('index')),
	array('label'=>'Manage HorarioBloqueo', 'url'=>array('admin')),
);
?>

<h1>Create HorarioBloqueo</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>