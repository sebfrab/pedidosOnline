<table>
    <tr>
        <th>PRODUCTO</th>
        <th>MARCA</th>
        <th>TALLA</th>
        <th>FECHA</th>
    </tr> 
<?php foreach ($model as $value) {?>
    <tr>
        <td><?php echo $value->producto->nombre; ?></td>
        <td><?php echo $value->producto->marca; ?></td>
        <td><?php echo $value->producto->talla; ?></td>
        <td><?php echo $value->fecha; ?></td>
    </tr>
<?php } ?>
</table>