<h1><?php echo $titulo; ?></h1>

    <?php 
        $this->widget('ext.SFListProductos',array(
           'model'=>$model,
       ));        
    ?>


