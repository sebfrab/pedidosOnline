<?php
/* @var $this CarroController */
/* @var $model Carro */

$this->breadcrumbs=array(
	'Carros'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Carro', 'url'=>array('index')),
	array('label'=>'Create Carro', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#carro-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Carros</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'carro-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'idcarro',
		'usuario_idusuario',
		'producto_idproducto',
		'fecha',
		'cantidad',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
