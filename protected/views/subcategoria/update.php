<?php
/* @var $this SubcategoriaController */
/* @var $model Subcategoria */

$this->breadcrumbs=array(
	'Subcategorias'=>array('index'),
	$model->idsubcategoria=>array('view','id'=>$model->idsubcategoria),
	'Update',
);

$this->menu=array(
	array('label'=>'List Subcategoria', 'url'=>array('index')),
	array('label'=>'Create Subcategoria', 'url'=>array('create')),
	array('label'=>'View Subcategoria', 'url'=>array('view', 'id'=>$model->idsubcategoria)),
	array('label'=>'Manage Subcategoria', 'url'=>array('admin')),
);
?>

<h1>Update Subcategoria <?php echo $model->idsubcategoria; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>