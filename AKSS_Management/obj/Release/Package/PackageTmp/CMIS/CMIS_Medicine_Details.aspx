<%@ Page Title="Medicine Details" Async="true" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Medicine_Details.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Medicine_Details" %>
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
             <h1><a id="A1_BtnBackCMIS_Medicine_List" runat="server" class="m-1" href="/CMIS/CMIS_Medicine_List.aspx"
                     data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Medicine List">
                     <i class="ri-arrow-left-line me-1"></i>
                 </a>Medicine Details</h1>
         </div>


      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">              
                
            <div class="text-center gx-3 mb-3">
                 <br />
              <a id="A9" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select" visible="false"><i class="bi bi-card-checklist me-1"></i> </a>
              <a id="A18" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print" visible="false"><i class="bx bx-printer me-1"></i> </a>
              <a id="A19" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit" onserverclick="Btn_Edit_serverclick"><i class="bx bxs-edit me-1"></i> </a>
              <a id="A20" runat="server" class="btn btn-danger btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete" onserverclick="BtnDelete_serverclick" ><i class="bx bxs-trash-alt me-1"></i> </a>
              <a id="A21" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy" visible="false"><i class="bx bx-copy me-1"></i> </a>
              <a id="A22" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call" visible="false"><i class="bx bxs-phone-call me-1"></i> </a>
              <a id="A23" runat="server" class="btn btn-info btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message" visible="false"><i class="bx bxs-message-alt-detail me-1"></i> </a>
              <a id="A24" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp" visible="false"><i class="bx bxl-whatsapp me-1"></i> </a>
              <a id="A25" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail" visible="false"><i class="bx bx-mail-send me-1"></i> </a>

            </div>


                <div class="row mb-3">
                    <label for="LblMedicineID" class="col-sm-12 col-form-label">Medicine ID</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblMedicineID_Data" runat="server" class="col-form-label" Text="2" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblTitle" class="col-sm-12 col-form-label">Title</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblTitle_Data" runat="server" class="col-form-label" Text="Ceredon 10mg" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblCategory" class="col-sm-12 col-form-label">Category</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblCategory_Data" runat="server" class="col-form-label" Text="Topical" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblDoseInterval" class="col-sm-12 col-form-label">Dose Interval</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblDoseInterval_Data" runat="server" class="col-form-label" Text="Daily Morning" Font-Bold="True"></asp:Label>
                    </div>
                </div>   
                <div class="row mb-3">
                    <label for="LblBeforeMeal" class="col-sm-12 col-form-label">Before Meal</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblBeforeMeal_Data" runat="server" class="col-form-label" Text="After meal" Font-Bold="True"></asp:Label>
                    </div>
                </div>                   
                <div class="row mb-3">
                    <label for="LblDescriptions" class="col-sm-12 col-form-label">Descriptions</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblDescriptions_Data" runat="server" class="col-form-label" Text="Tablet used for body pain & headache" Font-Bold="True"></asp:Label>
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
