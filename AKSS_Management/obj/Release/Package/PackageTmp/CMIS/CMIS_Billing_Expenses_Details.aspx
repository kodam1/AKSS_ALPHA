<%@ Page  Title="Billing Expenses Details" Async="true"  Language="C#" MasterPageFile="~/CMIS/CMIS.Master" AutoEventWireup="true" CodeBehind="CMIS_Billing_Expenses_Details.aspx.cs" Inherits="AKSS_Management.CMIS.CMIS_Billing_Expenses_Details" %>
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
             <h1><a id="A1_BtnBackCMIS_Billing_Expenses_List" runat="server" class="m-1" href="/CMIS/CMIS_Billing_Expenses_List.aspx"
                     data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Billing Expenses List">
                     <i class="ri-arrow-left-line me-1"></i>
                 </a>Billing Expenses Details</h1>
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
              <a id="A_BtnDelete" runat="server" class="btn btn-danger btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete" onserverclick="BtnDelete_serverclick"><i class="bx bxs-trash-alt me-1"></i> </a>
              <a id="A21" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy" visible="false"><i class="bx bx-copy me-1"></i> </a>
              <a id="A22" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call" visible="false"><i class="bx bxs-phone-call me-1"></i> </a>
              <a id="A23" runat="server" class="btn btn-info btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message" visible="false"><i class="bx bxs-message-alt-detail me-1"></i> </a>
              <a id="A24" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp" visible="false"><i class="bx bxl-whatsapp me-1"></i> </a>
              <a id="A25" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail" visible="false"><i class="bx bx-mail-send me-1"></i> </a>
   
            </div>


                <div class="row mb-3">
                    <label for="LblBillingExpensesID" class="col-sm-12 col-form-label">Billing/Expenses ID</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblBillingExpensesID_Data" runat="server" class="col-form-label" Text="1" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblBillingPartyNameOrExpenses" class="col-sm-12 col-form-label">Billing Party Name Or Expenses</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblBillingPartyNameOrExpenses_Data" runat="server" class="col-form-label" Text="Xylo pharma / tea snacks monthly bills" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblAmount" class="col-sm-12 col-form-label">Amount</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblAmount_Data" runat="server" class="col-form-label" Text="500" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblDate" class="col-sm-12 col-form-label">Date</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblDate_Data" runat="server" class="col-form-label" Text="11 Dec 2024" Font-Bold="True"></asp:Label>
                    </div>
                </div>               
                <div class="row mb-3">
                    <label for="LblNotes" class="col-sm-12 col-form-label">Notes</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblNotes_Data" runat="server" class="col-form-label" Text="billing generated by taken medicine and tea breaks" Font-Bold="True"></asp:Label>
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
