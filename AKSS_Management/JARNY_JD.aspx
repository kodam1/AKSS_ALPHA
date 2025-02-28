﻿<%@ Page Language="C#" Title="JARNY JD" AutoEventWireup="true" CodeBehind="JARNY_JD.aspx.cs" 
    Inherits="AKSS_Management.JARNY_JD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>E & D</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="/assets/img/favicon.png" rel="icon">
    <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: NiceAdmin
    * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    * Updated: Apr 20 2024 with Bootstrap v5.3.3
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->

      <style >
      a{
          cursor: pointer;
      }

  </style>

</head>
<body class="toggle-sidebar">
    <form id="form1" runat="server">
         <main id="main" class="main">
    

 <header id="header" class="header fixed-top d-flex align-items-center" ><%--style="display:none !important;"--%>

   <div class="d-flex align-items-center justify-content-between">
     <a href="#" class="logo d-flex align-items-center">
       <img src="/assets/img/logo.png" alt="" />
       <span class="d-none d-lg-block"> JARNY </span>
     </a>
     <i class="bi bi-list toggle-sidebar-btn"></i>
   </div><!-- End Logo -->

   <div class="search-bar" style="display:none;" >
     <%--<form class="search-form d-flex align-items-center" method="POST" action="#">--%>
       <div class="search-form d-flex align-items-center">
            <input type="text" name="query" placeholder="Search" title="Enter search keyword">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
       </div>
      
     <%--</form>--%>
   </div>
   <!-- End Search Bar -->

   <nav class="header-nav ms-auto" style="display:none">
     <ul class="d-flex align-items-center">

       <li class="nav-item d-block d-lg-none"  style="display:none;" >
         <a class="nav-link nav-icon search-bar-toggle " href="#">
           <i class="bi bi-search"></i>
         </a>
       </li><!-- End Search Icon-->

       <li class="nav-item dropdown"  style="display:none;" >

         <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
           <i class="bi bi-bell"></i>
           <span class="badge bg-primary badge-number">4</span>
         </a><!-- End Notification Icon -->

         <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
           <li class="dropdown-header">
             You have 4 new notifications
             <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
           </li>
           <li>
             <hr class="dropdown-divider">
           </li>

           <li class="notification-item">
             <i class="bi bi-exclamation-circle text-warning"></i>
             <div>
               <h4>Lorem Ipsum</h4>
               <p>Quae dolorem earum veritatis oditseno</p>
               <p>30 min. ago</p>
             </div>
           </li>

           <li>
             <hr class="dropdown-divider">
           </li>

           <li class="notification-item">
             <i class="bi bi-x-circle text-danger"></i>
             <div>
               <h4>Atque rerum nesciunt</h4>
               <p>Quae dolorem earum veritatis oditseno</p>
               <p>1 hr. ago</p>
             </div>
           </li>

           <li>
             <hr class="dropdown-divider">
           </li>

           <li class="notification-item">
             <i class="bi bi-check-circle text-success"></i>
             <div>
               <h4>Sit rerum fuga</h4>
               <p>Quae dolorem earum veritatis oditseno</p>
               <p>2 hrs. ago</p>
             </div>
           </li>

           <li>
             <hr class="dropdown-divider">
           </li>

           <li class="notification-item">
             <i class="bi bi-info-circle text-primary"></i>
             <div>
               <h4>Dicta reprehenderit</h4>
               <p>Quae dolorem earum veritatis oditseno</p>
               <p>4 hrs. ago</p>
             </div>
           </li>

           <li>
             <hr class="dropdown-divider">
           </li>
           <li class="dropdown-footer">
             <a href="#">Show all notifications</a>
           </li>

         </ul><!-- End Notification Dropdown Items -->

       </li><!-- End Notification Nav -->

       <li class="nav-item dropdown"  style="display:none;" >

         <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
           <i class="bi bi-chat-left-text"></i>
           <span class="badge bg-success badge-number">3</span>
         </a><!-- End Messages Icon -->

         <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
           <li class="dropdown-header">
             You have 3 new messages
             <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
           </li>
           <li>
             <hr class="dropdown-divider">
           </li>

           <li class="message-item">
             <a href="#">
               <img src="/assets/img/messages-1.jpg" alt="" class="rounded-circle">
               <div>
                 <h4>Maria Hudson</h4>
                 <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                 <p>4 hrs. ago</p>
               </div>
             </a>
           </li>
           <li>
             <hr class="dropdown-divider">
           </li>

           <li class="message-item">
             <a href="#">
               <img src="/assets/img/messages-2.jpg" alt="" class="rounded-circle">
               <div>
                 <h4>Anna Nelson</h4>
                 <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                 <p>6 hrs. ago</p>
               </div>
             </a>
           </li>
           <li>
             <hr class="dropdown-divider">
           </li>

           <li class="message-item">
             <a href="#">
               <img src="/assets/img/messages-3.jpg" alt="" class="rounded-circle">
               <div>
                 <h4>David Muldon</h4>
                 <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                 <p>8 hrs. ago</p>
               </div>
             </a>
           </li>
           <li>
             <hr class="dropdown-divider">
           </li>

           <li class="dropdown-footer">
             <a href="#">Show all messages</a>
           </li>

         </ul><!-- End Messages Dropdown Items -->

       </li><!-- End Messages Nav -->

       <li class="nav-item dropdown pe-3">

         <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
           <%--<img src="/assets/img/akshay_img1.jpeg" alt="Profile" class="rounded-circle">--%>
           <span class="d-none d-md-block dropdown-toggle ps-2"  id="span_Profile_UserName" runat="server">K. Akshay</span>
         </a><!-- End Profile Iamge Icon -->

         <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
           <li class="dropdown-header">
             <h6  id="h6_Profile_FullName" runat="server">Akshay Kodam</h6>
             <span id="span_Profile_Role" runat="server">Software Developer</span>
           </li>
      <%--     <li>
             <hr class="dropdown-divider">
           </li>

           <li>
             <a class="dropdown-item d-flex align-items-center" href="/NiceAdminComponent/users-profile.aspx">
               <i class="bi bi-person"></i>
               <span>My Profile</span>
             </a>
           </li>
           <li>
             <hr class="dropdown-divider">
           </li>

           <li>
             <a class="dropdown-item d-flex align-items-center" href="/NiceAdminComponent/users-profile.aspx">
               <i class="bi bi-gear"></i>
               <span>Account Settings</span>
             </a>
           </li>
           <li>
             <hr class="dropdown-divider">
           </li>

           <li>
             <a class="dropdown-item d-flex align-items-center" href="/NiceAdminComponent/pages-faq.aspx">
               <i class="bi bi-question-circle"></i>
               <span>Need Help?</span>
             </a>
           </li>--%>
           <li>
             <hr class="dropdown-divider">
           </li>

           <li>
             <a class="dropdown-item d-flex align-items-center" href="/pages-login.aspx">
               <i class="bi bi-box-arrow-right"></i>
               <span>Sign Out</span>
             </a>
           </li>

         </ul><!-- End Profile Dropdown Items -->
       </li><!-- End Profile Nav -->

     </ul>
   </nav>
   <!-- End Icons Navigation -->

 </header>
 <!-- End Header -->

