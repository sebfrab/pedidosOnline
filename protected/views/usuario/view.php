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



<div style="margin-top: 40px;" class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">
      Permisos
  </div>
  <div class="panel-body">
  </div>
  <!-- Table -->
  <table class="table">

      <?php foreach(Yii::app()->authManager->getAuthItems() as $data):?>
        <?php $enabled=Yii::app()->authManager->checkAccess($data->name, $model->idusuario) ?>
        <tr>
        <td><?php echo $data->name ?></td>
        <td>
            <?php if($data->type==0) echo "Role"; ?>
            <?php if($data->type==1) echo "Tarea"; ?>
            <?php if($data->type==2) echo "Operación"; ?>
        </td>
        <td><?php echo CHtml::link($enabled?"On":"Off",array("usuario/assign", "id"=>$model->idusuario, "item"=>$data->name),
                                    array("class"=>$enabled?'btn btn-primary':'btn btn-default'));?></td>
        </tr>   
    <?php endforeach; ?>
      
      
  </table>
</div>