<%@ Page Title="Lab Report Details" Async="true" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Create_Lab_Reports_Details.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Create_Lab_Reports_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
          <main id="main" class="main">

<%--    <div class="pagetitle">
      <h1>User Master</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultAKSS.aspx">Home</a></li>
          <li class="breadcrumb-item">Admin Panel</li>
          <li class="breadcrumb-item active">User Master</li>
        </ol>
      </nav>
    </div>--%>
    <!-- End Page Title -->

    <section class="section">

     <asp:Panel ID="Panel1" runat="server" class="card"  >

         <div class="pagetitle my-3 mx-3">
             <h1><a id="A1_BtnBackCMIS_Lab_Reports_List" runat="server" class="m-1" href="/CMIS/CMIS_Lab_Reports_List.aspx"
                 data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Lab Reports List">
                 <i class="ri-arrow-left-line me-1"></i>
             </a>Lab Reports Details</h1>
         </div>


         <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <%--<h5 class="card-title">Appointment Details</h5> --%>
                                           
            <div class="text-center gx-3 mb-3">
                 <br />
              <a id="A9" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select" visible="false"><i class="bi bi-card-checklist me-1"></i> </a>
              <a id="A18" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print" visible="false"><i class="bx bx-printer me-1"></i> </a>
              <a id="A19" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit" visible="true" onserverclick="Btn_Edit_serverclick"><i class="bx bxs-edit me-1"></i> </a>
              <a id="A20" runat="server" class="btn btn-danger btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete" visible="true" onserverclick="BtnDelete_serverclick"><i class="bx bxs-trash-alt me-1"></i> </a>
              <a id="A21" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy" visible="false"><i class="bx bx-copy me-1"></i> </a>
              <a id="A22" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call" visible="false"><i class="bx bxs-phone-call me-1"></i> </a>
              <a id="A23" runat="server" class="btn btn-info btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message" visible="false"><i class="bx bxs-message-alt-detail me-1"></i> </a>
              <a id="A24" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp" visible="false"><i class="bx bxl-whatsapp me-1"></i> </a>
              <a id="A25" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail" visible="false"><i class="bx bx-mail-send me-1"></i> </a>
 
            </div>


              <div class="row g-3 " style="display:none;">
                  <div class="col-md-12 mb-3" >
                  <div class="form-floating">
                    <asp:TextBox id="txtAppointmentId" runat="server" class="form-control"   ></asp:TextBox><%-- AutoPostBack="true" OnTextChanged="txtClientId_TextChanged"--%>
                    <label for="txtAppointmentId">Appointment Id</label>
                  </div>
                </div>
                <div class="col-12 col-md-12 mb-3">
                  <div class="form-floating">
                     <asp:TextBox id="txtSelectPatient" runat="server" class="form-control" Style="border-left: 8px solid #0000ff80;" disabled="disabled" Placeholder=" Select Patient"  ></asp:TextBox>   <%-- AutoPostBack="true" OnTextChanged="txtClientName_TextChanged"--%>                 
                    <label for="txtSelectPatient"  Style="border-left: 8px solid #0000ff80;"> Select Patient<span style="font-weight:600;color:red"> *</span></label>
                  </div>
                </div>  
              
              </div>

                <div class="row mb-3">
                    <label for="LblLabReportId" class="col-sm-12 col-form-label">Lab Report ID</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblLabReportId_Data" runat="server" class="col-form-label" Text="1" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblTitle" class="col-sm-12 col-form-label">Title</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblTitle_Data" runat="server" class="col-form-label" Text="Dental tooth test" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblDescription" class="col-sm-12 col-form-label">Description</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblDescription_Data" runat="server" class="col-form-label" Text="Mouth cavity tooth test" Font-Bold="True"></asp:Label>
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
