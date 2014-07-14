
<h3>Carro</h3>

 <?php 
        $this->widget('ext.SFListCarro',array(
           'model'=>$model,
       ));        
    ?>

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