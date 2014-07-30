<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Pedidos Online',
        'sourceLanguage' => 'es_ES',
        'language'=>'es',
        'theme'=>'bootstrap',

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
	),

	'modules'=>array(
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'pphkk',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),
                'importcsv'=>array(
                    'path'=>'upload/importcsv/', // path to folder for saving csv file and file with import params
                ),
                'jbackup'=>array(
                    'path' => __DIR__.'/../_backup/', //Directory where backups are saved
                    'layout' => '//layouts/column2', //2-column layout to display the options
                    'filter' => 'accessControl', //filter or filters to the controller
                    'bootstrap' => false, //if you want the module use bootstrap components
                    'download' => true, // if you want the option to download
                    'restore' => true, // if you want the option to restore
                    'database' => true, //whether to make backup of the database or not
                    //directory to consider for backup, must be made array key => value array ($ alias => $ directory)
                    'directoryBackup'=>array( 
                       'folder/'=> __DIR__.'/../../folder/',
                    ),
                    //directory sebe not take into account when the backup
                    'excludeDirectoryBackup'=>array(
                       __DIR__.'/../../folder/folder2/',
                    ),
                    //files sebe not take into account when the backup
                    'excludeFileBackup'=>array(
                       __DIR__.'/../../folder/folder1/cfile.png',
                    ),
                    //directory where the backup should be done default Yii::getPathOfAlias('webroot')
                    'directoryRestoreBackup'=>__DIR__.'/../../' 
                 ),
	),

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
		// uncomment the following to enable URLs in path-format
		'urlManager'=>array(
			'showScriptName' => false,
			'urlFormat' => 'path',
                        'urlSuffix' => '',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
                'authManager'=>array(
                    'class' => 'CDbAuthManager',
                    'connectionID' => 'db',
                    //'defaultRoles'=>array('authenticated', 'guest'),
                ),
		/*
                'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),
                 * 
                 */
		// uncomment the following to use a MySQL database
		
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=pedidos_online',
			'emulatePrepare' => true,
			'username' => 'suits',
			'password' => 'cSfB6x',
			'charset' => 'utf8',
		),
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),                
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'pedidosonline@escuelanaval.cl',
	),
);