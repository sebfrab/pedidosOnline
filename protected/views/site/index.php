<div id="jumbotron" class="jumbotron">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6">
            <br/><br/>
            <h2 style="text-align: center; color: #fff;">Ahora tu pedido al pañol <b>Online!!!</b></h2>
            <p style="text-align: center; color: #fff;">fácil, rápido y cómodo<br/>aquí tú eres el primero en la fila!!!</p>
            <?php
            if(Yii::app()->user->isGuest){
            ?>
                <p style="text-align: center;"><a href="<?php echo Yii::app()->createUrl('/site/login'); ?>" class="btn btn-danger btn-lg">INGRESAR</a></p>
            <?php
            }else{
            ?>
                <p style="text-align: center;"><?php echo CHtml::link('Comienza tu Pedido', $this->createAbsoluteUrl('listProductos/index',array('id'=>2)), array('class'=>'btn btn-success btn-lg'));?></p>
            <?php } ?>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6">
            <img id="manoCelular" class="img-responsive" alt="mano_celular" src="<?php echo Yii::app()->request->baseUrl; ?>/images/mano_celular.png" />
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <h1 style="text-align: center; margin-bottom: 50px;">CÓMO TE AYUDA</h1>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/esperando.jpg" alt="menos_tiempo_de_espera" class="img-responsive img-circle center-block" />
            <br/>
            <p style="text-align: center">Menos tiempo de espera por tu producto</p>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/pasos.jpg" alt="lo_pides_retiras_pagas" class="img-responsive img-circle center-block" />
            <br/>
            <p style="text-align: center">Lo pides, lo retiras y pagas</p>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/tiempo.jpg" alt="mas_tiempo_para_ti" class="img-responsive img-circle center-block" />
            <br/>
            <p style="text-align: center">Más tiempo para ti, menos tiempo de "nada"</p>
        </div>
    </div>
</div>


<div style="background-color: #297fb8; margin-top: 70px; color: #fff; padding-top: 5px; padding-bottom: 5px;" class="container-fluid">
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <a target="_blank" href="http://www.armada.cl/"><img alt="admisión" class="img-responsive center-block" src="<?php echo Yii::app()->request->baseUrl; ?>/images/armada.png"/></a>
        </div>
        <div class="col-lg-4"></div>
    </div>
</div>


<div class="container">
    <div class="row">
        <h1 style="text-align: center; margin-bottom: 50px;">CONTACTO</h1>
        <div class="col-lg-6 col-md-6 col-sm-6">
            <h1>¿Algún problema?</h1>
            <p>¿no puedes acceder? ¿no recuerdas tu clave y/o usuario?
                escríbenos y veremos cuál es el problema
            </p>
                    
            <h1>¿Eres social?</h1>
            <p>Recuerda pasar por nuestro 
            <a target="_blank" href="http://www.facebook.com/EscuelaNavalChile" title="facebook">Twitter</a> 
                y <a target="_blank" href="http://twitter.com/#!/Armada_Chile" title="twitter">Facebook</a></p>
            </div>
                
        <div class="col-lg-6 col-md-6 col-sm-6">
        
        <h1>Tus datos</h1>
        
        <?php if(Yii::app()->user->hasFlash('contact')): ?>
            <div id="statusMsg">
                <div class="flash-success">
                    <?php echo Yii::app()->user->getFlash('contact'); ?>
                </div>
            </div>
        <?php else: ?>

        <div id="contacto" class="form">

                        <?php $form=$this->beginWidget('CActiveForm', array(
                                'id'=>'contact-form',
                                'enableClientValidation'=>true,
                                'clientOptions'=>array(
                                        'validateOnSubmit'=>true,
                                ),
                        )); ?>

                            <div class="form-group">
                                <?php echo $form->labelEx($model,'name',array('class'=>'control-label')); ?>
                                <?php echo $form->textField($model,'name',array('class'=>'form-control')) ?>
                                <?php echo $form->error($model,'name',array('class'=>'alert alert-danger')); ?>
                            </div>

                            <div class="form-group">
                                <?php echo $form->labelEx($model,'email',array('class'=>'control-label')); ?>
                                <?php echo $form->textField($model,'email',array('class'=>'form-control')) ?>
                                <?php echo $form->error($model,'email',array('class'=>'alert alert-danger')); ?>
                            </div>

                            <div class="form-group">
                                <?php echo $form->labelEx($model,'subject',array('class'=>'control-label')); ?>
                                <?php echo $form->textField($model,'subject',array('size'=>60,'maxlength'=>128, 'class'=>'form-control')) ?>
                                <?php echo $form->error($model,'subject',array('class'=>'alert alert-danger')); ?>
                            </div>

                            <div class="form-group">
                                <?php echo $form->labelEx($model,'body',array('class'=>'control-label')); ?>
                                <?php echo $form->textArea($model,'body',array('rows'=>6, 'cols'=>50, 'class'=>'form-control')) ?>
                                <?php echo $form->error($model,'body',array('class'=>'alert alert-danger')); ?>
                            </div>

                            <?php if(CCaptcha::checkRequirements()): ?>
                            <div class="form-group">
                                    <?php echo $form->labelEx($model,'verifyCode',array('class'=>'control-label')); ?>
                                    <div>
                                    <?php $this->widget('CCaptcha'); ?>
                                    <?php echo $form->textField($model,'verifyCode',array('class'=>'form-control')) ?>
                                    </div>
                                    <?php echo $form->error($model,'verifyCode',array('class'=>'alert alert-danger')); ?>
                            </div>
                            <?php endif; ?>

                            <div class="form-group">
                                    <?php echo CHtml::submitButton('enviar',array('class'=>'btn btn-primary')); ?>
                            </div>

                    <?php $this->endWidget(); ?>

         </div><!-- form -->

                    <?php endif; ?>  
         </div>
         </div>
</div>
        
        