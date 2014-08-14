<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user common\models\User */

?>

Your registration was successful.<br />
Your login: <?= Html::encode($user->username) ?><br />
Your password: <?= Html::encode($user->pass)?>
