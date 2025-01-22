<%@ Page  Title="View Appointments" Async="true"   Language="C#" MasterPageFile="~/ABM/ABM.Master" AutoEventWireup="true" 
    CodeBehind="ABM_View_Appointments.aspx.cs" 
    Inherits="AKSS_Management.ABM.ABM_View_Appointments" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
      input[type="checkbox" i] {
          width:20px;
          height:20px
      }
      .datatable-search
      {
          display:none;
      }
  </style>

    <script type="text/javascript">
      
        function showModal(title, bodyContent, saveButtonHandler) {
            debugger;
            $('#modalTitle').text(title);
            $('#modalBody').html(bodyContent);

            // Bind click event handler to the Save button
            $('#modalSaveButton').off('click').on('click', function () {
                if (saveButtonHandler && typeof saveButtonHandler === 'function') {
                    saveButtonHandler();
                }
                $('#dynamicModal').modal('hide');
            });

            $('#dynamicModal').modal('show');
        }

        //showModal('Dynamic Title', '<p>This is dynamic content.</p>', function () {
        //    alert('Save button clicked!');
        //});

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <main id="main" class="main">

    <div class="pagetitle">
      <%--<h1>User Master</h1>--%>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultABM.aspx">Home</a></li>
          <%--<li class="breadcrumb-item">Admin Panel</li>--%>
          <li class="breadcrumb-item active">View Appointment</li>
        </ol>
      </nav>
    </div>
    <!-- End Page Title -->

    <section class="section">

     <asp:Panel ID="Panel1" runat="server" class="card"  >
         <div class="pagetitle my-3 mx-3">
             <h1><a id="A1_BtnBackAppointments_List" runat="server" class="m-1" href="/ABM/ABM_List_Appointments.aspx"
                        data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Appointments List">
                        <i class="ri-arrow-left-line me-1"></i>
                    </a>View Appointment</h1>
         </div>

      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <%--<h5 class="card-title">Appointment Details</h5> --%>
                
            <div class="text-center gx-3 mb-3">
                 <br />
              <%--<a id="A1" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back to Billing List" href="/CMIS/CMIS_Billing_Expenses_List.aspx" visible="true"><i class="ri-arrow-left-circle-fill me-1"></i> </a>--%>
              <a id="A9" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select" visible="false"><i class="bi bi-card-checklist me-1"></i> </a>
              <a id="A18" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"  visible="false"><i class="bx bx-printer me-1"></i> </a>
              <a id="A_Btn_Edit" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"  onserverclick="Btn_Edit_serverclick"><i class="bx bxs-edit me-1"></i> </a>
              <a id="A_BtnDelete" runat="server" class="btn btn-danger btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete" onserverclick="BtnDelete_serverclick" onclick="return confirm('Are you sure you want to delete this record?');"><i class="bx bxs-trash-alt me-1"></i> </a>
              <a id="A21" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy" visible="false"><i class="bx bx-copy me-1"></i> </a>
              <a id="A22" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call" visible="false"><i class="bx bxs-phone-call me-1"></i> </a>
              <a id="A23" runat="server" class="btn btn-info btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message" visible="false"><i class="bx bxs-message-alt-detail me-1"></i> </a>
              <a id="A24" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp" visible="false"><i class="bx bxl-whatsapp me-1"></i> </a>
              <a id="A25" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail" visible="false"><i class="bx bx-mail-send me-1"></i> </a>
   
            </div>


                <div class="row mb-3">
                    <label for="LblAppointmentID" class="col-sm-12 col-form-label">Appointment ID</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblAppointmentID_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblDate" class="col-sm-12 col-form-label">Data & Time</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblDate_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblDoctorName" class="col-sm-12 col-form-label">Doctor Name</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblDoctorName_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblChemistName" class="col-sm-12 col-form-label">Chemist Name</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblChemistName_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                    </div>
                </div>  
                <div class="row mb-3">
                    <label for="LblStockistName" class="col-sm-12 col-form-label">Stockist Name</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblStockistName_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                    </div>
                </div>  
                <div class="row mb-3">
                    <label for="LblArea_Location" class="col-sm-12 col-form-label">Area Location</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblArea_Location_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                    </div>
                </div>  
                <div class="row mb-3">
                    <label for="LblNotes" class="col-sm-12 col-form-label">Notes</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblNotes_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                    </div>
                </div>
            </div>
          </div>

        </div>          

      </div>
     </asp:Panel>   
    </section>

  </main><!-- End #main -->

</asp:Content>



