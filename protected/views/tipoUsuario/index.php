<?php
/* @var $this TipoUsuarioController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Tipo Usuarios',
);

$this->menu=array(
	array('label'=>'Create TipoUsuario', 'url'=>array('create')),
	array('label'=>'Manage TipoUsuario', 'url'=>array('admin')),
);
?>

<h1>Tipo Usuarios</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
