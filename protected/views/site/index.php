<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>

<h1>Welcome to <i><?php echo CHtml::encode(Yii::app()->name); ?></i><sup>TM</sup></h1>

<?php if(!Yii::app()->user->isGuest):?>
<p>
   You last logged in on <?php echo Yii::app()->user->lastLogin; ?>.	
</p>
<?php endif;?>

<p>This is the demo for the <a 
		href="http://www.github.com/dalers/maestro/">Maestro ERP project</a>.</p>

<p><b><em>Maestro</em></b><sup>TM</sup> is the <b><em>ERP for Engineers</em></b><sup>TM</sup>, an open-source
enterprise resource planning system that provides <b><em>Transparency with Trust</em></b><sup>TM</sup>
to design, manufacturing and support teams. Maestro manages information relating to projects, parts,
stock, issues and people.</p>

<p>Maestro includes complete data for the (fictional) <b><em>Swift Construction
Company</em></b> (the <b><em>SCC</em></b>), including projects, parts, documents,
stock (un-serialized, serialized and lot controlled), issues and people.</p> 