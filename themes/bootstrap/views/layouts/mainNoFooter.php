<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut Icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/iconos/pedidosOnline.ico"/>
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
                                                array('label'=>'AYUDA <b class="caret"></b>', 'url'=>'#','visible'=>Yii::app()->user->isGuest,'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>'dropdown'),
                                                    'items'=>array(
                                                    array('label'=>'Modo de uso', 'url'=>array('/site/support')),
                                                    array('label'=>'Términos y Condiciones', 'url'=>Yii::app()->request->baseUrl.'/images/condiciones.pdf', 'linkOptions'=>array('class'=>'fancypdf'))
                                                    )),
                                                array('label'=>'CONTACTO', 'url'=>array('/site/index#contacto'),'visible'=>Yii::app()->user->isGuest),
                                        ),
                                        'encodeLabel' => false,
                                )); ?>
                                
                                <?php $this->widget('zii.widgets.CMenu',array(
                                        'htmlOptions' => array(
                                            'class'=>'nav navbar-nav navbar-right',
                                            'id'=>'menu',
                                        ),
                                        'submenuHtmlOptions' => array(
                                            'class'=>'dropdown-menu', 
                                        ),
                                        'items'=>array(
                                                array('label'=>'ingresar', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
                                                array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
                                        ),
                                )); ?>

                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

	<?php echo $content; ?>

                
        
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap.js"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/collapse.js"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl ?>/js/fancybox/jquery.fancybox.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $("#manoCelular").fadeIn(2000);
            });
            $(".fancypdf").click(function(){
                $.fancybox({
                  type: 'html',
                  autoSize: false,
                  content: '<embed src="'+this.href+'#nameddest=self&page=1&view=FitH,0&zoom=80,0,0" type="application/pdf" height="99%" width="100%" />',
                  beforeClose: function() {
                    $(".fancybox-inner").unwrap();
                  }
                }); //fancybox
                return false;
               }); //click
        </script>

    </body>
</html>
