<?php

class SFListProductos extends CWidget{
    public $model;
    
    public function init(){
        parent::init();
        foreach($this->model as $item){
            echo "<div class=\"col-lg-3 col-md-3 col-sm-4 col-xs-12 item\">";
            $url = Yii::app()->createUrl("/producto/$item->idproducto");;
            echo "<a href=\"$url\">";
            
            $urlImage = Yii::app()->request->baseUrl."/images/productos/$item->idproducto/1.jpg";
            if (!file_exists($urlImage)){
                $urlImage = Yii::app()->request->baseUrl."/images/image-not-found.jpg";
            }
            
            echo "<div class=\"thumbnail\"><img src=\"$urlImage\"  alt=\"$item->nombre\"></div>";
            $talla = '';
            if($item->talla!=''){
                $talla = $item->talla;
            }
            
            echo "<p class=\"productoNombbre\">$item->nombre (talla $talla)</p>";
            echo " </a>";
            echo "<p class=\"stock\">Stock: $item->cantidad</p>";
            
            $numero = number_format(round($item->precio*1.05),0,",",".");
            echo "<p class=\"precio\">$numero</p>";
            echo "</div>";
        }
    }
    
    
    
}

?>
