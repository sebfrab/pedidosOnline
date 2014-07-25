<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut Icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/iconos/pedidosOnline.ico"/>
        <meta name="language" content="es" />
        <meta name="author" content="Sebastian Franco Brantes UTFSM - ¿y por qué no? - seb.frab@gmail.com"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="Keywords" content="pedidos, venta, online, escuela naval, cadete, armada, chile"/>
        <meta name="description" content="Sistema de pedidos online, para cadetes de la Escuela Naval Arturo Prat" />
        <meta name="language" content="es" />
        <meta http-equiv="X-UA-Compatible" content="IE=7,8,9" />  
        
        <!-- Bootstrap 3.0 -->
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/general.css" />
        <?php Yii::app()->clientScript->registerCoreScript('jquery'); ?>
        
        <!-- Add fancyBox -->
        <link rel="stylesheet" href="<?php echo Yii::app()->request->baseUrl ?>/js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
        
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-53199117-1', 'auto');
            ga('send', 'pageview');
        </script>
        
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

    <?php
        $auth=Yii::app()->authManager;
        //$task=$auth->createTask('backup','acceso a los backup, realizarlo, eliminarlos y restauración');
        //$task=$auth->createTask('mantenedor_tipo_usuario','acceso total al mantenedor de los tipos de usuario');
        //$task=$auth->createTask('mantenedor_categorias','acceso total al mantenedor de categorias');
        //$task=$auth->createTask('mantenedor_subcategorias','acceso total al mantenedor de subcategorias');
        //$task=$auth->createTask('import_csv','importación de datos desde archivos .csv');
        //$task=$auth->createTask('mantenedor_detalle_pedido','acceso completo a los detalles del pedido');
        //$task=$auth->createTask('pedidos','acceso a los pedidos');
        //$task=$auth->createTask('mantenedor_pedidos','acceso completo a los pedidos realizados');
        //$task=$auth->createTask('mantenedor_usuario','acceso completo al mantenedor de usuarios');
        //$task=$auth->createTask('lista_productos','acceso para visualizar la lista de productos del sistema');
        //$task=$auth->createTask('carro_pedidos','acceso al carro de compra');
        //$task=$auth->createTask('mantenedor_producto','acceso completo al mantenedor de productos');
    ?>
    
    <body>
        <header>
            <nav role="navigation">
                <div class="menu navbar navbar-fixed-top">
                    <div class="navbar-default navbar-collapse">
                        <div class="container">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".bs-js-navbar-collapse">
                                    <span class="sr-only">Toggle</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a href="<?php echo Yii::app()->createUrl('./'); ?>" class="navbar-brand"><p style="color: #297fb8;">Pedidos<b>Online</b></p></a>
                            </div>
                            <div class="navbar-collapse bs-js-navbar-collapse collapse">
                                
                                <?php $this->widget('zii.widgets.CMenu',array(
                                        'htmlOptions' => array(
                                            'class'=>'menu nav navbar-nav navbar',
                                        ),
                                        'submenuHtmlOptions' => array(
                                            'class'=>'dropdown-menu', 
                                        ),
                                        'items'=>array(
                                                array('label'=>'VESTIMENTA', 'url'=>array('/listProductos/index/1'), 'visible'=>$auth->checkAccess('lista_productos',Yii::app()->user->id)),
                                                array('label'=>'CALZADO', 'url'=>array('/listProductos/index/2'), 'visible'=>$auth->checkAccess('lista_productos',Yii::app()->user->id)),
                                                array('label'=>'OTROS', 'url'=>array('/listProductos/index/3'), 'visible'=>$auth->checkAccess('lista_productos',Yii::app()->user->id)),
                                                array('label'=>'AYUDA', 'url'=>array('/site/support'),'visible'=>Yii::app()->user->isGuest),
                                                array('label'=>'CONTACTO', 'url'=>array('/site/index#contacto'),'visible'=>Yii::app()->user->isGuest),
                                        ),
                                )); ?>
                                
                                <?php
                                $carroCount = 0;
                                if(!Yii::app()->user->isGuest){
                                    $carroCount = Carro::model()->countCarro();
                                }
                                ?>
                                
                                <?php
                                if($auth->checkAccess('lista_productos',Yii::app()->user->id)){
                                ?>
                                <form style="margin-right: 0px; padding-right: 0px; padding-left: 0px;" class="navbar-form navbar-left" role="search" method="get" action="<?php echo Yii::app()->createUrl('listProductos/search'); ?>">
                                    <div class="form-group">
                                        <input id="search" type="text" name="search" class="form-control" placeholder="Buscar"/>
                                    </div>
                                </form>
                                <?php
                                }
                                ?>

                                <?php $this->widget('zii.widgets.CMenu',array(
                                        'htmlOptions' => array(
                                            'class'=>'menu nav navbar-nav navbar-right',
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
                                                        array('label'=>'Backup', 'url'=>array('/jbackup'),'visible'=>$auth->checkAccess('backup',Yii::app()->user->id)),
                                                        array('label'=>'Categoria', 'url'=>array('/categoria'),'visible'=>$auth->checkAccess('mantenedor_categorias',Yii::app()->user->id)),
                                                        array('label'=>'Detalle Pedidos', 'url'=>array('/detallePedido'),'visible'=>$auth->checkAccess('mantenedor_detalle_pedido',Yii::app()->user->id)),
                                                        array('label'=>'Import .csv', 'url'=>array('/importcsv'),'visible'=>$auth->checkAccess('import_csv',Yii::app()->user->id)),
                                                        array('label'=>'Pedidos', 'url'=>array('/pedido'),'visible'=>$auth->checkAccess('mantenedor_pedidos',Yii::app()->user->id)),
                                                        array('label'=>'Producto', 'url'=>array('/producto'),'visible'=>$auth->checkAccess('mantenedor_producto',Yii::app()->user->id)),
                                                        array('label'=>'Subcategoria', 'url'=>array('/subcategoria'),'visible'=>$auth->checkAccess('mantenedor_subcategorias',Yii::app()->user->id)),
                                                        array('label'=>'Tipo de usuario', 'url'=>array('/tipoUsuario'),'visible'=>$auth->checkAccess('mantenedor_tipo_usuario',Yii::app()->user->id)),
                                                        array('label'=>'Usuario', 'url'=>array('/usuario'),'visible'=>$auth->checkAccess('mantenedor_usuario',Yii::app()->user->id)),
                                                    ),                                                    
                                                    'visible'=>$auth->checkAccess('mantenedor_usuario',Yii::app()->user->id) || $auth->checkAccess('mantenedor_productos',Yii::app()->user->id)),
                                                array('label'=>'<span class="glyphicon glyphicon-cog"></span> Cuenta <b class="caret"></b>', 'url'=>'#', 
                                                    'linkOptions'=>array(
                                                        'class'=>'dropdown-toggle',
                                                        'data-toggle'=>'dropdown',
                                                    ),
                                                    'items'=>array(
                                                        array('label'=>'Pedidos', 'url'=>array('pedido/list'),'visible'=>$auth->checkAccess('pedidos',Yii::app()->user->id)),
                                                        array('label'=>'Cambio de Contraseña', 'url'=>array('/usuario/changepassword/'.Yii::app()->user->id)),
                                                        array('label'=>'Ayuda', 'url'=>array('/site/support')),
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
                <ul style="width:100px; margin:0px auto;" class="nav nav-pills nav-justified" id="redesSociales">
                    <li><a target="_blank" href="http://www.facebook.com/EscuelaNavalChile" title="facebook"><img alt="facebook" src="<?php echo Yii::app()->request->baseUrl; ?>/images/facebook.png" /></a></li>
                    <li><a target="_blank" href="http://twitter.com/#!/Armada_Chile" title="twitter"><img alt="twitter" src="<?php echo Yii::app()->request->baseUrl; ?>/images/twitter.png" /></a></li>
                </ul>
            </div>
        </footer>   
        
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap.js"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/collapse.js"></script>  
        
        <!-- Add fancyBox -->
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl ?>/js/fancybox/jquery.fancybox.js"></script>
        
        
        <script type="text/javascript">
            $(document).ready(function() {
                $("#manoCelular").fadeIn(2000);
            });
            
            $(".fancybox").fancybox();
            
        </script>

    </body>
</html>