<div class="container-fluid">    


    <div class="pagetitle">
     <%-- <h1>JARNY Job Description Dashboard</h1>--%>
         <h1>JARNY JD Dashboard</h1>
<%--      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/Default.aspx">Home</a></li>
          <li class="breadcrumb-item">Components</li>
          <li class="breadcrumb-item active">Tabs</li>
        </ol>
      </nav>--%>
    </div><!-- End Page Title -->

    <section id="Section_JD" class="section dashboard" style="display:block;height:100%">
    <div class="row">
   
      <!-- Left side columns -->
      <div class="col-lg-12"  >         

        <div class="row">
          <!-- Sales Card -->
          
          <div class="col-xxl-4 col-md-6">
              
             
            <div class="card info-card sales-card"  style="cursor: pointer;">
                
              <div class="filter" style="display:none;">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>
              
                <a href="/JARNY_JD_Sales.aspx" target="_blank"> 
              <div class="card-body">
                <h5 class="card-title">Sales 
                    <%--<span>| Today</span>--%>

                </h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                   <i class="bi bi-puzzle"></i>
                  </div>
                  <div class="ps-3">
                    <%--<h6>145</h6>--%>
                    <%--<span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>

                  </div>
                </div>
              </div>                    
                </a>
            </div>
           
               
          </div>
                       
          <!-- End Sales Card -->

          <!-- Full Stack Dot Net Developer Card -->

          <div class="col-xxl-4 col-md-6">
            <div class="card info-card revenue-card" style="cursor: pointer;">

              <div class="filter" style="display:none;">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

              <a href="/JARNY_JD_Full_Stact_Dot_Net_Developer.aspx" target="_blank">
              <div class="card-body">
                <h5 class="card-title">Full Stack Dot Net Developer
                    <%--<span>| This Month</span>--%>

                </h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-person-check"></i>
                  </div>
                  <div class="ps-3">
                    <%--<h6>3,264</h6>--%>
                    <%--<span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>

                  </div>
                </div>
              </div>
               </a>
            </div>
          </div>
         
          <!-- End Full Stack Dot Net Developer Card -->

          <!-- Database Administrator (DBA) Card -->
        
          <div class="col-xxl-4 col-xl-12" style="display:block;">

            <div class="card info-card customers-card" style="cursor: pointer;">

              <div class="filter" style="display:none;">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

              <a href="/JARNY_JD_DBA.aspx" target="_blank"> 
              <div class="card-body">
                <h5 class="card-title">Database Administrator (DBA)
                    <%--<span>| This Year</span>--%>

                </h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" >
                    <i class="bi bi-person-plus"></i>
                  </div>
                  <div class="ps-3">
                    <%--<h6>1244</h6>--%>
                    <%--<span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>--%>

                  </div>
                </div>
             
              </div>
              </a>
            </div>

          </div>            
          
          <!-- End Database Administrator (DBA) Card -->

        </div>

        <div class="row" ><%-- style="display:block;"--%>

          <!-- UI/UX Developer Card -->
          <div class="col-xxl-4 col-md-6">
            <div class="card info-card sales-card" style="cursor: pointer;">

              <div class="filter" style="display:none;">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

              <a href="/JARNY_JD_UI_UX.aspx" target="_blank">
              <div class="card-body">
                <h5 class="card-title">UI/UX Developer
                    <%--<span>| Today</span>--%>

                </h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="background-color: #f2ff0045;">
                     <i class="bi bi-newspaper"></i>
                  </div>
                  <div class="ps-3">
                    <%--<h6>637</h6>--%>
                    <%--<span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>

                  </div>
                </div>
              </div>
              </a>
            </div>
          </div>
          <!-- End UI/UX Developer Card -->

          <!-- Accounts Card -->
          <div class="col-xxl-4 col-md-6">
            <div class="card info-card revenue-card" style="cursor: pointer;">

              <div class="filter" style="display:none;">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

              <a href="/JARNY_JD_Accounts.aspx" target="_blank">
              <div class="card-body">
                <h5 class="card-title">Accounts 
                    <%--<span>| This Month</span>--%>

                </h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="background: #f5dce7;">
                     <i class="bi bi-file-plus"></i>
                  </div>
                  <div class="ps-3">
                    <%--<h6>1376</h6>--%>
                    <%--<span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>

                  </div>
                </div>
              </div>
              </a>
            </div>
          </div>
          <!-- End Accounts Card -->

          <!-- Prescriptions Card -->
          <div class="col-xxl-4 col-md-6" style="display:none;">

            <div class="card info-card customers-card" style="cursor: pointer;">

              <div class="filter" style="display:none;">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

              <a href="/CMIS/CMIS_Create_Prescription_Details.aspx" target="_blank">
              <div class="card-body">
                <h5 class="card-title">Prescriptions 
                    <%--<span>| This Year</span>--%>

                </h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="background: #e6d4ee;">
                     <i class="bi bi-journal-text"></i>
                  </div>
                  <div class="ps-3">
                    <h6>2338</h6>
                    <%--<span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>--%>

                  </div>
                </div>
              
              </div>
              </a>
            </div>

          </div>            
          <!-- End Prescriptions Card -->

        </div>

       

      </div>
      <!-- End Left side columns -->            
               
    </div>
  </section>


 </div>

 <!-- ======= Footer ======= -->
 <footer id="footer" class="footer" style="display:none;">
   <div class="copyright">
     &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
   </div>
   <div class="credits">
     <!-- All the links in the footer should remain intact. -->
     <!-- You can delete the links only if you purchased the pro version. -->
     <!-- Licensing information: https://bootstrapmade.com/license/ -->
     <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
     Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
   </div>
 </footer>
  <!-- End Footer -->

   <!-- ======= Footer ======= -->
   <footer id="footer1" class="footer">
     <div class="copyright">
       <%--&reg; Registerd <strong><span>AKodam Software Solutions</span></strong>. All Rights Reserved--%>
         &reg; Registerd <strong><span>JARNY Software Solutions Agency</span></strong>. All Rights Reserved
     </div>
     <div class="credits">
       <!-- All the links in the footer should remain intact. -->
       <!-- You can delete the links only if you purchased the pro version. -->
       <!-- Licensing information: https://bootstrapmade.com/license/ -->
       <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
       Designed by <a href="#">JARNY Teams</a>
     </div>
   </footer>
   <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->

 <!-- Custom JS File -->
 <%--<script src="/assets/js/Custom.js"></script>--%>

  <script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="/assets/vendor/echarts/echarts.min.js"></script>
  <script src="/assets/vendor/quill/quill.js"></script>
  <script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>
          </main><!-- End #main -->
    </form>
</body>
</html>