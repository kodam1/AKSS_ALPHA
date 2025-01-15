<%@ Page Title="Patient Details" Async="true"  Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Patient_Details.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Patient_Details" %>

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
             <h1><a id="A1_BtnBackCMIS_Patient_List" runat="server" class="m-1" href="/CMIS/CMIS_Patient_List.aspx"
                     data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Patient List">
                     <i class="ri-arrow-left-line me-1"></i>
                 </a>Patient Details</h1>
         </div>



      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
                              
                  <div class="row g-3 my-3 m-3" >
                    <div class="text-center"  >
                    
                    <a id="A44" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select" visible="false"  ><i class="bi bi-card-checklist me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Select</span></a>
                    <a id="A45" runat="server" class="btn btn-warning m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"  visible="false"    ><i class="bx bx-printer me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Print</span></a>
                    <a id="Btn_Edit" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit" onserverclick="Btn_Edit_serverclick"    ><i class="bx bxs-edit me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Edit</span></a>
                    <a id="Btn_Delete" runat="server" class="btn btn-danger m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete" onserverclick="Btn_Delete_serverclick"  ><i class="bx bxs-trash-alt me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Delete</span></a>
                    <a id="Btn_Create_Appointment" runat="server" class="btn btn-warning m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Create Appointment" onserverclick="Btn_Create_Appointment_serverclick" ><i class="bx bxs-calendar-event me-1 m-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Appointment</span></a>
                    <a id="A48" runat="server" class="btn btn-success m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"  visible="false"     ><i class="bx bx-copy me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Copy</span></a>
                    <a id="A49" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"     visible="false" ><i class="bx bxs-phone-call me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Call</span></a>
                    <a id="A50" runat="server" class="btn btn-info m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"   visible="false"><i class="bx bxs-message-alt-detail me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Message</span></a>
                    <a id="A51" runat="server" class="btn btn-success m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"  visible="false"><i class="bx bxl-whatsapp me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >WhatsApp</span></a>
                    <a id="A52" runat="server" class="btn btn-warning m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"     visible="false" ><i class="bx bx-mail-send me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Mail</span></a>                               
 
                       </div>
                  </div>

                <div class="row g-3 my-3 m-3">
                    <div class="col-lg-6">
                          <div class="row ">
      <label for="LblPatientID" class="col-sm-12 col-form-label">Patient ID</label>
      <div class="col-sm-12">
          <asp:Label ID="LblPatientID_Data" runat="server" class="col-form-label" Text="1" Font-Bold="True"></asp:Label>
      </div>
  </div>
  <div class="row ">
      <label for="LblFirstName" class="col-sm-12 col-form-label">First Name</label>
      <div class="col-sm-12">
          <asp:Label ID="LblFirstName_Data" runat="server" class="col-form-label" Text="Sam" Font-Bold="True"></asp:Label>
      </div>
  </div>
  <div class="row ">
      <label for="LblMiddleName" class="col-sm-12 col-form-label">Middle Name</label>
      <div class="col-sm-12">
          <asp:Label ID="LblMiddleName_Data" runat="server" class="col-form-label" Text="Sam" Font-Bold="True"></asp:Label>
      </div>
  </div>
  <div class="row ">
      <label for="LblLastName" class="col-sm-12 col-form-label">Last Name</label>
      <div class="col-sm-12">
          <asp:Label ID="LblLastName_Data" runat="server" class="col-form-label" Text="Willow" Font-Bold="True"></asp:Label>
      </div>
  </div>
  <div class="row ">
      <label for="LblContactNumber" class="col-sm-12 col-form-label">Contact Number</label>
      <div class="col-sm-12">
          <asp:Label ID="LblCountry_Code_Data" runat="server" class="col-form-label" Text="+91 923438712" Font-Bold="True"></asp:Label>
          <asp:Label ID="LblContactNumber_Data" runat="server" class="col-form-label" Text="+91 923438712" Font-Bold="True"></asp:Label>
      </div>
  </div>
  <div class="row ">
      <label for="LblEmail" class="col-sm-12 col-form-label">Email</label>
      <div class="col-sm-12">
          <asp:Label ID="LblEmail_Data" runat="server" class="col-form-label" Text="sam@123" Font-Bold="True"></asp:Label>
      </div>
  </div>
  <div class="row ">
      <label for="LblGender" class="col-sm-12 col-form-label">Gender</label>
      <div class="col-sm-12">
          <asp:Label ID="LblGender_Data" runat="server" class="col-form-label" Text="Male" Font-Bold="True"></asp:Label>
      </div>
  </div>
                        <div class="row ">
                            <label for="LblAge" class="col-sm-12 col-form-label">Age</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblAge_Data" runat="server" class="col-form-label" Text="19" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                       
              
                    </div>
                    <div class="col-lg-6">
                       <div class="row ">
     <label for="LblBloodGroup" class="col-sm-12 col-form-label">Blood Group</label>
     <div class="col-sm-12">
         <asp:Label ID="LblBloodGroup_Data" runat="server" class="col-form-label" Text="B negative (2%)" Font-Bold="True"></asp:Label>
     </div>
 </div>
 <div class="row ">
     <label for="LblWeight" class="col-sm-12 col-form-label">Weight</label>
     <div class="col-sm-12">
         <asp:Label ID="LblWeight_Data" runat="server" class="col-form-label" Text="55" Font-Bold="True"></asp:Label>
     </div>
 </div>
 <div class="row ">
     <label for="LblHeight" class="col-sm-12 col-form-label">Height</label>
     <div class="col-sm-12">
         <asp:Label ID="LblHeight_Data" runat="server" class="col-form-label" Text="5.2" Font-Bold="True"></asp:Label>
     </div>
 </div>
 <div class="row ">
     <label for="LblBP" class="col-sm-12 col-form-label">BP</label>
     <div class="col-sm-12">
         <asp:Label ID="LblBP_Data" runat="server" class="col-form-label" Text="19" Font-Bold="True"></asp:Label>
     </div>
 </div>
 <div class="row ">
     <label for="LblSymptoms" class="col-sm-12 col-form-label">Symptoms</label>
     <div class="col-sm-12">
         <asp:Label ID="LblSymptoms_Data" runat="server" class="col-form-label" Text="Body pain & headche" Font-Bold="True"></asp:Label>
     </div>
 </div>
 <div class="row ">
     <label for="LblAddress" class="col-sm-12 col-form-label">Address</label>
     <div class="col-sm-12">
         <asp:Label ID="LblAddress_Data" runat="server" class="col-form-label" Text="Bhiwandi pipeline" Font-Bold="True"></asp:Label>
     </div>
 </div>
 <div class="row ">
     <label for="LblNotes" class="col-sm-12 col-form-label">Notes</label>
     <div class="col-sm-12">
         <asp:Label ID="LblNotes_Data" runat="server" class="col-form-label" Text="High work pressure body and headche" Font-Bold="True"></asp:Label>
     </div>
 </div>
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
