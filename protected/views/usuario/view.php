<?php
$this->menu=array(
	array('label'=>'Nuevo Usuario', 'url'=>array('create')),
	array('label'=>'actualizar Usuario', 'url'=>array('update', 'id'=>$model->idusuario)),
	array('label'=>'Eliminar Usuario', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idusuario),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Mantenedor Usuario', 'url'=>array('admin')),
);
?>

<h1>Ver Usuario #<?php echo $model->idusuario; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
                'username',
                'nombreCompleto',
		'tipo.nombre',
		'estado.nombre',
		'sexo',
		'last_login',
	),
)); ?>


<ul class="nav nav-pills nav-stacked">
<?php foreach(Yii::app()->authManager->getAuthItems() as $data):?>
    <?php $enabled=Yii::app()->authManager->checkAccess($data->name, $model->idusuario) ?>
    <li>
        <a>
            <h4><?php echo $data->name ?> 
                <small>
                    <?php if($data->type==0) echo "Role"; ?>
                    <?php if($data->type==1) echo "Tarea"; ?>
                    <?php if($data->type==2) echo "Operación"; ?>
                </small> 
                <?php echo CHtml::link($enabled?"Off":"On",array("usuario/assign", "id"=>$model->idusuario, "item"=>$data->name),
                                array("class"=>$enabled?'btn btn-default':'btn btn-primary'));?>
            </h4>
        </a>
    </li>
<?php endforeach; ?>
</ul>
