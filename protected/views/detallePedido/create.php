<?php

$this->menu=array(
	array('label'=>'Mantenedor Detalle Pedido', 'url'=>array('admin')),
);
?>

<h1>Create DetallePedido</h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>