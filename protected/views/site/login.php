<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

?>

<div class="container">
    
    <div class="row">
        <div class="col-lg-4 col-md-3 col-sm-2"></div>

        <div  class="col-lg-4 col-md-6 col-sm-8 form">
        <h1>Login</h1>
        <?php $form=$this->beginWidget('CActiveForm', array(
                'id'=>'login-form',
                'enableClientValidation'=>true,
                'clientOptions'=>array(
                        'validateOnSubmit'=>true,
                ),
        )); ?>

	<div class="form-group">
		<?php echo $form->labelEx($model,'username',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'username',array('class'=>'form-control')); ?>
		<?php echo $form->error($model,'username',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'password',array('class'=>'control-label')); ?>
		<?php echo $form->passwordField($model,'password',array('class'=>'form-control')); ?>
		<?php echo $form->error($model,'password',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->checkBox($model,'rememberMe'); ?>
		<?php echo $form->label($model,'rememberMe',array('class'=>'control-label')); ?>
		<?php echo $form->error($model,'rememberMe',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton('Iniciar Sesión',array('class'=>'btn btn-info pull-right')); ?>
	</div>

        <?php $this->endWidget(); ?>
        </div>
        
        <div class="col-lg-4 col-md-3 col-sm-2"></div>
 </div>
</div>