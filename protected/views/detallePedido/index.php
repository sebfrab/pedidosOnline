<?php
/* @var $this DetallePedidoController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Detalle Pedidos',
);

$this->menu=array(
	array('label'=>'Create DetallePedido', 'url'=>array('create')),
	array('label'=>'Manage DetallePedido', 'url'=>array('admin')),
);
?>

<h1>Detalle Pedidos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
