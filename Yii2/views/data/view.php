<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\Daftarruangan;

/* @var $this yii\web\View */
/* @var $model app\models\Data */

$this->title = $model->user->username;
// $this->title = '';
$this->params['breadcrumbs'][] = ['label' => 'Datas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="data-view">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

    <p>
        <?= Html::a('Reschedule', ['update', 'id' => $model->data_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Hapus', ['delete', 'id' => $model->data_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'attribute'=>'Nama',
                'value'=>$model->user->fullname,
            ],
            'start_time',
            'end_time',
            'ruangan.ruangan_name',
            'kepentingan',
            // [
            //     'attribute'=>'ruangan_id',
            //     'label'=>'Ruangan ID',
            //     'value'=>function($model){
            //         return $model->daftarruangan->ruangan_id;
            //     },
            // ],

            // [
            //     'attribute'=>'Nama',
            //     'value'=>$model->daftarruangan->ruangan_id,
            // ],
            // 'user_id',
            // 'status',
        ],
    ]) ?>

</div>
