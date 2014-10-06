<?php
/* @var $this SugerenciaController */
/* @var $data Sugerencia */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idsugerencia')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idsugerencia), array('view', 'id'=>$data->idsugerencia)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuario_idusuario')); ?>:</b>
	<?php echo CHtml::encode($data->usuario_idusuario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('comentario')); ?>:</b>
	<?php echo CHtml::encode($data->comentario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha')); ?>:</b>
	<?php echo CHtml::encode($data->fecha); ?>
	<br />


</div>