<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	//maintenance mode - Yii 1.1 Application Development Cookbook, p. 360
	'catchAllRequest'=>file_exists(dirname(__FILE__).'/.maintenance') && !(isset($_COOKIE['secret']) && $_COOKIE['secret']=="password") ? array('maintenance/index') : null,

	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Maestro',

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
	),

	'modules'=>array(
		//comment the following to disable the Gii tool
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>false,
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			//'ipFilters'=>array('127.0.0.1','::1'),
			'ipFilters'=>false,
		),
		'rbac'=>array(
			'class'=>'application.modules.rbacui.RbacuiModule',
			'userClass' => 'User',
			'userIdColumn' => 'id',
			'userNameColumn' => 'username',
			'rbacUiAdmin' => true,
			'rbacUiAssign' => true,
		),		
	),

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
			'class'=>'WebUser',
		),
		//uncomment the following to enable URLs in path-format
		/*
		'urlManager'=>array(
			'caseSensitive' => true,
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		*/
		'authManager'=>array(
			'class'=>'CDbAuthManager',
		    'connectionID'=>'db',
			'itemTable' => 'tbl_auth_item',
			'itemChildTable' => 'tbl_auth_item_child',
			'assignmentTable' => 'tbl_auth_assignment',
		),    
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=maestro',
			//'connectionString' => 'mysql:host=127.0.0.1;dbname=maestro', //may be required instead of above in some environments
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => 'appleton',
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
					'levels'=>'error, warning, info, trace',
				),
				//comment the following to not show log messages on web pages
				array(
					'class'=>'CWebLogRoute',
				),
			),
		),
		'ePdf' => array(
			'class'         => 'ext.yii-pdf.EYiiPdf',
			'params'        => array(
				//TODO remove mpdf (Maestro now exclusively uses Yii-PDF with HTML2PDF)
				'mpdf'     => array(
					'librarySourcePath' => 'application.vendor.mpdf.*',
					'constants'         => array(
						'_MPDF_TEMP_PATH' => Yii::getPathOfAlias('application.runtime'),
					),
					'class'=>'mpdf', // the literal class filename to be loaded from the vendors folder
					/*'defaultParams'     => array( // More info: http://mpdf1.com/manual/index.php?tid=184
						'mode'              => '', //  This parameter specifies the mode of the new document.
						'format'            => 'A4', // format A4, A5, ...
						'default_font_size' => 0, // Sets the default document font size in points (pt)
						'default_font'      => '', // Sets the default font-family for the new document.
						'mgl'               => 15, // margin_left. Sets the page margins for the new document.
						'mgr'               => 15, // margin_right
						'mgt'               => 16, // margin_top
						'mgb'               => 16, // margin_bottom
						'mgh'               => 9, // margin_header
						'mgf'               => 9, // margin_footer
						'orientation'       => 'P', // landscape or portrait orientation
					)*/
				),
				'HTML2PDF' => array(
					'librarySourcePath' => 'application.vendor.html2pdf.*',
					'classFile'         => 'html2pdf.class.php', // For adding to Yii::$classMap
					/*'defaultParams'     => array( // More info: http://wiki.spipu.net/doku.php?id=html2pdf:en:v4:accueil
						'orientation' => 'P', // landscape or portrait orientation
						'format'      => 'A4', // format A4, A5, ...
						'language'    => 'en', // language: fr, en, it ...
						'unicode'     => true, // TRUE means clustering the input text IS unicode (default = true)
						'encoding'    => 'UTF-8', // charset encoding; Default is UTF-8
						'marges'      => array(5, 5, 5, 8), // margins by default, in order (left, top, right, bottom)
					)*/
				)
			),
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'admin@swiftconstructioncompany.net',
		'pagesize' => 30,
		'partListPageSize' => 20,
		'PDFPageSize' => 'Letter', //allowed 'A4', 'Letter'
	),
);
