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

<p>This is the <a href="http://www.github.com/dalers/maestro/">Maestro project</a> demo.</p>

<p><b><em>Maestro</em></b><sup>TM</sup> is the <b><em>ERP for Engineers</em></b><sup>TM</sup>, an Open-Source
Enterprise Resource Planning System that provides <b><em>Transparency with Trust</em></b><sup>TM</sup>
to design, manufacturing and support teams.</p>

<p>Maestro manages information relating to:
<ul>
	<li>Parts (part numbers, revisions, sources, bills-of-materials, drawings...)</li>
	<li>Projects (people, schedule, effort, material...)</li>
	<li>Issues (relationships, investigations, conclusions, actions...)</li>
	<li>Stock (serial numbers and quantities, purchasing, production, sales…)</li>
	<li>Files (engineering and ad hoc documents, revisions, author, editors, tags...)</li>
	<li>Users (user truth, role-based access control...)</li>
</ul></p>

<p>Maestro includes data for the (fictional) <b><em>Swift Construction
			Company</em></b> (CC).</p>