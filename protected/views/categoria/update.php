<?php
/* @var $this CategoriaController */
/* @var $model Categoria */

$this->breadcrumbs=array(
	'Categorias'=>array('index'),
	$model->idcategoria=>array('view','id'=>$model->idcategoria),
	'Update',
);

$this->menu=array(
	array('label'=>'Nueva Categoria', 'url'=>array('create')),
	array('label'=>'Ver Categoria', 'url'=>array('view', 'id'=>$model->idcategoria)),
	array('label'=>'Mantenedor Categorias', 'url'=>array('admin')),
);
?>

<h1>Actualizar Categoria <?php echo $model->idcategoria; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>