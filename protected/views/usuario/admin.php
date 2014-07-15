<?php

$this->menu=array(
	array('label'=>'Nuevo Usuario', 'url'=>array('create')),
        array('label'=>'Crear perfiles nuevos Usuarios', 'url'=>'#', 'linkOptions'=>array('submit'=>array('createPermissionsNewUsuario'),'confirm'=>'¿Está seguro de crear los permisos de los nuevos usuarios?')),
);
?>

<h1>Mantenedor Usuarios</h1>

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
	'id'=>'usuario-grid',
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
                    'name'=>'idusuario',
                    'header'=>'#',
                    'value'=>'$data->idusuario',
                ),
                array(
                    'name'=>'tipo_usuario_idtipo_usuario',
                    'header'=>'tipo',
                    'value'=>'$data->tipo->nombre',
                    'filter'=> TipoUsuario::model()->getListTipos(),
                ),
                array(
                    'name'=>'estado_idestado',
                    'header'=>'estado',
                    'value'=>'$data->estado->nombre',
                    'filter'=>Estado::model()->getListEstadosBool(),
                ),
		'username',
		array(
                    'name'=>'nombres',
                    'header'=>'nombre',
                    'value'=>'$data->nombreCompleto',
                ),
                'last_login',
		/*
		'apellidos',
		'sexo',
		'last_login',
		*/
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
