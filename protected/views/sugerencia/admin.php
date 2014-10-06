<?php
/* @var $this SugerenciaController */
/* @var $model Sugerencia */

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#sugerencia-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Sugerencias</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'sugerencia-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
        'itemsCssClass' => 'table table-hover',
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
		'idsugerencia',
                array(
                    'name'=>'usuario.NombreCompleto',
                    'header'=>'Usuario',
                    'value'=>'$data->usuario->NombreCompleto',
                ),
		'comentario',
                array(
                    'name'=>'fecha',
                    'header'=>'fecha',
                    'value'=>'$data->FechaSugerencia',
                ),
		array(
                        'class'=>'CButtonColumn',
                        'htmlOptions'=>array('width'=>'100px'),
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

