<?php
/* @var $this SugerenciaController */
/* @var $model Sugerencia */

$this->breadcrumbs=array(
	'Sugerencias'=>array('index'),
	$model->idsugerencia=>array('view','id'=>$model->idsugerencia),
	'Update',
);

$this->menu=array(
	array('label'=>'List Sugerencia', 'url'=>array('index')),
	array('label'=>'Create Sugerencia', 'url'=>array('create')),
	array('label'=>'View Sugerencia', 'url'=>array('view', 'id'=>$model->idsugerencia)),
	array('label'=>'Manage Sugerencia', 'url'=>array('admin')),
);
?>

<h1>Update Sugerencia <?php echo $model->idsugerencia; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>