<?php

class SFListPedidos extends CWidget{
    public $model;
    
    public function init(){
        
        echo "<table class=\"table table-hover\">";
        echo "<thead>
            <tr>
              <th>#</th>
              <th>Nombre</th>
              <th>Last Name</th>
              <th>Username</th>
            </tr>
          </thead>";
        foreach($this->model as $item){
            
        }
        echo "</table>";
    }
    
}

/*echo "<div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">";
            echo "<h3>Pedido #$item->idpedido</h3>";
            
            echo "<div class=\"col-lg-4 col-md-4 col-sm-3 col-xs-12\">";
            echo "<p>R.U.N.: ".$item->usuario->username."</p>";
            echo "<p>Nombre : ".$item->usuario->nombres." ".$item->usuario->apellidos."</p>";
            echo "</div>";
            
            
            $criteria = new CDbCriteria;  
            $criteria->addCondition('pedido_idpedido = '.$item->idpedido);
            $detalle = DetallePedido::model()->findAll($criteria);
            
            echo "<div class=\"col-lg-6 col-md-4 col-sm-3 col-xs-12\">";
            foreach($detalle as $det){
                
                
                $urlImage = Yii::app()->request->baseUrl."/images/productos/".$det->producto->idproducto."/1.jpg";
                if (!file_exists($urlImage)){
                    $urlImage = Yii::app()->request->baseUrl."/images/image-not-found.jpg";
                }
                echo "<div class=\"col-lg-12\">";
                echo "<div class=\"thumbnail col-lg-3\"><img src=\"$urlImage\"  alt=\"".$det->producto->nombre."\"></div>";

                
                
                echo "<div class=\"col-lg-9\">";
                echo "<p style=\"margin:0px;\"><b>".$det->producto->nombre."</b></p>";
                echo "<p style=\"margin:0px;\">Codigo: #".$det->producto->idproducto."</p>";
                echo "<p style=\"margin:0px;\">Talla:".$det->producto->talla."</p>";
                echo "<p style=\"margin:0px;\">Cantidad:".$det->cantidad."</p>";
                echo "</div>";
                
                
                
                
                echo "</div>";
            }
            echo "</div>";
            
            
            
            
            echo "</div>";*/

?>





