<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
    $ant=-1;
    $valueAnt=null;
?>
<table>
    <tr>
        <th bgcolor="ccccff">ID</th>
        <th bgcolor="ccccff">Fecha</th>
        <th bgcolor="ccccff">Estado</th>
        <th bgcolor="ccccff">Usuario</th>
        
        <th bgcolor="ccccff">Producto</th>
        <th bgcolor="ccccff">Marca</th>
        <th bgcolor="ccccff">Talla</th>
        <th bgcolor="ccccff">Cantidad</th>
    </tr>
    <?php foreach ($model as $value) {
        if($ant!=$value->pedido->idpedido){
            if($ant!=-1){
            ?>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th align="right">Totales</th>
                <th align="right"><?php echo $valueAnt->pedido->detalleSum ?></th>
            </tr>
    
    
    
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <?php
        }
        $ant=$value->pedido->idpedido;
        }
        ?>
    <tr>
        <td><?php echo $value->pedido->idpedido ?></td>
        <td><?php echo $value->pedido->FechaPedido ?></td>
        <td><?php echo $value->pedido->estado->nombre ?></td>
        <td><?php echo $value->pedido->usuario->nombreCompleto ?></td>
        
        <td><?php echo $value->producto->nombre ?></td>
        <td><?php echo $value->producto->marca ?></td>
        <td><?php echo $value->producto->talla ?></td>
        <td align="right"><?php echo $value->cantidad ?></td>
    </tr>   
    <?php 
        $valueAnt =$value;
    } 
    ?>
    <tr>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th align="right">Totales</th>
        <th align="right"><?php echo $valueAnt->pedido->detalleSum ?></th>
    </tr>
</table>

    