<?php
/* @var $this SugerenciaController */
/* @var $model Sugerencia */
/* @var $form CActiveForm */
?>

<div class="col-lg-6">

    <h1>¿El producto que buscas ya no está?</h1> 
    <p>¿Entraste un día y al otro ya no había stock de un producto?, escribenos y nosotros lo traemos</p>
    
    <h1>¿Necesitas algo?</h1> 
    <p>Si buscas algo en especial y el pañol no lo tiene, escribenos y nosotros lo traemos</p>
    
    
</div>


<div class="col-lg-6">
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'sugerencia-form',
	'enableAjaxValidation'=>false,
        'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
            'afterValidate' => 'js:function(form, data, hasError) {
                if (!hasError){
                    str = $("#sugerencia-form").serialize() + "&ajax=sugerencia-form";
                    $.ajax({
                        type: "POST",
                        url: "' . Yii::app()->createUrl($url) . '",
                        data: str,
                        dataType: "json",
                        beforeSend : function() {
                            $("#sugerencia-form").attr("disabled",true);
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
                                $("#sugerencia-form").attr("disabled",false);
                            }
                        },
                    });
                    return false;
                }
            }',
        ),
)); ?>

	<div class="form-group">
		<h1>Comentario</h1> 
		<?php echo $form->textArea($model,'comentario',array('rows'=>6, 'cols'=>50, 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'comentario',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
	</div>

<?php $this->endWidget(); ?>
    
    <div id="statusMsg">
<?php if(Yii::app()->user->hasFlash('success')):?>
    <div class="flash-success">
        <?php echo Yii::app()->user->getFlash('success'); ?>
    </div>
<?php endif; ?>
 
<?php if(Yii::app()->user->hasFlash('error')):?>
    <div class="flash-error">
        <?php echo Yii::app()->user->getFlash('error'); ?>
    </div>
<?php endif; ?>
</div>
</div>

