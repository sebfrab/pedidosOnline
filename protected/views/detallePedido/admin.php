<?php

$this->menu=array(
	array('label'=>'Nuevo Detalle Pedido', 'url'=>array('create')),
);

?>

<h1>Mantenedor Detalle Pedidos</h1>


<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'detalle-pedido-grid',
        'itemsCssClass' => 'table table-hover',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
        'pager' => array(
            'header' => '',
            'hiddenPageCssClass' => 'disabled',
            'maxButtonCount' => 5,
            'cssFile' => false,
            'prevPageLabel' => '<i class="icon-chevron-left"><</i>',
            'nextPageLabel' => '<i class="icon-chevron-right">></i>',
            'firstPageLabel' => 'First',
            'lastPageLabel' => 'Last',
        ),
	'columns'=>array(
		'iddetalle_pedido',
		'pedido_idpedido',
                array(
                    'name'=>'producto_idproducto',
                    'header'=>'producto',
                    'value'=>'$data->producto->nombre',
                ),
		'cantidad',
		array(
                        'class'=>'CButtonColumn',
                        'htmlOptions'=>array('width'=>'105px'),
                        'template'=>'{view}{update}{delete}',
                        'afterDelete'=>'function(link,success,data){ if(success) $("#statusMsg").html(data); }',
                        'buttons'=>array(
                            'view' => array
                            (
                                'label'=>'ver',
                                'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/ver.png',
                            ),
                            'update' => array
                            (
                                'label'=>'actualizar',
                                'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/actualizar.png',
                            ),
                            'delete' => array
                            (
                                'label'=>'eliminar',
                                'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/eliminar.png',
                            ),
                        ),
                ),
	),
)); ?>
