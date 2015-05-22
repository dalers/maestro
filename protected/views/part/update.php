<?php
/* @var $this PartController */
/* @var $model Part */

$this->breadcrumbs=array(
	'Parts' => array('index'),
	CHtml::encode($model->PNPartNumber) => array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Parts', 'url'=>array('index')),
	array('label'=>'Create part', 'url'=>array('create')),
	array('label'=>'View Part', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Parts', 'url'=>array('admin')),
);
?>

<h1>Update Part '<?php echo CHtml::encode($model->PNPartNumber); ?>'</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>