<?php
/* @var $this DetallePedidoController */
/* @var $model DetallePedido */

$this->breadcrumbs=array(
	'Detalle Pedidos'=>array('index'),
	$model->iddetalle_pedido=>array('view','id'=>$model->iddetalle_pedido),
	'Update',
);

$this->menu=array(
	array('label'=>'Nuevo Detalle Pedido', 'url'=>array('create')),
	array('label'=>'Ver Detalle Pedido', 'url'=>array('view', 'id'=>$model->iddetalle_pedido)),
	array('label'=>'Mantenedor Detalle Pedido', 'url'=>array('admin')),
);
?>

<h1>Update DetallePedido <?php echo $model->iddetalle_pedido; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>