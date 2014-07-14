<?php
/* @var $this PedidoController */
/* @var $model Pedido */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pedido-form',
	'enableAjaxValidation'=>false,
        'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
            'afterValidate' => 'js:function(form, data, hasError) {
                if (!hasError){
                    str = $("#pedido-form").serialize() + "&ajax=pedido-form";
                    $.ajax({
                        type: "POST",
                        url: "' . Yii::app()->createUrl($url) . '",
                        data: str,
                        dataType: "json",
                        beforeSend : function() {
                            $("#pedido-form").attr("disabled",true);
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
                                $("#pedido-form").attr("disabled",false);
                            }
                        },
                    });
                    return false;
                }
            }',
        ),
)); ?>

	<div class="form-group">
		<?php echo $form->labelEx($model,'estado_idestado',array('class'=>'control-label')); ?>
                <?php echo $form->dropDownList($model, 'estado_idestado', Estado::getListEstadosPedido(), array('empty'=>'Seleccione estado', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'estado_idestado',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'usuario_idusuario',array('class'=>'control-label')); ?>
		<?php echo $form->dropDownList($model, 'usuario_idusuario', Usuario::getListUsuarios(), array('empty'=>'Seleccione usuario', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'usuario_idusuario',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'fecha_pedido',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'fecha_pedido',array('class'=>'form-control')) ?>
		<?php echo $form->error($model,'fecha_pedido',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->