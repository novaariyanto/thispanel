

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
        <?php $this->load->view('layouts/navigasi',['menu'=>'message']) ?>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">

            <div class="page-header">

              <h3 class="page-title">
                </span> Ticket
              </h3>

              <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Ticket</a></li>
                  <li class="breadcrumb-item active" aria-current="page">List</li>
                </ul>

              </nav>

            </div>
           <!-- <a href="<?=base_url('/index.php/messageOut/add')?>" class="btn btn-sm btn-primary" style="margin-top:-35px;margin-right:-4px" >Add </a> -->
           <div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-body">
                    <div class="d-sm-flex pb-4 mb-4 border-bottom">
                      <div class="d-flex align-items-center">
                        <h5 class="page-title mb-n2">Open Tickets</h5>
                        <p class="mt-2 mb-n1 ml-3 text-muted">230 Tickets</p>
                      </div>
                      <form class="ml-auto pt-2 pt-sm-0 d-flex align-items-stretch w-50 justify-content-end">
                        <input type="text" class="form-control w-50" placeholder="Search">
                        <button type="submit" class="btn btn-gradient-success no-wrap ml-4">Search Ticket</button>
                      </form>
                    </div>
                    <div class="nav-scroller">
                      <ul class="nav nav-tabs tickets-tab-switch" role="tablist">
                        <li class="nav-item">
                          <a class="nav-link rounded active" id="open-tab" data-toggle="tab" href="#open-tickets" role="tab" aria-controls="open-tickets" aria-selected="true">Open Tickets <div class="badge">13</div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link rounded" id="pending-tab" data-toggle="tab" href="#pending-tickets" role="tab" aria-controls="pending-tickets" aria-selected="false">Pending Tickets <div class="badge">50 </div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link rounded" id="onhold-tab" data-toggle="tab" href="#onhold-tickets" role="tab" aria-controls="onhold-tickets" aria-selected="false">On-hold Tickets <div class="badge">29 </div>
                          </a>
                        </li>
                      </ul>
                    </div>
                    <div class="tab-content border-0 tab-content-basic">
                      <div class="tab-pane fade active show" id="open-tickets" role="tabpanel" aria-labelledby="open-tickets">
                        <div class="tickets-date-group"><i class="mdi mdi-calendar"></i>Tuesday, 21 May 2019 </div>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39033 - Design Admin Dashboard</h5>
                              <div class="badge badge-gradient-success">New</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face13.jpg")?>" alt="profile image">
                              <span>Brett Gonzales</span>
                              <span><i class="mdi mdi-clock-outline"></i>03:34AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face16.jpg")?>" alt="profile image">
                            <span class="text-muted">Frank Briggs</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Wireframe</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39040 - Website Redesign</h5>
                              <div class="badge badge-gradient-info">Pro</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face18.jpg")?>" alt="profile image">
                              <span>Olivia Cross</span>
                              <span><i class="mdi mdi-clock-outline"></i>04:23AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face14.jpg")?>" alt="profile image">
                            <span class="text-muted">Frank Briggs</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Wireframe</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39041 - Bootstrap Framework not working</h5>
                              <div class="badge badge-gradient-info">Pro</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face11.jpg")?>" alt="profile image">
                              <span>Leah Frank</span>
                              <span><i class="mdi mdi-clock-outline"></i>04:24AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face10.jpg")?>" alt="profile image">
                            <span class="text-muted">Emilie Barnett</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Deployed</span>
                          </div>
                        </a>
                        <div class="tickets-date-group"><i class="mdi mdi-calendar"></i>Tuesday, 20 Apr,2019 </div>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39045 - Design Admin Dashboard</h5>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face18.jpg")?>" alt="profile image">
                              <span>Luella Sparks</span>
                              <span><i class="mdi mdi-clock-outline"></i>12:54PM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face6.jpg")?>" alt="profile image">
                            <span class="text-muted">Hunter Garza</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Concept</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#29033 - Set up the marketplace strategy </h5>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face15.jpg")?>" alt="profile image">
                              <span>Mitchell Barber</span>
                              <span><i class="mdi mdi-clock-outline"></i>4:19AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face7.jpg")?>" alt="profile image">
                            <span class="text-muted">Michael Campbell</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Wireframe</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#29033 - Design Admin Dashboard</h5>
                              <div class="badge badge-gradient-success">New</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face13.jpg")?>" alt="profile image">
                              <span>Rhoda Jimenez</span>
                              <span><i class="mdi mdi-clock-outline"></i>01:27PM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face10.jpg")?>" alt="profile image">
                            <span class="text-muted">Maria Cook</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Deployed</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#29033 - Compose newsletter for the big launch</h5>
                              <div class="badge badge-gradient-success">New</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face17.jpg")?>" alt="profile image">
                              <span>Alta Little</span>
                              <span><i class="mdi mdi-clock-outline"></i>06:16PM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face20.jpg")?>" alt="profile image">
                            <span class="text-muted">Juan Little</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Concept</span>
                          </div>
                        </a>
                      </div>
                      <div class="tab-pane fade" id="pending-tickets" role="tabpanel" aria-labelledby="pending-tickets">
                        <div class="tickets-date-group"><i class="mdi mdi-calendar"></i>Tuesday, 21 May 2019 </div>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39045 - Design Admin Dashboard</h5>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face18.jpg")?>" alt="profile image">
                              <span>Luella Sparks</span>
                              <span><i class="mdi mdi-clock-outline"></i>12:54PM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face6.jpg")?>" alt="profile image">
                            <span class="text-muted">Hunter Garza</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Concept</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39033 - Design Admin Dashboard</h5>
                              <div class="badge badge-gradient-success">New</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face13.jpg")?>" alt="profile image">
                              <span>Brett Gonzales</span>
                              <span><i class="mdi mdi-clock-outline"></i>03:34AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face16.jpg")?>" alt="profile image">
                            <span class="text-muted">Frank Briggs</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Wireframe</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#29033 - Compose newsletter for the big launch</h5>
                              <div class="badge badge-gradient-success">New</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face17.jpg")?>" alt="profile image">
                              <span>Alta Little</span>
                              <span><i class="mdi mdi-clock-outline"></i>06:16PM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face20.jpg")?>" alt="profile image">
                            <span class="text-muted">Juan Little</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Concept</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39040 - Website Redesign</h5>
                              <div class="badge badge-gradient-info">Pro</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face18.jpg")?>" alt="profile image">
                              <span>Olivia Cross</span>
                              <span><i class="mdi mdi-clock-outline"></i>04:23AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face14.jpg")?>" alt="profile image">
                            <span class="text-muted">Frank Briggs</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Wireframe</span>
                          </div>
                        </a>
                        <div class="tickets-date-group"><i class="mdi mdi-calendar"></i>Tuesday, 20 Apr,2019 </div>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#29033 - Set up the marketplace strategy </h5>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face15.jpg")?>" alt="profile image">
                              <span>Mitchell Barber</span>
                              <span><i class="mdi mdi-clock-outline"></i>4:19AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face7.jpg")?>" alt="profile image">
                            <span class="text-muted">Michael Campbell</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Wireframe</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39041 - Bootstrap Framework not working</h5>
                              <div class="badge badge-gradient-info">Pro</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face11.jpg")?>" alt="profile image">
                              <span>Leah Frank</span>
                              <span><i class="mdi mdi-clock-outline"></i>04:24AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face10.jpg")?>" alt="profile image">
                            <span class="text-muted">Emilie Barnett</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Deployed</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#29033 - Design Admin Dashboard</h5>
                              <div class="badge badge-gradient-success">New</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face13.jpg")?>" alt="profile image">
                              <span>Rhoda Jimenez</span>
                              <span><i class="mdi mdi-clock-outline"></i>01:27PM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face10.jpg")?>" alt="profile image">
                            <span class="text-muted">Maria Cook</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Deployed</span>
                          </div>
                        </a>
                      </div>
                      <div class="tab-pane fade" id="onhold-tickets" role="tabpanel" aria-labelledby="onhold-tickets">
                        <div class="tickets-date-group"><i class="mdi mdi-calendar"></i>Tuesday, 21 May 2019 </div>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#39040 - Website Redesign</h5>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face18.jpg")?>" alt="profile image">
                              <span>Olivia Cross</span>
                              <span><i class="mdi mdi-clock-outline"></i>04:23AM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face14.jpg")?>" alt="profile image">
                            <span class="text-muted">Frank Briggs</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Wireframe</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#29033 - Design Admin Dashboard</h5>
                              <div class="badge badge-gradient-success">New</div>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face13.jpg")?>" alt="profile image">
                              <span>Rhoda Jimenez</span>
                              <span><i class="mdi mdi-clock-outline"></i>01:27PM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face10.jpg")?>" alt="profile image">
                            <span class="text-muted">Maria Cook</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Deployed</span>
                          </div>
                        </a>
                        <a href="#" class="tickets-card row">
                          <div class="tickets-details col-lg-8">
                            <div class="wrapper">
                              <h5>#29033 - Compose newsletter for the big launch</h5>
                            </div>
                            <div class="wrapper text-muted d-none d-md-block">
                              <span>Assigned to</span>
                              http://localhost/assets/images/faces/face18.jpg
                              <img class="assignee-avatar" src="<?=base_url("assets/purple/assets/images/faces/face17.jpg")?>" alt="profile image">
                              <span>Alta Little</span>
                              <span><i class="mdi mdi-clock-outline"></i>06:16PM</span>
                            </div>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <img class="img-xs rounded-circle" src="<?=base_url("assets/purple/assets/images/faces/face20.jpg")?>" alt="profile image">
                            <span class="text-muted">Juan Little</span>
                          </div>
                          <div class="ticket-float col-lg-2 col-sm-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Concept</span>
                          </div>
                        </a>
                      </div>
                    </div>
                    <nav class="mt-4">
                      <ul class="pagination">
                        <li class="page-item">
                          <a class="page-link" href="#">
                            <i class="mdi mdi-chevron-left"></i>
                          </a>
                        </li>
                        <li class="page-item active">
                          <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">
                            <i class="mdi mdi-chevron-right"></i>
                          </a>
                        </li>
                      </ul>
                    </nav>
                  </div>
                </div>
              </div>
            </div>
           <div class="row">

            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                   <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>Number</th>
                          <th>Device</th>
                          <th>Message</th>
                          <th>Recipient</th>
                          <th>Type</th>
                          <th>Date</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                          <?php

