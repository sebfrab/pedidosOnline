<?php
/* @var $this SugerenciaProductosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Sugerencia Productoses',
);

$this->menu=array(
	array('label'=>'Create SugerenciaProductos', 'url'=>array('create')),
	array('label'=>'Manage SugerenciaProductos', 'url'=>array('admin')),
);
?>

<h1>Sugerencia Productoses</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
