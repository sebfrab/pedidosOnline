<?php
$this->menu=array(
	array('label'=>'Mantenedor Producto', 'url'=>array('admin')),
);
?>

<h1>Nuevo Producto</h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>