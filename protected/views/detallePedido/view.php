<?php
/* @var $this DetallePedidoController */
/* @var $model DetallePedido */

$this->breadcrumbs=array(
	'Detalle Pedidos'=>array('index'),
	$model->iddetalle_pedido,
);

$this->menu=array(
	array('label'=>'Nuevo Detalle Pedido', 'url'=>array('create')),
	array('label'=>'Actualizar Detalle Pedido', 'url'=>array('update', 'id'=>$model->iddetalle_pedido)),
	array('label'=>'Eliminar Detalle Pedido', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->iddetalle_pedido),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Mantenedor DetallePedido', 'url'=>array('admin')),
);
?>

<h1>View DetallePedido #<?php echo $model->iddetalle_pedido; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'iddetalle_pedido',
		'pedido_idpedido',
		'producto_idproducto',
		'cantidad',
	),
)); ?>
