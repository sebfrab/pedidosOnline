<?php
/* @var $this SubcategoriaController */
/* @var $model Subcategoria */

$this->breadcrumbs=array(
	'Subcategorias'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Mantenedor Subcategoria', 'url'=>array('admin')),
);
?>

<h1>Nueva Subcategoria</h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'url'=>$url)); ?>