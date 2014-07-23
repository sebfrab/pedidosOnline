<?php

class SFListCarro extends CWidget{
    public $model;
    
    public function init(){
        parent::init();
        $i=0;
        $suma = 0;
        foreach($this->model as $item){
            $i++;
            echo "<div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">";
            $urlImage = $item->producto->imagen();
            $nombre_producto = $item->producto->nombre;
            echo "<div class=\"thumbnail col-lg-2 col-md-2 col-sm-3 col-xs-12\"><img src=\"$urlImage\"  alt=\"$nombre_producto\"></div>";
            
            echo "<div class=\"col-lg-4 col-md-4 col-sm-3 col-xs-12\">";
            echo "<p style=\"margin-bottom: 0px;\"><b>$nombre_producto</b></p>";
            echo "<small>Codigo producto: #$item->producto_idproducto</small>";
            
            
            $precio = number_format(round($item->producto->precio*1.05),0,",",".");
            echo "<p style=\"font-size: 16px; margin:0px;\" class=\"precioLeft\">$$precio</p>";
            
            $talla = $item->producto->talla;
            $stock = $item->producto->cantidad;
            
            echo "<p style=\"margin: 0px;\">Talla: $talla</p>";
            echo "<p style=\"margin: 0px;\">Stock: $stock</p>";
            echo "</div>";
            
            echo "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-12\">";
            
            $form=$this->beginWidget('CActiveForm', array(
                    'id'=>$i.'carro-form',
                    'action' => Yii::app()->createUrl("carro/updateCarro/".$item->idcarro), 
                    'enableAjaxValidation'=>false,
                    'enableClientValidation' => true,
                    'clientOptions' => array(
                        'validateOnSubmit' => true,
                        'afterValidate' => 'js:function(form, data, hasError) {
                            if (!hasError){
                                str = $("#'.$i.'carro-form").serialize() + "&ajax=carro-form";
                                $.ajax({
                                    type: "POST",
                                    url: "' . Yii::app()->createUrl("carro/updateCarro/".$item->idcarro) . '",
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
                                                var div = "#'.$i.'"+key+"_em_";
                                                $(div).text(value);
                                                $(div).show();
                                            });
                                            $("#'.$i.'carro-form").attr("disabled",false);
                                        }
                                    },
                                });
                                return false;
                            }
                        }',
                    ),
                    'htmlOptions'=>array(

                    ),
            ));            
            
            echo $form->labelEx($item,'cantidad',array('class'=>'control-label'));
            echo $form->textField($item,'cantidad',array('size'=>60,'maxlength'=>100, 'class'=>'form-control', 'style'=>'width: 65px;'));
            echo $form->error($item,'cantidad',array('class'=>'alert alert-danger', 'id'=>$i.'Carro_cantidad_em_'));
            //name="Carro[cantidad]" id="Carro_cantidad" ;
            
            $this->endWidget();
            echo "</div>";
            
            $subtotal=$total = number_format(round($item->producto->precio*1.05)*$item->cantidad,0,",",".");
            echo "<div class=\"col-lg-2 col-md-2 col-sm-2 col-xs-12\">";
            echo "<p class=\"precioLeft\">$$subtotal</p>";
            echo "</div>";
            
            echo "<div class=\"col-lg-1 col-md-1 col-sm-1 col-xs-12\">";
            echo CHtml::link(
                    'eliminar',
                    "#", 
                    array(
                        "submit"=>array('delete', 
                            'id'=>$item->idcarro
                    ), 
                    'confirm' => '¿está seguro de eliminar el producto del carro?'));
            echo "</div>";
            
            echo "</div>";  
            
            $suma += $item->cantidad * round($item->producto->precio*1.05);
        }
        $total = number_format($suma,0,",",".");
        echo "<div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">";
        echo "<p style=\"font-size:18px;\" class=\"precio\">Total $$total</p>";
        echo "</div>";
        
        
        echo "<div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">";
        echo "<form class=\"\" role=\"form\" action=\"".Yii::app()->createUrl('carro/realizarPedido')."\" method=\"post\">";
        echo "<input class=\"btn btn-primary pull-right\" type=\"submit\" value=\"hacer pedido\" />";
        echo "</form>";
        echo "</div>";
    }   
}
?>