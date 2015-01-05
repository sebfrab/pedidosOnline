<?php
/* @var $this SugerenciaProductosController */
/* @var $model SugerenciaProductos */

$this->breadcrumbs=array(
	'Sugerencia Productoses'=>array('index'),
	$model->idsugerencia_productos=>array('view','id'=>$model->idsugerencia_productos),
	'Update',
);

$this->menu=array(
	array('label'=>'List SugerenciaProductos', 'url'=>array('index')),
	array('label'=>'Create SugerenciaProductos', 'url'=>array('create')),
	array('label'=>'View SugerenciaProductos', 'url'=>array('view', 'id'=>$model->idsugerencia_productos)),
	array('label'=>'Manage SugerenciaProductos', 'url'=>array('admin')),
);
?>

<h1>Update SugerenciaProductos <?php echo $model->idsugerencia_productos; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>