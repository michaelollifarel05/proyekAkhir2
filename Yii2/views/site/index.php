<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DaftarruanganSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Daftar Ruangan';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="daftarruangan-index">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?php foreach ($dataProvider as $data) {?>
      <div class="site-index">
        <div class="col-lg-6 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-blue">
              <div class="inner">
                <h3><?= $data['ruangan_name'] ?></h3>
                <!-- <hr>   -->
                <table class="table">
                  <tr>
                    <td>Keterangan Ruangan</td>
                    <td>:</td>
                    <td><?= $data['keterangan'] ?></td>
                  </tr>
                  <tr>
                    <td>Kapasitas Ruangan</td>
                    <td>:</td>
                    <td><?= $data['kapasitas'] ?></td>
                  </tr>
                  <tr>
                    <td>Fasilitas Ruangan</td>
                    <td>:</td>
                    <td><?= $data['fasilitas'] ?></td>
                  </tr>

                </table>
                <!-- <h5><?php echo "Keterangan kelas : "; ?><?= $data['keterangan'] ?></h5>
                <h6><?php echo "Kapasitas : "; ?><?= $data['kapasitas'] ?></h6>
                <h6><?php echo "Fasilitas : "; ?><?= $data['fasilitas'] ?></h6> -->
                  <!-- <hr> -->
                  <?php 
                  if (strcmp($data['status'],"Terbuka")) {  
                  ?>
                  <p>Status ruangan : <span class="label label-danger"><?= $data['status'] ?></span></p>
                <?php } else {
                  ?>
                  <p>Status ruangan : <span class="label label-success"><?= $data['status'] ?></span></p>
                <?php } ?>

                
                
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              
            </div>
          </div>
      </div>  
   
    <?php 

    } 
    date_default_timezone_set("Asia/Bangkok");
    $dateTimeNow =  date("Y-m-d H:i:s");

    echo($dateTimeNow)?>
    
</div>

