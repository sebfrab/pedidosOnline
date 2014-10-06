<?php
/* @var $this SugerenciaController */
/* @var $model Sugerencia */


?>

<h1>Ver Sugerencia #<?php echo $model->idsugerencia; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idsugerencia',
		'usuario.NombreCompleto',
		'comentario',
		'FechaSugerencia',
	),
)); ?>
