<?php
/* @var $this SugerenciaProductosController */
/* @var $model SugerenciaProductos */

$this->breadcrumbs=array(
	'Sugerencia Productoses'=>array('index'),
	$model->idsugerencia_productos,
);

$this->menu=array(
	array('label'=>'List SugerenciaProductos', 'url'=>array('index')),
	array('label'=>'Create SugerenciaProductos', 'url'=>array('create')),
	array('label'=>'Update SugerenciaProductos', 'url'=>array('update', 'id'=>$model->idsugerencia_productos)),
	array('label'=>'Delete SugerenciaProductos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idsugerencia_productos),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage SugerenciaProductos', 'url'=>array('admin')),
);
?>

<h1>View SugerenciaProductos #<?php echo $model->idsugerencia_productos; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idsugerencia_productos',
		'producto_idproducto',
		'usuario_idusuario',
		'fecha',
	),
)); ?>
