<%@ Page  Title="Sub Dashboard" Async="true" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" AutoEventWireup="true" 
    CodeBehind="CMIS_Category_Dashboard.aspx.cs" Inherits="AKSS_Management.CMIS.CMIS_Category_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Sub Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultCMIS.aspx">Home</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Sub Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section contact">

     <div class="card" style="display:none;">
     <div class="card-body">
       <h5 class="card-title">Modal Sizes</h5>
       <p>Modals have three optional sizes, available via modifier classes to be placed on a <code>.modal-dialog</code>. These sizes kick in at certain breakpoints to avoid horizontal scrollbars on narrower viewports..</p>

      
       <!-- Large Modal -->
       <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#largeModal">
         Large Modal
       </button>

       <div class="modal fade" id="largeModal" tabindex="-1">
         <div class="modal-dialog modal-lg">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title">Large Modal</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
               Non omnis incidunt qui sed occaecati magni asperiores est mollitia. Soluta at et reprehenderit. Placeat autem numquam et fuga numquam. Tempora in facere consequatur sit dolor ipsum. Consequatur nemo amet incidunt est facilis. Dolorem neque recusandae quo sit molestias sint dignissimos.
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
             </div>
           </div>
         </div>
       </div><!-- End Large Modal-->

       <!-- Extra Large Modal -->
       <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ExtralargeModal">
         Extra Large Modal
       </button>

       <div class="modal fade" id="ExtralargeModal" tabindex="-1">
         <div class="modal-dialog modal-xl">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title">Extra Large Modal</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
               Non omnis incidunt qui sed occaecati magni asperiores est mollitia. Soluta at et reprehenderit. Placeat autem numquam et fuga numquam. Tempora in facere consequatur sit dolor ipsum. Consequatur nemo amet incidunt est facilis. Dolorem neque recusandae quo sit molestias sint dignissimos.
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
             </div>
           </div>
         </div>
       </div><!-- End Extra Large Modal-->

       <!-- Full Screen Modal -->
       <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#fullscreenModal">
         Full Screen Modal
       </button>

       <div class="modal fade" id="fullscreenModal" tabindex="-1">
         <div class="modal-dialog modal-fullscreen">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title">Full Screen Modal</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
               Non omnis incidunt qui sed occaecati magni asperiores est mollitia. Soluta at et reprehenderit. Placeat autem numquam et fuga numquam. Tempora in facere consequatur sit dolor ipsum. Consequatur nemo amet incidunt est facilis. Dolorem neque recusandae quo sit molestias sint dignissimos.
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
             </div>
           </div>
         </div>
       </div><!-- End Full Screen Modal-->

     </div>
   </div>

      <div class="row gy-4">

        <div class="col-xl-12">

          <div class="row ">
            <div class="col-lg-4">
              <div class="info-box card " style="text-align: center;background-color: #00eaff8c;">
                <%--<i class="bi bi-currency-dollar"></i>--%>
                <h3>Income &nbsp;<i class="bi bi-question-circle-fill" data-bs-toggle="modal" data-bs-target="#IncomeModal"
                    style="font-size: 28px;"></i></h3>
                  
                <%--<p>A108 Adam Street,<br>New York, NY 535022</p>--%>
                  <asp:Label ID="lblIncome" runat="server" Text="500" ></asp:Label>
              </div>
            </div>

               <!-- Income  Modal -->             
             <div class="modal fade" id="IncomeModal" tabindex="-1">
               <div class="modal-dialog modal-sm">
                 <div class="modal-content">
                   <div class="modal-header">
                     <h5 class="modal-title">Income </h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                     Income is the amount of money an individual or a business earns after paying all bills/expenses. 
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                   </div>
                 </div>
               </div>
             </div>
               <!-- End Income  Modal-->


            <div class="col-lg-4">
              <div class="info-box card" style="text-align: center;    background-color: #00ff4e8c;">
                <%--<i class="bx-dollar-circle"></i>--%>
                <h3>Revenue &nbsp;<i class="bi bi-question-circle-fill"  data-bs-toggle="modal" data-bs-target="#RevenueModal"
                    style="font-size: 28px;"></i></h3>
                <%--<p>+1 5589 55488 55<br>+1 6678 254445 41</p>--%>
                  <asp:Label ID="lblRevenue" runat="server" Text="900" ></asp:Label>
              </div>
            </div>
              
               <!-- Revenue Modal -->             
             <div class="modal fade" id="RevenueModal" tabindex="-1">
               <div class="modal-dialog modal-sm">
                 <div class="modal-content">
                   <div class="modal-header">
                     <h5 class="modal-title">Revenue</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                     Revenue refer to the total amount of money an individual or a business makes by providing services or selling goods before any expenses are deducted. 
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                   </div>
                 </div>
               </div>
             </div>
               <!-- End Revenue Modal-->

            <div class="col-lg-4">
              <div class="info-box card" style="text-align: center;background-color: #3a90d687;">
                <%--<i class="bi bi-person-check"></i>--%>
                <h3>Appointments &nbsp;<i class="bi bi-question-circle-fill"  data-bs-toggle="modal" data-bs-target="#AppointmentsModal"
                    style="font-size: 28px;"></i></h3>
                <%--<p>info@example.com<br>contact@example.com</p>--%>
                  <asp:Label ID="lblAppointments" runat="server" Text="1200" ></asp:Label>
              </div>
            </div>

               <!-- Appointments  Modal -->             
             <div class="modal fade" id="AppointmentsModal" tabindex="-1">
               <div class="modal-dialog modal-sm">
                 <div class="modal-content">
                   <div class="modal-header">
                     <h5 class="modal-title">Appointments </h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                     Total number of newly scheduled appointments in the filtered date range. 
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                   </div>
                 </div>
               </div>
             </div>
               <!-- End Appointments  Modal-->

            <div class="col-lg-4">
              <div class="info-box card" style="text-align: center;background-color: #a23ad687;">
                <%--<i class="bi bi-person-plus"></i>--%>
                <h3>New Patients &nbsp;<i class="bi bi-question-circle-fill"  data-bs-toggle="modal" data-bs-target="#NewPatientsModal"
                    style="font-size: 28px;"></i></h3>
                <%--<p>Monday - Friday<br>9:00AM - 05:00PM</p>--%>
                  <asp:Label ID="lblNewPatients" runat="server" Text="93" ></asp:Label>
              </div>
            </div>

             <!-- NewPatients Modal -->             
             <div class="modal fade" id="NewPatientsModal" tabindex="-1">
               <div class="modal-dialog modal-sm">
                 <div class="modal-content">
                   <div class="modal-header">
                     <h5 class="modal-title">New Patients</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                     Total number of newly created patients in the filtered date range. 
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <%-- <button type="button" class="btn btn-primary">Save changes</button>--%>
                   </div>
                 </div>
               </div>
             </div>
               <!-- NewPatients Modal-->

            <div class="col-lg-4">
                <div class="info-box card" style="text-align: center;background-color: #d65f3a99;">
                    <%--<i class="bi bi-newspaper"></i>--%>
                    <h3>Billing/Expenses &nbsp;<i class="bi bi-question-circle-fill" data-bs-toggle="modal" data-bs-target="#Billing_ExpensesModal"
                        style="font-size: 28px;"></i></h3>
                   <%-- <p>Monday - Friday<br>
                        9:00AM - 05:00PM</p>--%>
                    <asp:Label ID="lblBilling_Expenses" runat="server" Text="1300" ></asp:Label>
                </div>
            </div>

             <!-- Bills/Expenses  Modal -->             
             <div class="modal fade" id="Billing_ExpensesModal" tabindex="-1">
               <div class="modal-dialog modal-sm">
                 <div class="modal-content">
                   <div class="modal-header">
                     <h5 class="modal-title">Bills/Expenses</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                     Bill expenses refer to the costs incurred by an individual or a business in the process of producing or offering its primary goods or services.
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                   </div>
                 </div>
               </div>
             </div>
               <!-- End Bills/Expenses  Modal-->


          </div>

        </div>

        <div class="col-xl-6" style="display:none;">
          <div class="card p-4">
            <form action="forms/contact.php" method="post" class="php-email-form">
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                </div>

                <div class="col-md-6 ">
                  <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                </div>

                <div class="col-md-12">
                  <input type="text" class="form-control" name="subject" placeholder="Subject" required>
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" name="message" rows="6" placeholder="Message" required></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>

                  <button type="submit">Send Message</button>
                </div>

              </div>
            </form>
          </div>

        </div>

      </div>

    </section>

  </main><!-- End #main -->

</asp:Content>
