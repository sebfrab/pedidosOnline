<?php
/* @var $this ProductoController */
/* @var $model Producto */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'producto-form',
	'enableAjaxValidation'=>false,
        'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
            'afterValidate' => 'js:function(form, data, hasError) {
                if (!hasError){
                    str = $("#producto-form").serialize() + "&ajax=producto-form";
                    $.ajax({
                        type: "POST",
                        url: "' . Yii::app()->createUrl($url) . '",
                        data: str,
                        dataType: "json",
                        beforeSend : function() {
                            $("#producto-form").attr("disabled",true);
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
                                $("#producto-form").attr("disabled",false);
                            }
                        },
                    });
                    return false;
                }
            }',
        ),
)); ?>

        <div class="form-group">
		<?php echo $form->labelEx($model,'idproducto',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'idproducto',array('size'=>60,'maxlength'=>150, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'idproducto',array('class'=>'alert alert-danger')); ?>
	</div> 

        <div class="form-group">
		<?php echo $form->labelEx($model,'nombre',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>150, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'nombre',array('class'=>'alert alert-danger')); ?>
	</div>
    
	<div class="form-group">
		<?php echo $form->labelEx($model,'subcategoria_idsubcategoria',array('class'=>'control-label')); ?>
		<?php echo $form->dropDownList($model, 'subcategoria_idsubcategoria', Subcategoria::model()->getListSubCategorias(), array('empty'=>'Seleccione subcategoria', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'subcategoria_idsubcategoria',array('class'=>'alert alert-danger')); ?>
	</div>
    
	<div class="form-group">
		<?php echo $form->labelEx($model,'descripcion',array('class'=>'control-label')); ?>
		<?php echo $form->textArea($model,'descripcion',array('rows'=>6, 'cols'=>50, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'descripcion',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'marca',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'marca',array('size'=>50,'maxlength'=>50, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'marca',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'talla',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'talla',array('size'=>10,'maxlength'=>10, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'talla',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'precio',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'precio',array('size'=>10,'maxlength'=>10, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'precio',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'cantidad',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'cantidad',array('size'=>10,'maxlength'=>10, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'cantidad',array('class'=>'alert alert-danger')); ?>
	</div>
    
        <div class="form-group">
		<?php echo $form->labelEx($model,'estado_idestado',array('class'=>'control-label')); ?>
		<?php echo $form->dropDownList($model, 'estado_idestado', Estado::model()->getListEstadosBool(), array('empty'=>'Seleccione estado', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'estado_idestado',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->