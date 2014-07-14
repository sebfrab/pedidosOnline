<?php
/* @var $this SubcategoriaController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Subcategorias',
);

$this->menu=array(
	array('label'=>'Create Subcategoria', 'url'=>array('create')),
	array('label'=>'Manage Subcategoria', 'url'=>array('admin')),
);
?>

<h1>Subcategorias</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
