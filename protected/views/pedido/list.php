
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
                /*array(
                    'name'=>'idpedido',
                    'header'=>'#',
                    'value'=>'$data->idpedido',
                    'htmlOptions'=>array(
                        'width'=>'60',
                        ),
                ),*/
                array(
                    'name'=>'usuario.ncadete',
                    'value'=>'$data->usuario->ncadete',
                    'filter' => CHtml::activeTextField($model, 'ncadete'),
                ),
                array(
                    'name'=>'estado_idestado',
                    'header'=>'estado',
                    'value'=>'$data->estado->nombre',
                    'filter'=>Estado::model()->getListEstadosPedido(),
                ),
                array(
                    'name'=>'usuario.nombres',
                    'value'=>'$data->usuario->nombres',
                    'filter' => CHtml::activeTextField($model, 'nombres'),
                ),
                array(
                    'name'=>'usuario.apellidos',
                    'value'=>'$data->usuario->apellidos',
                    'filter' => CHtml::activeTextField($model, 'apellidos'),
                ),
                array(
                    'name' => 'usuario.curso',
                    'filter' => CHtml::activeTextField($model, 'curso'),
                ),
                array(
                    'name'=>'fecha_pedido',
                    'header'=>'fecha pedido',
                    'value'=>'$data->FechaPedido',
                    'headerHtmlOptions'=>array('class'=>'hidden-xs'),
                    'htmlOptions'=>array(
                        'class'=>'hidden-xs',
                        ),
                    'filter' => CHtml::activeTextField($model, 'fecha_pedido'),
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
                        'htmlOptions'=>array('width'=>'85px'),
                        'template'=>'{view}{print}',
                        'buttons'=>array(
                            'view' => array
                            (
                                'label'=>'ver',
                                'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/ver.png',
                            ),
                            'print' => array
                            (
                                'label'=>'voucher',
                                'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/voucher.png',
                                'url'=>'Yii::app()->createUrl("/pedido/voucher",array("id" => $data->idpedido))',
                                'options'=>array('target'=>'_blank'),
                            ),
                        ),
                ),
	),
)); ?>


<?php if(Yii::app()->user->hasFlash('success')):?>
    <div style="margin-top: 20px;" class="flash-success col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php echo Yii::app()->user->getFlash('success'); ?>
    </div>
<?php endif; ?>
 
<?php if(Yii::app()->user->hasFlash('error')):?>
    <div style="margin-top: 20px;" class="flash-error col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php echo Yii::app()->user->getFlash('error'); ?>
    </div>
<?php endif; ?>