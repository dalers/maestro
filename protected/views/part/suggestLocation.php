<?php
/* @var $this PartController */
/* @var $model Part */
/* @var $location StockLocation */
/* @var $bins array of bins */

$this->breadcrumbs=array(
	'Parts'=>array('index'),
	CHtml::encode($model->PNPartNumber),
);

$this->menu=array(
	array('label'=>'List Parts', 'url'=>array('index')),
	array('label'=>'View Part', 'url'=>array('view', 'id'=>$model->id)),
);
?>

<h1>Suggest Location for Part '<?php echo CHtml::encode($model->PNPartNumber); ?>'</h1>

<?php

echo CHtml::beginForm(array('SuggestLocation'), 'get');
echo CHtml::label('Location:', 'PNUser9');
echo CHtml::activeDropDownList($model, 'PNUser9', CHtml::listData($bins, 'bin_no', 'bin_no'));
//echo CHtml::endWidget();

?>