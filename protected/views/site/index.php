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

<p><b><em>Maestro</em></b><sup>TM</sup> is <b><em>The ERP for 
Engineers</em></b><sup>TM</sup>, an open-source ERP system
providing <b><em>Transparency with Trust</em></b><sup>TM</sup> to
design, manufacturing and support teams.</p> 

<p>Maestro manages information relating to projects, parts, stock, 
issues and people. Drawing inspiration from <a 
href="http://www.trilogydesign.com/"><em>Parts&Vendors</em></a><sup><em> 
TM</em></sup>, Maestro includes enterprise features, single-entry 
accounting, and true multi-user operation.</p> 

<p>This is the demo for the <a 
href="http://www.github.com/dalers/maestro/">Maestro ERP project</a>. Maestro
includes complete data for the (fictional) 
<b><em>Swift Construction Company</em></b> (the <b><em>SCC</em></b>),
including projects, parts, documents, stock (un-serialized, serialized
and lot controlled), issues and people.</p> 