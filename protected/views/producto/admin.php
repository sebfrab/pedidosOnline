<?php
$this->menu=array(
	array('label'=>'Nuevo Producto', 'url'=>array('create')),
);
?>

<h1>Mantenedor Productos</h1>

<div id="statusMsg">
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
</div>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'producto-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
        'itemsCssClass' => 'table table-hover',
        'pager' => array(
            'header' => '',
            'hiddenPageCssClass' => 'disabled',
            'maxButtonCount' => 10,
            'cssFile' => false,
            'prevPageLabel' => '<i class="icon-chevron-left"><</i>',
            'nextPageLabel' => '<i class="icon-chevron-right">></i>',
            'firstPageLabel' => 'First',
            'lastPageLabel' => 'Last',
        ),
	'columns'=>array(
                array(
                    'name'=>'idproducto',
                    'header'=>'#',
                    'value'=>'$data->idproducto',
                    'htmlOptions'=>array(
                        'width'=>'60',
                        ),
                ),
                array(
                    'name'=>'estado_idestado',
                    'header'=>'estado',
                    'value'=>'$data->estado->nombre',
                    'filter'=>Estado::model()->getListEstadosBool(),
                ),
		'nombre',
		'marca',
		/*
		'talla',
		'precio',
		'cantidad',
		*/
		array(
                        'class'=>'CButtonColumn',
                        'htmlOptions'=>array('width'=>'80px'),
                        'template'=>'{view}{update}',
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
                        ),
                ),
	),
)); ?>
