<?php
/* @var $this SubcategoriaController */
/* @var $model Subcategoria */

$this->breadcrumbs=array(
	'Subcategorias'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Subcategoria', 'url'=>array('index')),
	array('label'=>'Manage Subcategoria', 'url'=>array('admin')),
);
?>

<h1>Create Subcategoria</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>