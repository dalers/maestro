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
		href="http://www.github.com/dalers/maestro/">Maestro project</a>.</p>

<p><b><em>Maestro</em></b><sup>TM</sup> is the <b><em>ERP for Engineers</em></b><sup>TM</sup>, an Open-Source
Enterprise Resource Planning System that provides <b><em>Transparency with Trust</em></b><sup>TM</sup>
to design, manufacturing and support teams.</p>

<p>Maestro manages information relating to:
<ul>
	<li>Parts (part numbers, revisions, sources, bills-of-materials, drawings...)</li>
	<li>Projects (people, schedule, effort, material...)</li>
	<li>Issues (initiate, investigate, conclusion, action, closure)</li>
	<li>Stock (serial numbers, quantities, kitting and production...)</li>
	<li>Documents (revisions, author, editor, tags)</li>
	<li>People (users, customers, suppliers)</li>
</ul></p>

<p>Maestro includes data for the (fictional) <b><em>Swift Construction
			Company</em></b> (the <b><em>SCC</em></b>).</p>