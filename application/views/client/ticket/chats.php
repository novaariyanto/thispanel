

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
              <div class="col-md-12">
                <button type="button" class="btn btn-secondary py-3 mb-4 text-center d-md-none aside-toggler"><i class="mdi mdi-menu mr-0 icon-md"></i></button>
                <div class="card chat-app-wrapper">
                  <div class="row mx-0">
                    <div class="col-lg-3 col-md-4 chat-list-wrapper px-0">
                      <div class="sidebar-spacer">
                        <div class="input-group chat-search-input">
                          <input type="text" class="form-control" placeholder="Search Inbox" aria-label="Username">
                          <div class="input-group-append">
                            <span class="input-group-text">
                              <i class="mdi mdi-magnify"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="chat-list-item-wrapper">
                        <div class="list-item">
                          <div class="profile-image">
                            <div class="dot-indicator sm bg-success"></div>
                            <img class="img-sm rounded-circle" src="../../assets/images/faces/face1.jpg" alt="">
                          </div>
                          <p class="user-name">Peter Moore</p>
                          <p class="chat-time">30min ago</p>
                          <p class="chat-text">Hello everyone, Iam happy to share with you our new company goals..</p>
                        </div>
                        <div class="list-item">
                          <div class="profile-image">
                            <div class="dot-indicator sm bg-primary"></div>
                            <img class="img-sm rounded-circle" src="../../assets/images/faces/face5.jpg" alt="">
                          </div>
                          <p class="user-name">Lillian Woods</p>
                          <p class="chat-time">1 day ago</p>
                          <p class="chat-text">Hello jessica, i will b ein london tomorrow, hope we can meer there</p>
                        </div>
                        <div class="list-item">
                          <div class="profile-image">
                            <div class="dot-indicator sm bg-primary"></div>
                            <img class="img-sm rounded-circle" src="../../assets/images/faces/face2.jpg" alt="">
                          </div>
                          <p class="user-name">Christina Love</p>
                          <p class="chat-time">2 days ago</p>
                          <p class="chat-text">Can you prep the File?</p>
                        </div>
                        <div class="list-item">
                          <div class="profile-image">
                            <div class="dot-indicator sm bg-warning"></div>
                            <img class="img-sm rounded-circle" src="../../assets/images/faces/face10.jpg" alt="">
                          </div>
                          <p class="user-name">Mabelle King</p>
                          <p class="chat-time">3 days ago</p>
                          <p class="chat-text">A new feature has been updated your account.Check it out…</p>
                        </div>
                        <div class="list-item">
                          <div class="profile-image">
                            <img class="img-sm rounded-circle" src="../../assets/images/faces/face7.jpg" alt="">
                          </div>
                          <p class="user-name">Brandon Norton</p>
                          <p class="chat-time">4 days ago</p>
                          <p class="chat-text">Hello, this is an invitation from one of the most interesting teams... </p>
                        </div>
                      </div>
                      <div class="sidebar-spacer">
                        <button class="btn btn-block btn-gradient-success py-3" type="button">+ New Chat</button>
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-8 px-0 d-flex flex-column">
                      <div class="chat-container-wrapper">
                        <div class="chat-bubble incoming-chat">
                          <div class="chat-message">
                            <p>Leo duis ut diam quam nulla porttitor massa id neque. Sed enim ut sem viverra aliquet eget sit. Aenean et tortor at risus viverra.</p>
                            <p>Mi in nulla posuere sollicitudin aliquam ultrices. Mauris a diam maecenas sed enim. Facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris. In cursus turpis massa tincidunt dui. Mattis vulputate enim nulla aliquet porttitor lacus.</p>
                          </div>
                          <div class="sender-details">
                            <img class="sender-avatar img-xs rounded-circle" src="../../assets/images/faces/face2.jpg" alt="profile image">
                            <p class="seen-text">Message seen : 20 min ago</p>
                          </div>
                        </div>
                        <div class="chat-bubble outgoing-chat">
                          <div class="chat-message">
                            <p class="font-weight-bold">Frank Carter</p>
                            <p>Leo duis ut diam quam nulla porttitor massa id neque. Sed enim ut sem</p>
                          </div>
                          <div class="sender-details">
                            <img class="sender-avatar img-xs rounded-circle" src="../../assets/images/faces/face3.jpg" alt="profile image">
                            <p class="seen-text">Message seen : 10 min ago</p>
                          </div>
                        </div>
                        <div class="chat-bubble incoming-chat">
                          <div class="chat-message">
                            <p class="font-weight-bold">Frank Carter</p>
                            <p>Mi in nulla posuere sollicitudin aliquam ultrices. Mauris a diam maecenas sed enim. Facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris.</p>
                          </div>
                          <div class="sender-details">
                            <img class="sender-avatar img-xs rounded-circle" src="../../assets/images/faces/face2.jpg" alt="profile image">
                            <p class="seen-text">Message seen : 8 min ago</p>
                          </div>
                        </div>
                        <div class="chat-bubble outgoing-chat">
                          <div class="chat-message">
                            <p class="font-weight-bold">Frank Carter</p>
                            <p>Leo duis ut diam quam nulla porttitor massa id neque. Sed enim ut sem</p>
                            <p class="font-weight-medium"><i class="mdi mdi-paperclip mr-2"></i>workfile.pdf</p>
                          </div>
                          <div class="sender-details">
                            <img class="sender-avatar img-xs rounded-circle" src="../../assets/images/faces/face3.jpg" alt="profile image">
                            <p class="seen-text">Message seen : 10 min ago</p>
                          </div>
                        </div>
                      </div>
                      <div class="chat-text-field mt-auto">
                        <form action="#">
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <button type="button" class="input-group-text"><i class="mdi mdi-emoticon-happy-outline icon-sm"></i></button>
                            </div>
                            <input type="text" class="form-control" placeholder="Type a message here">
                            <div class="input-group-append">
                              <button type="button" class="input-group-text"><i class="mdi mdi-paperclip icon-sm"></i></button>
                            </div>
                            <div class="input-group-append">
                              <button type="submit" class="input-group-text"><i class="mdi mdi-send icon-sm"></i></button>
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                    <div class="col-lg-3 d-none d-lg-block px-0 chat-sidebar">
                      <img class="img-fluid w-100" src="../../assets/images/chat/profile_image.jpg" alt="profile image">
                      <div class="px-4">
                        <div class="d-flex pt-4">
                          <div class="wrapper">
                            <h5 class="font-weight-medium mb-0 ellipsis">Cecelia Benson</h5>
                            <p class="mb-0 text-muted ellipsis">General manager</p>
                          </div>
                          <div class="badge badge-gradient-success mb-auto ml-auto">Online</div>
                        </div>
                        <div class="pt-3">
                          <div class="d-flex align-items-center py-1">
                            <i class="mdi mdi-whatsapp mr-2"></i>
                            <p class="mb-0 font-weight-medium">225-248-4861</p>
                          </div>
                          <div class="d-flex align-items-center py-1">
                            <i class="mdi mdi-email-outline mr-2"></i>
                            <p class="mb-0 font-weight-medium ellipsis">cecilia.tromp@danny.com</p>
                          </div>
                          <div class="d-flex align-items-center py-1">
                            <i class="mdi mdi-map-marker-outline mr-2"></i>
                            <p class="mb-0 font-weight-medium ellipsis">United Kingdom</p>
                          </div>
                        </div>
                        <div class="list-item">
                          <div class="d-flex align-items-center justify-content-center img-sm badge-gradient-success">
                            <i class="mdi mdi-cash-multiple icon-sm"></i>
                          </div>
                          <div class="wrapper pl-3">
                            <h5 class="font-weight-medium mb-0">$2300</h5>
                            <p class="text-muted mb-0">Deposit</p>
                          </div>
                        </div>
                        <div class="list-item">
                          <div class="d-flex align-items-center justify-content-center img-sm badge-gradient-danger">
                            <i class="mdi mdi-cash-multiple icon-sm"></i>
                          </div>
                          <div class="wrapper pl-3">
                            <h5 class="font-weight-medium mb-0">$2300</h5>
                            <p class="text-muted mb-0">Deposit</p>
                          </div>
                        </div>
                        <div class="list-item border-bottom-0">
                          <div class="d-flex align-items-center justify-content-center img-sm badge-gradient-info">
                            <i class="mdi mdi-cash-multiple icon-sm"></i>
                          </div>
                          <div class="wrapper pl-3 w-100">
                            <h5 class="font-weight-medium mb-0">$2300</h5>
                            <div class="d-flex">
                              <p class="text-muted mb-0">Deposit</p>
                              <p class="font-weight-bold ml-auto">4.7 GB free</p>
                            </div>
                          </div>
                        </div>
                        <h5 class="font-weight-medium mt-3">Documentation</h5>
                        <div class="list-item">
                          <div class="d-flex align-items-center justify-content-center img-sm badge-gradient-primary">
                            <i class="mdi mdi-file-pdf icon-sm"></i>
                          </div>
                          <div class="wrapper pl-3 w-100">
                            <h5 class="font-weight-medium mb-0 ellipsis">Company Profile.pdf</h5>
                            <div class="d-flex">
                              <p class="text-muted mb-0">456.54 KB</p>
                              <i class="mdi mdi-arrow-down-bold text-muted ml-auto"></i>
                            </div>
                          </div>
                        </div>
                        <div class="list-item">
                          <div class="d-flex align-items-center justify-content-center img-sm badge-gradient-primary">
                            <i class="mdi mdi-file-pdf icon-sm"></i>
                          </div>
                          <div class="wrapper pl-3 w-100">
                            <h5 class="font-weight-medium mb-0 ellipsis">Proposal.pdf</h5>
                            <div class="d-flex">
                              <p class="text-muted mb-0">1360.54 KB</p>
                              <i class="mdi mdi-arrow-down-bold text-muted ml-auto"></i>
                            </div>
                          </div>
                        </div>
                        <h5 class="font-weight-medium mt-5 mb-4">Share photos</h5>
                        <div class="row">
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image1.jpg" alt="image">
                          </div>
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image2.jpg" alt="image">
                          </div>
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image3.jpg" alt="image">
                          </div>
                        </div>
                        <div class="row my-4">
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image4.jpg" alt="image">
                          </div>
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image5.jpg" alt="image">
                          </div>
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image6.jpg" alt="image">
                          </div>
                        </div>
                        <div class="row mb-4">
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image7.jpg" alt="image">
                          </div>
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image8.jpg" alt="image">
                          </div>
                          <div class="col-4">
                            <img class="w-100 img-fluid rounded" src="../../assets/images/chat/thumb_image4.jpg" alt="image">
                          </div>
                        </div>
                      </div>
                    </div>
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