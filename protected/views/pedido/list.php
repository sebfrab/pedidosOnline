
<h3>Pedidos</h3>


<style>
    
    @media (max-width: 767px) {
        #pedido-grid{
            font-size: 12px;
        }
      }
    
    
</style>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'pedido-grid',
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
        'itemsCssClass' => 'table table-hover',
	'columns'=>array(
                array(
                    'name'=>'idpedido',
                    'header'=>'#',
                    'value'=>'$data->idpedido',
                    'htmlOptions'=>array(
                        'width'=>'60',
                        ),
                ),
                array(
                    'name'=>'usuario.username',
                    'header'=>'R.U.N.',
                    'value'=>'$data->usuario->username',
                ),
                array(
                    'name'=>'estado_idestado',
                    'header'=>'estado',
                    'value'=>'$data->estado->nombre',
                    'filter'=>Estado::model()->getListEstadosPedido(),
                ),
                array(
                    'name'=>'usuario_idusuario',
                    'header'=>'usuario',
                    'value'=>'$data->usuario->NombreCompleto',
                ),
                array(
                    'name'=>'fecha_pedido',
                    'header'=>'fecha pedido',
                    'value'=>'$data->FechaPedido',
                    'headerHtmlOptions'=>array('class'=>'hidden-xs'),
                    'filter'=>false,
                    'htmlOptions'=>array(
                        'class'=>'hidden-xs',
                        ),
                ),
                array(
                    'header'=>'N° art.',
                    'value'=>'$data->detalleCount',
                    'headerHtmlOptions'=>array('class'=>'hidden-xs'),
                    'htmlOptions'=>array(
                        'class'=>'hidden-xs',
                        ),
                ),
		array(
                        'class'=>'CButtonColumn',
                        'htmlOptions'=>array('width'=>'60px'),
                        'template'=>'{view}',
                        'afterDelete'=>'function(link,success,data){ if(success) $("#statusMsg").html(data); }',
                        'buttons'=>array(
                            'view' => array
                            (
                                'label'=>'ver',
                                'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/ver.png',
                            ),
                        ),
                ),
	),
)); ?>
