<?php
/* @var $this SubcategoriaController */
/* @var $data Subcategoria */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idsubcategoria')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idsubcategoria), array('view', 'id'=>$data->idsubcategoria)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('categoria_idcategoria')); ?>:</b>
	<?php echo CHtml::encode($data->categoria_idcategoria); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />


</div>