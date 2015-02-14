<!doctype html>
<head>
  <meta charset="utf-8" />
  <title><?php echo CHtml::encode(Yii::app()->name)?> is under maintenance</title>
</head>
<body>
  <h1><?php echo CHtml::encode(Yii::app()->name)?> is under maintenance</h1>
  <p>It should be available again soon, but if it seems to be taking too long please email <?php echo Yii::app()->params['adminEmail']?>.</p>
  <p>Otherwise, it's a good time to get a cup of coffee and catch up on email...</p>
</body>