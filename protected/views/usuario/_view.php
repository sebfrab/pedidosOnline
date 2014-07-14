<?php
/* @var $this UsuarioController */
/* @var $data Usuario */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idusuario')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idusuario), array('view', 'id'=>$data->idusuario)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo_usuario_idtipo_usuario')); ?>:</b>
	<?php echo CHtml::encode($data->tipo_usuario_idtipo_usuario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('estado_idestado')); ?>:</b>
	<?php echo CHtml::encode($data->estado_idestado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('username')); ?>:</b>
	<?php echo CHtml::encode($data->username); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('password_2')); ?>:</b>
	<?php echo CHtml::encode($data->password_2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombres')); ?>:</b>
	<?php echo CHtml::encode($data->nombres); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('apellidos')); ?>:</b>
	<?php echo CHtml::encode($data->apellidos); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('sexo')); ?>:</b>
	<?php echo CHtml::encode($data->sexo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('last_login')); ?>:</b>
	<?php echo CHtml::encode($data->last_login); ?>
	<br />

	*/ ?>

</div>