<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>

<h1>Welcome to <?php echo CHtml::encode(Yii::app()->name); ?></h1>

<?php if(!Yii::app()->user->isGuest):?>
<p>
   You last logged in on <?php echo Yii::app()->user->lastLogin; ?>.	
</p>
<?php endif;?>

<p><b><em>Maestro</em></b> is the <b><em>ERP for Engineers</em></b>, an 
Enterprise Resource Planning System that provides <b><em>Transparency with Trust</em></b>.</p>

<p>Maestro manages information relating to:
<ul>
	<li>Parts (part numbers, revisions, sources, bills-of-materials, drawings...)</li>
	<li>Projects (people, schedule, effort, material...)</li>
	<li>Issues (relationships, investigations, conclusions, actions...)</li>
	<li>Stock (serial numbers and quantities, purchasing, production, sales…)</li>
	<li>Files (engineering and ad hoc documents, revisions, author, editors, tags...)</li>
	<li>Users (user truth, role-based access control...)</li>
</ul></p>

<p><b><em>This is a demo of the <a href="http://www.github.com/dalers/maestro/">Maestro project</a>, a
proof-of-concept PLM system with data from the fictional Swift Construction Company (SCC). Not all
features are functional.</em></b></p>
