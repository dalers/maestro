<?php
/* @var $this OrderController */
/* @var $model Order */

$this->breadcrumbs=array(
	'Order'=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List All Orders', 'url'=>array('index')),
	array('label'=>'Create New Order', 'url'=>array('create')),
	array('label'=>'View This Order', 'url'=>array('view', 'id'=>$model->id)),
	//array('label'=>'Manage Order', 'url'=>array('admin')),
);
?>

<h1>Update Order <?php echo $model->id; ?></h1>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'om-order-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name'); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'type'); ?>
		<?php echo $form->textField($model,'type'); ?>
		<?php echo $form->error($model,'type'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status'); ?>
		<?php echo $form->textField($model,'status'); ?>
		<?php echo $form->error($model,'status'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'project_id'); ?>
		<?php echo $form->dropDownList($model,'project_id', CHtml::listData(Project::model()->findAll(array('order' => 'name')),'id','name'));?>
		<?php echo $form->error($model,'project_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

<hr>
<h2>Order Items</h2>	

<div class="row buttons">
	<?php echo CHtml::button("Add", array('submit'=>Yii::app()->createUrl("OrderItem/createOrderChild", array("id"=>$model->id)))); ?>
</div>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $dataProvider,
	'filter' => $oimodel,
    'id' => 'detail_childs_id',
    'showTableOnEmpty' => false,
    'emptyText' => 'This Order has no Order Items.',
	'columns' => array(
        array(
			'name'=>'part_id',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->part->PNPartNumber)',
		),
        array(
			'name'=>'desired_qty',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->desired_qty)',
		),
        array(
			'name'=>'shipped_qty',
			'type'=>'raw',
            'htmlOptions'=>array('style'=>'width: 10px; text-align: center;'),
			'value'=>'CHtml::encode($data->shipped_qty)',
		),
        array(
            'class'=>'CButtonColumn',
            'template' => '{editserial}{edit}      {delete}',
			'buttons'=>array
			(
				'editserial' => array
				(
					'label'=>'Edit Serialized Order Item',
					'visible'=>'!empty($data->part->PNUser1)',
					'imageUrl'=>Yii::app()->request->baseUrl.'/images/pencil.png',
					'url'=>'Yii::app()->createUrl("OrderItem/updateSerialized", array("id"=>$data->id))',
				),
				'edit' => array
				(
					'label'=>'Edit Order Item',
					'visible'=>'empty($data->part->PNUser1)',
					'imageUrl'=>Yii::app()->request->baseUrl.'/images/pencil.png',
					'url'=>'Yii::app()->createUrl("OrderItem/update", array("id"=>$data->id))',
				),
				'delete' => array
				(
					'label'=>'Remove Order Item',
					'imageUrl'=>Yii::app()->request->baseUrl.'/images/cross.png',
					'url'=>'Yii::app()->createUrl("OrderItem/delete", array("id"=>$data->id))',
				),
			),
        ),
	),
));

?>
</div><!-- form -->