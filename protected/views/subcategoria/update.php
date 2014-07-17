<?php
/* @var $this SubcategoriaController */
/* @var $model Subcategoria */

$this->breadcrumbs=array(
	'Subcategorias'=>array('index'),
	$model->idsubcategoria=>array('view','id'=>$model->idsubcategoria),
	'Update',
);

$this->menu=array(
	array('label'=>'Nueva Subcategoria', 'url'=>array('create')),
	array('label'=>'Ver Subcategoria', 'url'=>array('view', 'id'=>$model->idsubcategoria)),
	array('label'=>'Mantenedor Subcategoria', 'url'=>array('admin')),
);
?>

<h1>Actualizar Subcategoria <?php echo $model->idsubcategoria; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>