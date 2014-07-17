<?php
/* @var $this CategoriaController */
/* @var $model Categoria */

$this->breadcrumbs=array(
	'Categorias'=>array('index'),
	$model->idcategoria,
);

$this->menu=array(
	array('label'=>'Nueva Categoria', 'url'=>array('create')),
	array('label'=>'Actualizar Categoria', 'url'=>array('update', 'id'=>$model->idcategoria)),
	array('label'=>'Eliminar Categoria', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idcategoria),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Mantenedor Categorias', 'url'=>array('admin')),
);
?>

<h1>View Categoria #<?php echo $model->idcategoria; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idcategoria',
		'nombre',
	),
)); ?>
