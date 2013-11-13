<?php
/* @var $this PvCurController */
/* @var $model PvCur */

$this->breadcrumbs=array(
	'Pv Curs'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List PvCur', 'url'=>array('index')),
	array('label'=>'Create PvCur', 'url'=>array('create')),
	array('label'=>'Update PvCur', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PvCur', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PvCur', 'url'=>array('admin')),
);
?>

<h1>View PvCur #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'CURCurrencyName',
		'CURExchangeRate',
		'CURCurrencyChar',
		'CURFormat',
		'CURFormatExt',
	),
)); ?>
