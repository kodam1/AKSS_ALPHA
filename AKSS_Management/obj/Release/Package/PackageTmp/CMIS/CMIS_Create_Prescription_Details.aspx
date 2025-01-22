<%@ Page Title="Prescription Details" Async="true" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" AutoEventWireup="true" 
    CodeBehind="CMIS_Create_Prescription_Details.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Create_Prescription_Details" %>

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
             <h1>Prescription Details</h1>
         </div>

      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <%--<h5 class="card-title">Appointment Details</h5> --%>
                
                
              <div class="row g-3 my-3 mb-3"  style="display:none;">
    
              <div class="text-center">
                <%--<button type="submit" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-secondary">Reset</button>--%>

                  <asp:Button ID="BtnSave" runat="server" Text="Submit" class="btn btn-primary" Visible="false"/> <%--OnClick="BtnSave_Click" --%>
                   <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary" Visible="false"/> <%--OnClick="BtnSave_Click" --%>
                  <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
                   <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset"  class="btn btn-danger"  Visible="false"/> <%--OnClick="BtnDelete_Click"--%>
                  <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset"  class="btn btn-secondary"  Visible="false"/>  <%-- OnClick="BtnReset_Click"--%>
                  <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" Visible="false"/> <%--OnClick="BtnExportToExcel_Click" --%>
      
              </div>

             <div class="text-center" style="margin-top: 5px !important;display:none;" >
                 <a id="BtnSelectPatient" runat="server" class="btn btn-primary btn-lg"><i class="bi bi-card-checklist me-1"></i><br /><span style="font-size:small;margin-top:-5px" >Select</span></a>
                 <a id="A1" runat="server" class="btn btn-primary btn-lg" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"     ><i class="bx bx-printer me-1"></i>Print</a>
                 <a id="A2" runat="server" class="btn btn-primary btn-lg" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"      ><i class="bx bxs-edit me-1"></i>Edit</a>
                 <a id="A3" runat="server" class="btn btn-primary btn-lg" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"    ><i class="bx bxs-trash-alt me-1"></i>Delete</a>
                 <a id="A4" runat="server" class="btn btn-primary btn-lg" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"      ><i class="bx bx-copy me-1"></i>Copy</a>
                 <a id="A5" runat="server" class="btn btn-primary btn-lg" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"      ><i class="bx bxs-phone-call me-1"></i>Call</a>
                 <a id="A6" runat="server" class="btn btn-primary btn-lg" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"   ><i class="bx bxs-message-alt-detail me-1"></i>Message</a>
                 <a id="A7" runat="server" class="btn btn-primary btn-lg" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"  ><i class="bx bxl-whatsapp me-1"></i>WhatsApp</a>
                 <a id="A8" runat="server" class="btn btn-primary btn-lg" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"      ><i class="bx bx-mail-send me-1"></i>Mail</a>                                  

                  <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom">
                   Tooltip on bottom
                 </button>

             </div>

            </div>

              <div class="text-center gx-3 mb-3" style="margin-top: 5px !important;display:none;" >
                   <br />
                <a id="A91" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"><i class="bi bi-card-checklist me-1"></i> </a>
                <a id="A10" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"><i class="bx bx-printer me-1"></i> </a>
                <a id="A11" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="bx bxs-edit me-1"></i> </a>
                <a id="A12" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="bx bxs-trash-alt me-1"></i> </a>
                <a id="A13" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"><i class="bx bx-copy me-1"></i> </a>
                <a id="A14" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"><i class="bx bxs-phone-call me-1"></i> </a>
                <a id="A15" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"><i class="bx bxs-message-alt-detail me-1"></i> </a>
                <a id="A16" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"><i class="bx bxl-whatsapp me-1"></i> </a>
                <a id="A17" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"><i class="bx bx-mail-send me-1"></i> </a>
                 
                   <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom" style="display:none;" >
                      Tooltip on bottom
                    </button>
              </div>

                <div class="text-center gx-3 mb-3" style="margin-top: 5px !important;display:none;" >
                     <br />
                  <a id="A26" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"><i class="bi bi-card-checklist me-1"></i> </a>
                  <a id="A27" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"><i class="bx bx-printer me-1"></i> </a>
                  <a id="A28" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="bx bxs-edit me-1"></i> </a>
                  <a id="A29" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="bx bxs-trash-alt me-1"></i> </a>
                  <a id="A30" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"><i class="bx bx-copy me-1"></i> </a>
                  <a id="A31" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"><i class="bx bxs-phone-call me-1"></i> </a>
                  <a id="A32" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"><i class="bx bxs-message-alt-detail me-1"></i> </a>
                  <a id="A33" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"><i class="bx bxl-whatsapp me-1"></i> </a>
                  <a id="A34" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"><i class="bx bx-mail-send me-1"></i> </a>
   
                     <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom" style="display:none;" >
                        Tooltip on bottom
                      </button>
                </div>

            <div class="text-center gx-3 mb-3">
                 <br />
              <a id="A9" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"><i class="bi bi-card-checklist me-1"></i> </a>
              <a id="A18" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"><i class="bx bx-printer me-1"></i> </a>
              <a id="A19" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="bx bxs-edit me-1"></i> </a>
              <a id="A20" runat="server" class="btn btn-danger btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="bx bxs-trash-alt me-1"></i> </a>
              <a id="A21" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"><i class="bx bx-copy me-1"></i> </a>
              <a id="A22" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"><i class="bx bxs-phone-call me-1"></i> </a>
              <a id="A23" runat="server" class="btn btn-info btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"><i class="bx bxs-message-alt-detail me-1"></i> </a>
              <a id="A24" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"><i class="bx bxl-whatsapp me-1"></i> </a>
              <a id="A25" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"><i class="bx bx-mail-send me-1"></i> </a>
   
<%--                 <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom" style="display:none;" >
                    Tooltip on bottom
                  </button>--%>
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
                    <label for="LblPrescriptionId" class="col-sm-12 col-form-label">Prescription ID</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblPrescriptionId_Data" runat="server" class="col-form-label" Text="1" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblTitle" class="col-sm-12 col-form-label">Title</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblTitle_Data" runat="server" class="col-form-label" Text="Upper tooth Pain" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="LblInstructions" class="col-sm-12 col-form-label">Instructions</label>
                    <div class="col-sm-12">
                        <asp:Label ID="LblInstructions_Data" runat="server" class="col-form-label" Text="Upper tooth Pain from long time" Font-Bold="True"></asp:Label>
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