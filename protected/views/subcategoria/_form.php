<?php
/* @var $this SubcategoriaController */
/* @var $model Subcategoria */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'subcategoria-form',
	'enableAjaxValidation'=>false,
        'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
            'afterValidate' => 'js:function(form, data, hasError) {
                if (!hasError){
                    str = $("#subcategoria-form").serialize() + "&ajax=subcategoria-form";
                    $.ajax({
                        type: "POST",
                        url: "' . Yii::app()->createUrl($url) . '",
                        data: str,
                        dataType: "json",
                        beforeSend : function() {
                            $("#subcategoria-form").attr("disabled",true);
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
                                $("#subcategoria-form").attr("disabled",false);
                            }
                        },
                    });
                    return false;
                }
            }',
        ),
)); ?>

        <div class="form-group">
		<?php echo $form->labelEx($model,'idsubcategoria',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'idsubcategoria',array('size'=>60,'maxlength'=>100, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'idsubcategoria',array('class'=>'alert alert-danger')); ?>
	</div>
    
	<div class="form-group">
		<?php echo $form->labelEx($model,'nombre',array('class'=>'control-label')); ?>
		<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>100, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'nombre',array('class'=>'alert alert-danger')); ?>
	</div>
    
        <div class="form-group">
		<?php echo $form->labelEx($model,'categoria_idcategoria',array('class'=>'control-label')); ?>
                <?php echo $form->dropDownList($model, 'categoria_idcategoria', Categoria::getListCategorias(), array('empty'=>'Seleccione categoria', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'categoria_idcategoria',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->