<?php
/* @var $this CarroController */
/* @var $model Carro */

$this->breadcrumbs=array(
	'Carros'=>array('index'),
	$model->idcarro,
);

$this->menu=array(
	array('label'=>'List Carro', 'url'=>array('index')),
	array('label'=>'Create Carro', 'url'=>array('create')),
	array('label'=>'Update Carro', 'url'=>array('update', 'id'=>$model->idcarro)),
	array('label'=>'Delete Carro', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idcarro),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Carro', 'url'=>array('admin')),
);
?>

<h1>View Carro #<?php echo $model->idcarro; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idcarro',
		'usuario_idusuario',
		'producto_idproducto',
		'fecha',
		'cantidad',
	),
)); ?>
