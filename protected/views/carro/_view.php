<?php
/* @var $this CarroController */
/* @var $data Carro */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idcarro')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idcarro), array('view', 'id'=>$data->idcarro)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuario_idusuario')); ?>:</b>
	<?php echo CHtml::encode($data->usuario_idusuario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('producto_idproducto')); ?>:</b>
	<?php echo CHtml::encode($data->producto_idproducto); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha')); ?>:</b>
	<?php echo CHtml::encode($data->fecha); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cantidad')); ?>:</b>
	<?php echo CHtml::encode($data->cantidad); ?>
	<br />


</div>