
<h1>Resultado de la busqueda: <?php echo $busqueda; ?></h1>

<?php 
    $this->widget('ext.SFListProductos',array(
        'model'=>$model,
    ));        
?>
