<?php
/* @var $this SubcategoriaController */
/* @var $model Subcategoria */

$this->breadcrumbs=array(
	'Subcategorias'=>array('index'),
	$model->idsubcategoria,
);

$this->menu=array(
	array('label'=>'List Subcategoria', 'url'=>array('index')),
	array('label'=>'Create Subcategoria', 'url'=>array('create')),
	array('label'=>'Update Subcategoria', 'url'=>array('update', 'id'=>$model->idsubcategoria)),
	array('label'=>'Delete Subcategoria', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idsubcategoria),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Subcategoria', 'url'=>array('admin')),
);
?>

<h1>View Subcategoria #<?php echo $model->idsubcategoria; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idsubcategoria',
		'categoria_idcategoria',
		'nombre',
	),
)); ?>
