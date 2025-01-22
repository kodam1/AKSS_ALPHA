<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="E_D.aspx.cs" Inherits="AKSS_Management.E_D" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>E & D</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="./../assets/img/favicon.png" rel="icon">
    <link href="./../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="./../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="./../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="./../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="./../assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="./../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="./../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="./../assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="./../assets/css/style.css" rel="stylesheet">

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
      <!-- ======= Footer ======= -->

 <header id="header" class="header fixed-top d-flex align-items-center">

   <div class="d-flex align-items-center justify-content-between">
     <a href="#" class="logo d-flex align-items-center">
       <img src="./../assets/img/logo.png" alt="" />
       <span class="d-none d-lg-block">AKSS</span>
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
               <img src="./../assets/img/messages-1.jpg" alt="" class="rounded-circle">
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
               <img src="./../assets/img/messages-2.jpg" alt="" class="rounded-circle">
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
               <img src="./../assets/img/messages-3.jpg" alt="" class="rounded-circle">
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
           <%--<img src="./../assets/img/akshay_img1.jpeg" alt="Profile" class="rounded-circle">--%>
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
      <h1>Admin Functionality</h1>
<%--      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/Default.aspx">Home</a></li>
          <li class="breadcrumb-item">Components</li>
          <li class="breadcrumb-item active">Tabs</li>
        </ol>
      </nav>--%>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Functionality</h5>

              <asp:Panel ID="Pnl" runat="server">

              <!-- Default Tabs -->
              <ul class="nav nav-tabs-bordered" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" 
                      data-bs-target="#home" type="button" role="tab" 
                      aria-controls="home" aria-selected="true">Encrypt & Decrypt</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" 
                      data-bs-target="#profile" type="button" role="tab" 
                      aria-controls="profile" aria-selected="false">Tab 2</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" 
                      data-bs-target="#contact" type="button" role="tab" 
                      aria-controls="contact" aria-selected="false">Tab 3</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                 <asp:Panel ID="Pnl1" runat="server">
                       <div class="row g-3 mt-3">
                          <div class="col-md-12 mb-3">
                          <div class="form-floating">
                            <asp:TextBox id="TxtEncrypt" runat="server" class="form-control"  ></asp:TextBox> 
                            <label for="TxtEncrypt">Encrypt</label>
                          </div>
                        </div>
                        <div class="col-md-12 mb-3">
                            <div class="form-floating mb-3">
                            <asp:TextBox id="TxtDecrypt" runat="server" class="form-control"  ></asp:TextBox> 
                            <label for="TxtDecrypt">Decrypt</label>
                          </div>
                        </div>               
                      </div>
                       <div class="row g-3 "  style="display:none;">>
                          <div class="col-md-12 mb-3">
                         
                          </div>
                       
                        <div class="col-md-12 mb-3" style="display:none;">
                            <div class="form-floating mb-3">
                            <asp:DropDownList id="DropDownList1" runat="server" class="form-select"  aria-label="DdlDivisionName" >
                               <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                               <asp:ListItem Text="SPEKTRA" Value="SPEKTRA" ></asp:ListItem>                       
                            </asp:DropDownList>
                            <label for="DdlDivisionName">Division Name</label>
                          </div>
                        </div> 
                      </div>
                     <div class="row g-3 mb-3">

                         <div class="text-center">
                             <%--<button type="submit" class="btn btn-primary">Submit</button>
                             <button type="reset" class="btn btn-secondary">Reset</button>--%>
                             <asp:Button ID="BtnEncrypt" runat="server" Text="Encrypt" OnClick="BtnEncrypt_Click" class="btn btn-primary m-1" />
                             <asp:Button ID="BtnDecrypt" runat="server" Text="Decrypt" OnClick="BtnDecrypt_Click" class="btn btn-primary m-1" />
                             <%----%>
                             <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
                             <asp:Button ID="BtnDelete" runat="server" Text="Delete" type="reset"  class="btn btn-danger" Visible="false" />
                             <%-- OnClientClick="return confirm('Are you sure you want to delete this record?');"--%>
                             <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset" class="btn btn-secondary" Visible="false" />
                             <%--  OnClick="BtnReset_Click"--%>
                             <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel" class="btn btn-primary" Visible="false" />
                             <%-- OnClick="BtnExportToExcel_Click"  --%>
                         </div>
                     </div>

                 </asp:Panel>
                 </div>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                  Nesciunt totam et. Consequuntur magnam aliquid eos nulla dolor iure eos quia. Accusantium distinctio omnis et atque fugiat. Itaque doloremque aliquid sint quasi quia distinctio similique. Voluptate nihil recusandae mollitia dolores. Ut laboriosam voluptatum dicta.
                </div>
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                  Saepe animi et soluta ad odit soluta sunt. Nihil quos omnis animi debitis cumque. Accusantium quibusdam perspiciatis qui qui omnis magnam. Officiis accusamus impedit molestias nostrum veniam. Qui amet ipsum iure. Dignissimos fuga tempore dolor.
                </div>
               <!-- End Default Tabs -->

              </asp:Panel>
             
              </div>
                           
            </div>
          </div>
        
        </div>
      
    </section>


 </div>

  <footer id="footer" class="footer">
    <div class="copyright">
      &reg; Registerd <strong><span>AKodam Software Solutions</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="#">Akshay Kodam</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->

 <!-- Custom JS File -->
 <%--<script src="./../assets/js/Custom.js"></script>--%>

  <script src="./../assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="./../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="./../assets/vendor/chart.js/chart.umd.js"></script>
  <script src="./../assets/vendor/echarts/echarts.min.js"></script>
  <script src="./../assets/vendor/quill/quill.js"></script>
  <script src="./../assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="./../assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="./../assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="./../assets/js/main.js"></script>
          </main><!-- End #main -->
    </form>
</body>
</html>