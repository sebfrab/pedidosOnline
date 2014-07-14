<?php
/* @var $this DetallePedidoController */
/* @var $model DetallePedido */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'detalle-pedido-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<div class="form-group">
		<?php echo $form->labelEx($model,'pedido_idpedido',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'pedido_idpedido',array('size'=>20,'maxlength'=>20, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'pedido_idpedido',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'producto_idproducto',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'producto_idproducto',array('size'=>10,'maxlength'=>10, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'producto_idproducto',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'cantidad',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'cantidad',array('size'=>10,'maxlength'=>10, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'cantidad',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->