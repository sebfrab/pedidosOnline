<?php
/* @var $this HorarioBloqueoController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Horario Bloqueos',
);

$this->menu=array(
	array('label'=>'Create HorarioBloqueo', 'url'=>array('create')),
	array('label'=>'Manage HorarioBloqueo', 'url'=>array('admin')),
);
?>

<h1>Horario Bloqueos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
