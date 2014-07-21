<h1>Cambio de Contraseña</h1>

<div id="statusMsg">
<?php if(Yii::app()->user->hasFlash('success')):?>
    <div style="margin-top: 20px;" class="flash-success col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php echo Yii::app()->user->getFlash('success'); ?>
    </div>
<?php endif; ?>
 
<?php if(Yii::app()->user->hasFlash('error')):?>
    <div style="margin-top: 20px;" class="flash-error col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php echo Yii::app()->user->getFlash('error'); ?>
    </div>
<?php endif; ?>
</div>

<div class="form">
<?php $form=$this->beginWidget('CActiveForm', array(
        'id'=>'chnage-password-form',
	'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
        ),
)); ?> 
 
  <div class="form-group">
      <?php echo $form->labelEx($model,'old_password',array('class'=>'control-label')); ?>
      <?php echo $form->passwordField($model,'old_password',array('class'=>'form-control')) ?>
      <?php echo $form->error($model,'old_password',array('class'=>'alert alert-danger')); ?>
  </div>
 
  <div class="form-group">
      <?php echo $form->labelEx($model,'new_password',array('class'=>'control-label')); ?>
      <?php echo $form->passwordField($model,'new_password',array('class'=>'form-control')) ?>
      <?php echo $form->error($model,'new_password',array('class'=>'alert alert-danger')); ?>
  </div>
 
  <div class="form-group">
      <?php echo $form->labelEx($model,'repeat_password',array('class'=>'control-label')); ?>
      <?php echo $form->passwordField($model,'repeat_password',array('class'=>'form-control')) ?>
      <?php echo $form->error($model,'repeat_password',array('class'=>'alert alert-danger')); ?>
  </div>
    
  <div class="form-group">
    <?php echo CHtml::submitButton('Cambiar Contraseña',array('class'=>'btn btn-primary')); ?>
  </div>

  <?php $this->endWidget(); ?>
</div>