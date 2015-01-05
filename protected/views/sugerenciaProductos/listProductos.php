<style>
.select{
    background-color: #000;
    
}


</style>
<div class="col-lg-12" style="text-align: center;">
    <h1 class="colorBlue">¿El producto que buscas <b>ya no está</b>?</h1>
    <p>¿Entraste un día y al otro ya no había stock de un producto?, ahora con un solo click nos avisaras. 
        <br/>presiona la opción <b>"¡lo necesito!"</b> del producto requerido y listo!!!</p>
    <br/><br/>
</div>

<?php
foreach ($productos as $item) {
    $urlImage = $item->imagenThumbs();
    
    echo "<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-6 producto\" id=\"$item->idproducto\">";
        echo "<div class=\"thumbnail col-lg-4 col-md-4 col-sm-4\"><a class=\"fancybox\" href=\"".$item->imagen() ."\"><img src=\"$urlImage\"  alt=\"$item->nombre\"></a></div>";
        echo "<div class=\"col-lg-8 col-md-8 col-sm-8\" style=\"font-size:12px;\">
            $item->nombre <br/>
            $item->marca <br/>
            $item->talla
            </div>";
        echo "<div class=\"col-lg-8 col-md-8 col-sm-8\">";
            echo CHtml::ajaxLink(
                $text = '¡lo necesito!', 
                $url = Yii::app()->createUrl('sugerenciaProductos/create/'), 
                $ajaxOptions=array (
                    'type'=>'POST',
                    'data'=>array('idproducto'=>$item->idproducto),
                    'dataType'=>'json',
                    'success'=>'function(data, value){ 
                        if(data.insert)
                        {
                            $("#'.$item->idproducto.'").hide("fast");            
                        }
                    }'
                    ), 
                $htmlOptions=array (
                    'confirm'=>'¿De verdad tu necesitas esto?',
                    'style'=>'text-align: right;'
                )
                );
            echo "</div>"; 
    echo "</div>"; 
    
}
?>
