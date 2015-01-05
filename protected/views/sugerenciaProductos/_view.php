<?php
/* @var $this SugerenciaProductosController */
/* @var $data SugerenciaProductos */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idsugerencia_productos')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idsugerencia_productos), array('view', 'id'=>$data->idsugerencia_productos)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('producto_idproducto')); ?>:</b>
	<?php echo CHtml::encode($data->producto_idproducto); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuario_idusuario')); ?>:</b>
	<?php echo CHtml::encode($data->usuario_idusuario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha')); ?>:</b>
	<?php echo CHtml::encode($data->fecha); ?>
	<br />


</div>