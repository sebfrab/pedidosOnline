<?php
/* @var $this PedidoController */
/* @var $data Pedido */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idpedido')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idpedido), array('view', 'id'=>$data->idpedido)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('estado_idestado')); ?>:</b>
	<?php echo CHtml::encode($data->estado_idestado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuario_idusuario')); ?>:</b>
	<?php echo CHtml::encode($data->usuario_idusuario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_entrega')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_entrega); ?>
	<br />


</div>