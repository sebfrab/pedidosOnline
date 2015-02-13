<?php
/* @var $this HorarioBloqueoController */
/* @var $model HorarioBloqueo */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'horario-bloqueo-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<div class="form-group">
		<?php echo $form->labelEx($model,'curso',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'curso',array('size'=>10,'maxlength'=>10, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'curso',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'dia',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'dia',array('size'=>10,'maxlength'=>10, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'dia',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'inicio',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'inicio',array('class'=>'form-control')) ?>
		<?php echo $form->error($model,'inicio',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'fin',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'fin',array('class'=>'form-control')) ?>
		<?php echo $form->error($model,'fin',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->