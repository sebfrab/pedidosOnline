<?php
/* @var $this HorarioBloqueoController */
/* @var $data HorarioBloqueo */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idhorario_bloqueo')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idhorario_bloqueo), array('view', 'id'=>$data->idhorario_bloqueo)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('curso')); ?>:</b>
	<?php echo CHtml::encode($data->curso); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('dia')); ?>:</b>
	<?php echo CHtml::encode($data->dia); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('inicio')); ?>:</b>
	<?php echo CHtml::encode($data->inicio); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fin')); ?>:</b>
	<?php echo CHtml::encode($data->fin); ?>
	<br />


</div>