<?php
 function rupiah($angka){
                            
  $hasil_rupiah = "Rp. " . number_format($angka,0,',','.');
  return $hasil_rupiah;

}
?>

    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="#"><?=$setting->app_name;?></a>
          <a class="navbar-brand brand-logo-mini" href="#">WP</a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" action="#">
              <div class="input-group">
                <div class="input-group-prepend bg-transparent">
                  <i class="input-group-text border-0 mdi mdi-magnify"></i>
                </div>
                <input type="text" class="form-control bg-transparent border-0" placeholder="Search projects">
              </div>
            </form>
          </div>
          <ul class="navbar-nav navbar-nav-right">

            <li class="nav-item d-none d-lg-block full-screen-link">
              <a class="nav-link">
                <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
              </a>
            </li>

            <li class="nav-item dropdown">
              <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                <i class="mdi mdi-bell-outline"></i>

              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                <h6 class="p-3 mb-0">Notifications</h6>


              </div>
            </li>
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                  <img src="<?=base_url("assets/purple/assets/images/faces/face1.jpg")?>" alt="image">
                  <span class="availability-status online"></span>
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black"><?=$current_user->username?></p>
                </div>
              </a>
              <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">

                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="<?=base_url("index.php/auth/logout")?>">
                  <i class="mdi mdi-logout mr-2 text-primary"></i> Signout </a>
              </div>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
         <!-- partial -->
   <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <?php $this->load->view('layouts/navigasi',['menu'=>'dashboard']) ?>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">

            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                  <i class="mdi mdi-home"></i>
                </span> Your <?=$setting->app_name;?>
              </h3>
              <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">
                    <span></span>Dashboard <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                  </li>
                </ul>
              </nav>
            </div>

            <div class="row">
              <div class="col-md-12">
                <div class="row">
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card bg-gradient-danger card-img-holder text-white">
                  <div class="card-body">
                    <img  src="<?=base_url("assets/purple/assets/images/dashboard/circle.svg")?>"  class="card-img-absolute" alt="circle-image" />
                    Remaining
                    <h2 class="mb-3"><?=$remaining?> <span style="font-size:13pt">Days</span> </h2>
                    <p class="card-text">Active until <?= $end_date?> </p>
                   <a class="btn btn-bg btn-success float-left" href="<?=base_url('index.php/service/addUptime')?>" onclick=" return confirm('are you sure ? to increase the active period ?')">Add Uptime</a>
                  </div>
                </div>
              </div>
              <div class="col-md-8 grid-margin stretch-card">
                <div class="card bg-gradient-info card-img-holder text-white">
                  <div class="card-body">
                    <img  src="<?=base_url("assets/purple/assets/images/dashboard/circle.svg")?>"  class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Service you have <b><?=$package->name?></b><i class="mdi mdi-bookmark-outline mdi-24px float-right"></i></h4>
                    <div class="slider-box">
                      <div class="row">
                        <div class="col-lg-9">
                        </div>
                        <div class="col-lg-3">
                          <a class="ml-auto" href="./service">
                          <button class="btn btn-success btn-sm" >Show Detail </button>
                        </a>
                        <a class="ml-auto" href="./change_package" >
                          <button class="btn btn-danger btn-sm" style="margin-top:10px">Change Package</button>
                        </a>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-4 d-none d-sm-block">
                        <div class="service-container">
                          <div class="product d-flex">
                          <?=sizeof($devices)?>  <span style="width:6px;"></span>
                            <!-- <img class="icon-product mr-2 align-self-center" src="/images/icon/icon-wifi-grey.svg"> -->
                           
                             <span class="text-product align-self-center">Device Active </span>

                            </div>
                            <div class="mb-2"><br>
                             <b> <span class="text-numeric"><?=$package->device_max?></span> </b>
                               <span class="mb-1"> ( Max Added )</span>
                              </div>
                              <!-- <a href="#"><h5 style="color:white;">Lihat rincian</h5></a> -->
                            </div>
                          </div>

                        <div class="col-4 d-none d-sm-block">
                          <div class="service-container" style="border-right: 0px;">
                          <div class="product d-flex">
                          <i class="mdi mdi-file-document "></i> <span style="width:10px;"></span>
                            <span class="text-product align-self-center">Messages</span>
                          </div>
                          <div class="mb-3"><br>
                            <b><span class="text-numeric">Unlimited</span>
                            <span class="text-unit">Message</span></b>
                            </div>
                            <!-- <a href="#"><h5 style="color:white;">Lihat rincian</h5></a> -->
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
             
              </div></div>
            <div class="col-md-12">
            <h3 class="page-title">
             </span> Special Promotion
           </h3>
           <br>
            <div class="row">
           
           <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Discount 15%</h4>
                    <div class="media">
                      <i class="mdi mdi-earth icon-md text-info d-flex align-self-start mr-3"></i>
                      <div class="media-body">
                        <p class="card-text">get discount up to 15%</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            
            </div>
            </div>
            </div>
     
           



          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="container-fluid clearfix">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © kejarkoding.com 2021</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Thanks to <a href="#" target="_blank">Allah Ta'ala </a> for Everiting</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>