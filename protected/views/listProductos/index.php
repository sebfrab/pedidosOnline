<?php

foreach($menuObj as $item){
    $this->menu[] = array('label'=>$item->nombre, 'url'=>array('/listProductos/index/'.$item->idsubcategoria));
}
?>

<h1><?php echo $titulo; ?></h1>

    <?php 
        $this->widget('ext.SFListProductos',array(
           'model'=>$model,
       ));        
    ?>


