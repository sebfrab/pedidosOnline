<?php
/* @var $this SubcategoriaController */
/* @var $model Subcategoria */

$this->breadcrumbs=array(
	'Subcategorias'=>array('index'),
	$model->idsubcategoria,
);

$this->menu=array(
	array('label'=>'Nueva Subcategoria', 'url'=>array('create')),
	array('label'=>'Actualizar Subcategoria', 'url'=>array('update', 'id'=>$model->idsubcategoria)),
	array('label'=>'Eliminar Subcategoria', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idsubcategoria),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Mantenedor Subcategoria', 'url'=>array('admin')),
);
?>

<h1>Ver Subcategoria #<?php echo $model->idsubcategoria; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idsubcategoria',
		'categoria_idcategoria',
		'nombre',
	),
)); ?>
