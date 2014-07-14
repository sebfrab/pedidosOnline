<?php
/* @var $this CarroController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Carros',
);

$this->menu=array(
	array('label'=>'Create Carro', 'url'=>array('create')),
	array('label'=>'Manage Carro', 'url'=>array('admin')),
);
?>

<h1>Carros</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
