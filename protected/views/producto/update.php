<?php
/* @var $this ProductoController */
/* @var $model Producto */

$this->breadcrumbs=array(
	'Productos'=>array('index'),
	$model->idproducto=>array('view','id'=>$model->idproducto),
	'Update',
);

$this->menu=array(
	array('label'=>'Nuevo Producto', 'url'=>array('create')),
	array('label'=>'Ver Producto', 'url'=>array('view', 'id'=>$model->idproducto)),
	array('label'=>'Mantenedor Producto', 'url'=>array('admin')),
);
?>

<h1>Actualizar Producto <?php echo $model->idproducto; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>