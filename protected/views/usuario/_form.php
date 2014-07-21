<?php
/* @var $this UsuarioController */
/* @var $model Usuario */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'usuario-form',
	'enableAjaxValidation'=>false,
        'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
            'afterValidate' => 'js:function(form, data, hasError) {
                if (!hasError){
                    str = $("#usuario-form").serialize() + "&ajax=usuario-form";
                    $.ajax({
                        type: "POST",
                        url: "' . Yii::app()->createUrl($url) . '",
                        data: str,
                        dataType: "json",
                        beforeSend : function() {
                            $("#usuario-form").attr("disabled",true);
                        },
                        success: function(data, status) {
                            if(data.insert)
                            {
                                window.location = data.redirectUrl;
                            }
                            else
                            {
                                $.each(data, function(key, value) {
                                    var div = "#"+key+"_em_";
                                    $(div).text(value);
                                    $(div).show();
                                });
                                $("#usuario-form").attr("disabled",false);
                            }
                        },
                    });
                    return false;
                }
            }',
        ),
)); ?>

	<div class="form-group">
		<?php echo $form->labelEx($model,'username',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'username',array('size'=>50,'maxlength'=>50, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'username',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'nombres',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'nombres',array('size'=>50,'maxlength'=>50, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'nombres',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'apellidos',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'apellidos',array('size'=>50,'maxlength'=>50, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'apellidos',array('class'=>'alert alert-danger')); ?>
	</div>
    
        <div class="form-group">
		<?php echo $form->labelEx($model,'password_2',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'password_2',array('size'=>50,'maxlength'=>100, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'password_2',array('class'=>'alert alert-danger')); ?>
	</div>
    
        <div class="form-group">
		<?php echo $form->labelEx($model,'email',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'email',array('size'=>50,'maxlength'=>150, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'email',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'sexo',array('class'=>'control-label')); ?>
		<?php echo $form->dropDownList($model, 'sexo', Usuario::model()->getGenero(), array('empty'=>'Seleccione estado', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'sexo',array('class'=>'alert alert-danger')); ?>
	</div>
    
        <div class="form-group">
		<?php echo $form->labelEx($model,'tipo_usuario_idtipo_usuario',array('class'=>'control-label')); ?>
		<?php echo $form->dropDownList($model, 'tipo_usuario_idtipo_usuario', TipoUsuario::model()->getListTipos(), array('empty'=>'Seleccione tipo', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'tipo_usuario_idtipo_usuario',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'estado_idestado',array('class'=>'control-label')); ?>
                <?php echo $form->dropDownList($model, 'estado_idestado', Estado::model()->getListEstadosBool(), array('empty'=>'Seleccione estado', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'estado_idestado',array('class'=>'alert alert-danger')); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->

<br/>
<p>
    <b>Clave por defecto:</b> 
    239065c4aa235b54edfbe23be799786d
</p>