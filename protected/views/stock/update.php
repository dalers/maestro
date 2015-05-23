<?php
/* @var $this StockController */
/* @var $model Stock */

$this->breadcrumbs=array(
    'Stocks'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
    array('label'=>'List Stock', 'url'=>array('index')),
    array('label'=>'Create Stock', 'url'=>array('create')),
    array('label'=>'View Stock', 'url'=>array('view', 'id'=>$model->id)),
    array('label'=>'Manage Stock', 'url'=>array('admin')),
);
?>

<h1>Update Stock <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>