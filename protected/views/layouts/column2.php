<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
<table cellpadding="0" cellspacing="0" width="100%">
<tr><td style="vertical-align: top;">
<!-- <div class="span-19"> -->
	<div id="content" style="width: 900px;">
		<?php echo $content; ?>
	</div><!-- content -->
<!-- </div> -->
</td>
<td style="vertical-align: top; padding-right: 15px;">
 <div class="span-5 last">
	<div id="sidebar">
	<?php
		$this->beginWidget('zii.widgets.CPortlet', array(
			'title'=>'Operations',
		));
		$this->widget('zii.widgets.CMenu', array(
			'items'=>$this->menu,
			'htmlOptions'=>array('class'=>'operations'),
		));
		$this->endWidget();
	?>

	</div><!-- sidebar -->
 </div>
</td>
</tr>
</table>
<?php $this->endContent(); ?>