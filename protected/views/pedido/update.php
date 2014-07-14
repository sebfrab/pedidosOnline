<?php
/* @var $this PedidoController */
/* @var $model Pedido */

$this->breadcrumbs=array(
	'Pedidos'=>array('index'),
	$model->idpedido=>array('view','id'=>$model->idpedido),
	'Update',
);

$this->menu=array(
	array('label'=>'Nuevo Pedido', 'url'=>array('create')),
	array('label'=>'Ver Pedido', 'url'=>array('view', 'id'=>$model->idpedido)),
	array('label'=>'Mantenedor Pedidos', 'url'=>array('admin')),
);
?>

<h1>Actualizar Pedido <?php echo $model->idpedido; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>