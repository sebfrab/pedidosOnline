<?php
/* @var $this DetallePedidoController */
/* @var $data DetallePedido */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('iddetalle_pedido')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->iddetalle_pedido), array('view', 'id'=>$data->iddetalle_pedido)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pedido_idpedido')); ?>:</b>
	<?php echo CHtml::encode($data->pedido_idpedido); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('producto_idproducto')); ?>:</b>
	<?php echo CHtml::encode($data->producto_idproducto); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cantidad')); ?>:</b>
	<?php echo CHtml::encode($data->cantidad); ?>
	<br />


</div>