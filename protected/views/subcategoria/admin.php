<?php
/* @var $this SubcategoriaController */
/* @var $model Subcategoria */

$this->breadcrumbs=array(
	'Subcategorias'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Nueva Subcategoria', 'url'=>array('create')),
);
?>

<h1>Mantenedor Subcategorias</h1>

<div id="statusMsg">
<?php if(Yii::app()->user->hasFlash('success')):?>
    <div class="flash-success">
        <?php echo Yii::app()->user->getFlash('success'); ?>
    </div>
<?php endif; ?>
 
<?php if(Yii::app()->user->hasFlash('error')):?>
    <div class="flash-error">
        <?php echo Yii::app()->user->getFlash('error'); ?>
    </div>
<?php endif; ?>
</div>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'subcategoria-grid',
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
                'idsubcategoria',
		'nombre',
                array(
                'name'=>'Categoria',
                'filter' => false,
                'value'=>'$data->categoria->nombre',
                ),
		array(
                        'class'=>'CButtonColumn',
                        'htmlOptions'=>array('width'=>'100px'),
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
