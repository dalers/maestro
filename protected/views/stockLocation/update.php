<?php
/* @var $this StockLocationController */
/* @var $model StockLocation */

$this->breadcrumbs=array(
	'Stock Locations'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List StockLocation', 'url'=>array('index')),
	array('label'=>'Create StockLocation', 'url'=>array('create')),
	array('label'=>'View StockLocation', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage StockLocation', 'url'=>array('admin')),
);
?>

<h1>Update StockLocation <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>