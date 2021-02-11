<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Daftarruangan */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="daftarruangan-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ruangan_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'keterangan')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fasilitas')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'kapasitas')->textInput(['type' => 'number']) ?>
    <?= $form->field($model, 'status')->hiddenInput(['value'=> 'Tertutup'])->label(false); ?>
    <!-- <?= $form->field($model, 'ip_device')->textInput(['maxlength' => true]) ?> -->

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
