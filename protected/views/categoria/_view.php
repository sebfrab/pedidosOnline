<?php
/* @var $this CategoriaController */
/* @var $data Categoria */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idcategoria')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idcategoria), array('view', 'id'=>$data->idcategoria)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />


</div>