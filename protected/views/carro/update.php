<?php
/* @var $this CarroController */
/* @var $model Carro */

$this->breadcrumbs=array(
	'Carros'=>array('index'),
	$model->idcarro=>array('view','id'=>$model->idcarro),
	'Update',
);

$this->menu=array(
	array('label'=>'List Carro', 'url'=>array('index')),
	array('label'=>'Create Carro', 'url'=>array('create')),
	array('label'=>'View Carro', 'url'=>array('view', 'id'=>$model->idcarro)),
	array('label'=>'Manage Carro', 'url'=>array('admin')),
);
?>

<h1>Update Carro <?php echo $model->idcarro; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>