<h1>Pedido #<?php echo $model->idpedido; ?></h1>

<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
<p>R.U.N.:<?php echo $model->usuario->username ?></p>
<p>N° Kdt :<?php echo $model->usuario->ncadete ?></p>
<p>Curso :<?php echo $model->usuario->curso ?></p>
<p>Nombre : <?php echo $model->usuario->nombrecompleto?></p>
<p>Fecha pedido : <?php echo $model->FechaPedido?></p>
<p style="text-align: justify">Comentario : <?php echo nl2br($model->comentario);?></p>

<?php 
$auth=Yii::app()->authManager;
if($auth->checkAccess('mantenedor_pedidos',Yii::app()->user->id) || $tipoUsuario==2){
    $form=$this->beginWidget('CActiveForm', array(
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
                <?php echo $form->dropDownList($model, 'estado_idestado', Estado::getListEstadosPedido(), array('empty'=>'Seleccione estado', 'class'=>'form-control')) ?>
		<?php echo $form->error($model,'estado_idestado',array('class'=>'alert alert-danger')); ?>
	</div>

	<div class="form-group">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Ingresar' : 'Guardar',array('class'=>'btn btn-primary')); ?>
                <?php echo CHtml::link('Voucher',array('pedido/voucher',
                                         'id'=>$model->idpedido),array('target'=>'_blank', 'class' => 'btn btn-default')); ?>
	</div>
<?php $this->endWidget(); }else{
    echo "<p><b>Estado: ".$model->estado->nombre."</b></p>";
}?>




</div>

<?php
    $criteria = new CDbCriteria;  
    $criteria->addCondition('pedido_idpedido = '.$model->idpedido);
    $detalle = DetallePedido::model()->findAll($criteria);
?>


<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
    <?php
    foreach($detalle as $det){        
    ?>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="thumbnail col-lg-3 col-md-3 col-sm-6 col-xs-4">
                <a class="fancybox" href="<?php echo $det->producto->imagen(); ?>">
                    <img src="<?php echo $det->producto->imagenThumbs(); ?>"  alt="<?php echo $det->producto->nombre; ?>">
                </a>
            </div>
            
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-8">
                <p style="margin:0px;"><b><?php echo $det->producto->nombre; ?></b></p>
                <p style="margin:0px;">Codigo: #<?php echo $det->producto->idproducto; ?></p>
                <p style="margin:0px;">Talla: <?php echo $det->producto->talla; ?></p>
                <p style="margin:0px;">Cantidad: <?php echo $det->cantidad; ?></p>
            </div>
        </div>
    <?php
    }
    ?>
</div>

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