<?php
/* @var $this StockSerialController */
/* @var $model StockSerial */

$this->breadcrumbs=array(
	'Stock Serials'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Stock Items', 'url'=>array('index')),
	array('label'=>'Create Stock Item', 'url'=>array('create')),
	array('label'=>'View Stock Item', 'url'=>array('view', 'id'=>$model->id)),
	//array('label'=>'Manage Stock Item', 'url'=>array('admin')),
);
?>

<h1>Update Stock Item <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>