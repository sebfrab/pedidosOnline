<?php
/* @var $this SugerenciaProductosController */
/* @var $model SugerenciaProductos */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'sugerencia-productos-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'producto_idproducto'); ?>
		<?php echo $form->textField($model,'producto_idproducto',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'producto_idproducto'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'usuario_idusuario'); ?>
		<?php echo $form->textField($model,'usuario_idusuario',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'usuario_idusuario'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha'); ?>
		<?php echo $form->textField($model,'fecha'); ?>
		<?php echo $form->error($model,'fecha'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->