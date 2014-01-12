<?php
/* @var $this OmOrderItemController */
/* @var $model OmOrderItem */

$this->breadcrumbs=array(
	'Order Items'=>array('index'),
	'Update Order Item',
);

$this->menu=array(
	array('label'=>'List Order Items', 'url'=>array('index')),
	array('label'=>'Create Order Item', 'url'=>array('create')),
	array('label'=>'View Order Item', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Order Item', 'url'=>array('admin')),
);
?>

<h1>Update Serialized Order Item <?php echo $model->id; ?></h1>

<?php foreach(Yii::app()->user->getFlashes() as $key => $message) {
    if ($key=='counters') {continue;} //no need next line since 1.1.7
    echo "<div class='flash-{$key}'>{$message}</div>";
} ?>

<?php $this->renderPartial('_formSerialized', array('model'=>$model)); ?>