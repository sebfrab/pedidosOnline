<?php
/* @var $this CategoriaController */
/* @var $model Categoria */

$this->breadcrumbs=array(
	'Categorias'=>array('index'),
	$model->idcategoria,
);

$this->menu=array(
	array('label'=>'List Categoria', 'url'=>array('index')),
	array('label'=>'Create Categoria', 'url'=>array('create')),
	array('label'=>'Update Categoria', 'url'=>array('update', 'id'=>$model->idcategoria)),
	array('label'=>'Delete Categoria', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idcategoria),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Categoria', 'url'=>array('admin')),
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