$page = @$_GET['page'];
$page2 = (int) $page + 1;
$limit = 10;
if (!@$page) {
    $start = 0;
} else {
    $start = $page * $limit;

}

if (($start + $limit) >= $messages_count) {
    $buttonNext = '<a href="#" class="btn btn-sm">Finis</a>';
} else {
    $buttonNext = '<a href="?page=' . $page2 . '" class="btn btn-sm">Next</a>';
}
$i = $start;

foreach ($messages as $value) {

    $i += 1;

    $type = $value->type;
    $message = "";
    if ($type === "chat-text" || $type === "chat-image" || $type === "chat-document" || $type === "chat-video") {
        $message = $value->message;
    } else {
        $message = json_decode($value->message);
        $amessage = (array) $message;
        $b = array_keys($amessage);
        $message = @$b[0];

    }
    if (strlen($message) > 30) {
        $message = substr($message, 0, 20) . "...";
    }

    echo '<tr>
                          <td>' . $i . '</td>
                          <td>' . $value->device_name . '</td>
                          <td>' . $message . '</td>
                          <td>' . $value->recipient . '</td>
                          <td > ' . $value->type . '</td>
                          <td>' . $value->date_time . '</td>
                          <td class="text-info">' . $value->status . '</td>

                        </tr>';
}?>


                      </tbody>
                    </table>
                    </div>
                    <?=$buttonNext?>
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

          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>