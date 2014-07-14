<?php
/* @var $this PedidoController */
/* @var $model Pedido */

$this->breadcrumbs=array(
	'Pedidos'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Mantenedor Pedido', 'url'=>array('admin')),
);
?>

<h1>Nuevo Pedido</h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>