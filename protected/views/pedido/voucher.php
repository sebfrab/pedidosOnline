<style>
    .voucher{
        font-family: sans-serif, Serif !important;
        line-height:1.42857143 !important;
        
       
    }
    .voucher p{
        margin-bottom: 5px !important;
    }
</style>

<div class="voucher">

<div class="container">
    <div class="row"> 
        
        <div class="col-xs-12 text-center">
            <strong>Pedido # <?php echo $model->idpedido;?></strong>
        </div>
        
        <div class="col-xs-5" style="font-size: 12px;">
            <p>Fecha: <?php echo $model->fechaPedido; ?></p>
        </div>
        <div class="col-xs-4" style="font-size: 12px;">
            <p>Hora: <?php echo $model->horaPedido; ?></p>
        </div>
        
        <div class="col-xs-12" style="font-size: 12px;">
            <p>_____________________________________________</p>
        </div>
        
    </div>
</div>
    
<div class="container">
    <div class="row">
        <div class="col-xs-12" style="font-size: 12px;">
            <p>Sr(a). <?php echo strtoupper($model->usuario->nombreCompleto);?></p>
        </div>
        <div class="col-xs-12" style="font-size: 12px;">
            <p>Número <?php echo $model->usuario->ncadete;?></p>
        </div>
        
        <div class="col-xs-12" style="font-size: 10px;">
            --------------------------------- Detalle -------------------------------
        </div>
    </div>
</div>

<div class="container">
    
        <?php foreach($model->detalle as $item){?>
        <div class="row">
            
            <div class="col-xs-12" style="font-size: 10px;">
                <p># <?php echo $item->producto->idexterno; ?> - <?php echo $item->producto->nombre; ?></p>
            </div>

            <div class="col-xs-4" style="font-size: 10px;">
                <p>Marca: <?php echo $item->producto->marca; ?></p>
            </div>

            <div class="col-xs-3" style="font-size: 10px;">
                <p> Talla: <?php echo $item->producto->talla; ?></p>
            </div>
            <div class="col-xs-1" style="font-size: 10px;">
                <p><?php echo $item->cantidad;?></p>
            </div>
        </div>
        <?php }?>
    
    <div class="row">
        <div class="col-xs-12" style="font-size: 10px;">
            ---------------------------------------------------------------------------
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-12 text-center" style="font-size: 10px;">
            <p>Comentario</p>
        </div>
        <div class="col-xs-12" style="font-size: 10px; text-align: justify;">
            <p>
                <?php echo $model->comentario; ?>
            </p>
        </div>
    </div>
</div>    
    
    
<br/>
<div class="container">
    <div class="row">
        <div class="col-xs-12" style="font-size: 10px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** Eficiencia y Disciplina **
        </div>
    </div>  
</div>    
<br/>  
    
        
</div>