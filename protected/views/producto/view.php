<div id="caracteristicas" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="col-lg-5 col-md-5 col-sm-7 col-xs-12">
        <div class="thumbnail">
            <img src="<?php echo $model->imagen(); ?>" />
        </div>
    </div>
    <h3 style="margin-bottom: 0px;"><?php echo $model->nombre; ?></h3>
    <small>Codigo producto: #<?php echo $model->idproducto;?></small>
    <br/>
    <p style="font-size: 20px;" class="precioLeft">$<?php echo number_format(round($model->precio*1.05),0,",","."); ?></p>
    <p>Talla: <?php echo $model->talla;?></p>
    <p>Stock: <?php echo $model->cantidad;?></p>
    
    
    
    
    
    <div class="form">

    <?php 
    $auth=Yii::app()->authManager;
    if($auth->checkAccess('carro',Yii::app()->user->id)){
        $form=$this->beginWidget('CActiveForm', array(
            'id'=>'carro-form',
            'enableAjaxValidation'=>false,
            'enableClientValidation' => true,
            'clientOptions' => array(
                'validateOnSubmit' => true,
                'afterValidate' => 'js:function(form, data, hasError) {
                    if (!hasError){
                        str = $("#carro-form").serialize() + "&ajax=carro-form";
                        $.ajax({
                            type: "POST",
                            url: "' . Yii::app()->createUrl($url) . '",
                            data: str,
                            dataType: "json",
                            beforeSend : function() {
                                $("#carro-form").attr("disabled",true);
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
                                    $("#carro-form").attr("disabled",false);
                                }
                            },
                        });
                        return false;
                    }
                }',
            ),
            'htmlOptions'=>array(
                'class'=>'form-inline agregarCarro-form',
            ),
    )); ?>
            <div class="form-group">
                    <?php echo $form->textField($modelCarro,'cantidad',array('size'=>3,'maxlength'=>100, 'class'=>'form-control')) ?>
                    <?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
                    <?php echo $form->error($modelCarro,'cantidad',array('class'=>'alert alert-danger')); ?>
            </div>

    <?php $this->endWidget(); }?>

    </div><!-- form -->
</div>


<?php if(Yii::app()->user->hasFlash('success')):?>
    <div class="flash-success col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php echo Yii::app()->user->getFlash('success'); ?>
    </div>
<?php endif; ?>
 
<?php if(Yii::app()->user->hasFlash('error')):?>
    <div class="flash-error col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php echo Yii::app()->user->getFlash('error'); ?>
    </div>
<?php endif; ?>


<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <h3>Descripción</h3>
    <p><?php echo $model->descripcion; ?></p>
    
    <br/><br/><br/><br/><br/><br/><br/><br/>
</div>

