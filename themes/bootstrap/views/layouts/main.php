<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="language" content="es" />
        <meta name="author" content="Sebastian Franco Brantes UTFSM - ¿y por qué no? - seb.frab@gmail.com"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="Keywords" content="pedidos, venta, onlines, escuela naval, cadete, armada, chile"/>
        <meta name="description" content="Sistema de pedidos online, para cadetes de la Escuela Naval Arturo Prat" />
        <meta name="language" content="es" />
        <meta http-equiv="X-UA-Compatible" content="IE=7,8,9" />  
        
        <!-- Bootstrap 3.0 -->
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/general.css" />
        <?php Yii::app()->clientScript->registerCoreScript('jquery'); ?>
        
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

    <?php
        $auth=Yii::app()->authManager;
        //$task=$auth->createTask('mantenedor_detalle_pedido','acceso completo a los detalles del pedido');
        //$task=$auth->createTask('pedidos','acceso a los pedidos');
        //$task=$auth->createTask('mantenedor_pedidos','acceso completo a los pedidos realizados');
        //$task=$auth->createTask('mantenedor_usuario','acceso completo al mantenedor de usuarios');
        //$task=$auth->createTask('lista_productos','acceso para visualizar la lista de productos del sistema');
        //$task=$auth->createTask('carro_pedidos','acceso al carro de compra');
        //$task=$auth->createTask('mantenedor_productos','acceso completo al mantenedor de productos');
    ?>
    
    <body>
        <header>
            <nav role="navigation">
                <div id="menu" class="navbar navbar-fixed-top">
                    <div class="navbar-default navbar-collapse">
                        <div class="container">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".bs-js-navbar-collapse">
                                    <span class="sr-only">Toggle</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a href="<?php echo Yii::app()->request->baseUrl; ?>" class="navbar-brand"><p style="color: #297fb8;">Pedidos<b>Online</b></p></a>
                            </div>
                            <div class="navbar-collapse bs-js-navbar-collapse collapse">
                                
                                <?php $this->widget('zii.widgets.CMenu',array(
                                        'htmlOptions' => array(
                                            'class'=>'nav navbar-nav navbar',
                                            'id'=>'menu',
                                        ),
                                        'submenuHtmlOptions' => array(
                                            'class'=>'dropdown-menu', 
                                        ),
                                        'items'=>array(
                                                array('label'=>'VESTIMENTA', 'url'=>array('/listProductos/index/1'), 'visible'=>$auth->checkAccess('lista_productos',Yii::app()->user->id)),
                                                array('label'=>'CALZADO', 'url'=>array('/listProductos/index/2'), 'visible'=>$auth->checkAccess('lista_productos',Yii::app()->user->id)),
                                                array('label'=>'OTROS', 'url'=>array('/listProductos/index/3'), 'visible'=>$auth->checkAccess('lista_productos',Yii::app()->user->id)),
                                                array('label'=>'CONTACTO', 'url'=>array('/site/index#contacto'),'visible'=>Yii::app()->user->isGuest),
                                        ),
                                )); ?>
                                
                                <?php
                                if(!Yii::app()->user->isGuest){
                                    $carroCount = Carro::model()->countCarro();
                                }
                                ?>
                                
                                <?php $this->widget('zii.widgets.CMenu',array(
                                        'htmlOptions' => array(
                                            'class'=>'nav navbar-nav navbar-right',
                                            'id'=>'menu',
                                        ),
                                        'submenuHtmlOptions' => array(
                                            'class'=>'dropdown-menu', 
                                        ),
                                        'items'=>array(
                                                array('label'=>'<span class="glyphicon glyphicon-shopping-cart"></span> Carro ('.$carroCount.')', 'url'=>array('/carro/list'), 'visible'=>$auth->checkAccess('carro',Yii::app()->user->id)),
                                                array('label'=>'ingresar', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
                                                array('label'=>'<span class="glyphicon glyphicon-cog"></span> panel <b class="caret"></b>', 'url'=>'#', 
                                                    'linkOptions'=>array(
                                                        'class'=>'dropdown-toggle',
                                                        'data-toggle'=>'dropdown',
                                                    ),
                                                    'items'=>array(
                                                        array('label'=>'Usuario', 'url'=>array('/usuario'),'visible'=>$auth->checkAccess('mantenedor_usuario',Yii::app()->user->id)),
                                                        array('label'=>'Producto', 'url'=>array('/producto'),'visible'=>$auth->checkAccess('mantenedor_producto',Yii::app()->user->id)),
                                                        array('label'=>'Pedidos', 'url'=>array('/pedido'),'visible'=>$auth->checkAccess('mantenedor_pedidos',Yii::app()->user->id)),
                                                        array('label'=>'Detalle Pedidos', 'url'=>array('/detallePedido'),'visible'=>$auth->checkAccess('mantenedor_detalle_pedido',Yii::app()->user->id)),
                                                    ),                                                    
                                                    'visible'=>$auth->checkAccess('mantenedor_usuario',Yii::app()->user->id) || $auth->checkAccess('mantenedor_productos',Yii::app()->user->id)),
                                                array('label'=>'<span class="glyphicon glyphicon-cog"></span> Cuenta <b class="caret"></b>', 'url'=>'#', 
                                                    'linkOptions'=>array(
                                                        'class'=>'dropdown-toggle',
                                                        'data-toggle'=>'dropdown',
                                                    ),
                                                    'items'=>array(
                                                        array('label'=>'Pedidos', 'url'=>array('pedido/list'),'visible'=>$auth->checkAccess('pedidos',Yii::app()->user->id)),
                                                        array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout')),
                                                    ),                                                    
                                                    'visible'=>!Yii::app()->user->isGuest),
                                        ),
                                        'encodeLabel' => false,
                                )); ?>

                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        
	<?php echo $content; ?>
        
        <br/><br/>
        <footer class="footer">
            <div style=" background-color: #232323; height: 130px; padding-top:30px;"  class="container-fluid">
                <p style="text-align: center; color: #9b9b9c;">&#169;2014 Escuela Naval "Arturo Prat"</p>
                <ul style="width:100px; margin:0px auto; " class="nav nav-pills nav-justified">
                    <li><a target="_blank" href="http://www.facebook.com/EscuelaNavalChile" title="facebook"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/facebook.png" /></a></li>
                    <li><a target="_blank" href="http://twitter.com/#!/Armada_Chile" title="twitter"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/twitter.png" /></a></li>
                </ul>
            </div>
        </footer>   
        
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap.js"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/collapse.js"></script>  
        
        <script type="text/javascript">
            $(document).ready(function() {
                $("#manoCelular").fadeIn(2000);
            });
        </script>

    </body>
</html>
