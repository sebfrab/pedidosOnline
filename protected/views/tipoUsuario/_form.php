<?php
/* @var $this TipoUsuarioController */
/* @var $model TipoUsuario */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'tipo-usuario-form',
	'enableAjaxValidation'=>false,
        'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
            'afterValidate' => 'js:function(form, data, hasError) {
                if (!hasError){
                    str = $("#tipo-usuario-form").serialize() + "&ajax=tipo-usuario-form";
                    $.ajax({
                        type: "POST",
                        url: "' . Yii::app()->createUrl($url) . '",
                        data: str,
                        dataType: "json",
                        beforeSend : function() {
                            $("#tipo-usuario-form").attr("disabled",true);
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
                                $("#tipo-usuario-form").attr("disabled",false);
                            }
                        },
                    });
                    return false;
                }
            }',
        ),
)); ?>

	<div class="form-group">
		<?php echo $form->labelEx($model,'nombre',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'nombre',array('size'=>50,'maxlength'=>50, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'nombre',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->