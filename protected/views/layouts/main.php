<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<body>

<div class="container" id="page">

	<div id="header">
		<div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>
	</div><!-- header -->

	<div id="mainmenu">
		<?php $this->widget('zii.widgets.CMenu',array(
			'items'=>array(
				array('label'=>'Home', 'url'=>array('/site/index')),
				array('label'=>'Parts', 'url'=>array('/part/index')),
				array('label'=>'Projects', 'url'=>array('/project/index')),
				array('label'=>'Issues', 'url'=>array('/issue/index')),
				array('label'=>'Stock', 'url'=>array('/stock/index')),
				array('label'=>'Orders', 'url'=>array('/order/index')),
				array('label'=>'Docs', 'url'=>array('/site/page', 'view'=>'docs')),
				array('label'=>'Users', 'url'=>array('/site/page', 'view'=>'users')),
				array('label'=>'Help', 'url'=>array('/site/page', 'view'=>'help')),
				array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
				array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
			),
		)); ?>
	</div><!-- mainmenu -->
	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('zii.widgets.CBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Copyright &copy; <?php echo date('Y'); ?> by Maestro developers.<br/>
		Maestro is licensed according to the <a href="http://opensource.org/licenses/BSD-2-Clause">BSD 2-Clause license</a>.<br/>
		<em>Maestro</em><sup>TM</sup>, <em>The ERP for Engineers</em><sup>TM</sup>, and <em>Transparency with Trust</em><sup>TM</sup> are used under <a href="https://github.com/dalers/maestro/wiki/Maestro-Trademark-And-Logo-Policy">license</a>.<br/>
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
