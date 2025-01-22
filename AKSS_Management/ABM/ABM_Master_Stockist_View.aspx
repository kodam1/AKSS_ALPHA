<%@ Page Title="Stockist Master View" Async="true"  Language="C#" MasterPageFile="~/ABM/ABM.Master" 
    AutoEventWireup="true" CodeBehind="ABM_Master_Stockist_View.aspx.cs" 
    Inherits="AKSS_Management.ABM.ABM_Master_Stockist_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
          <main id="main" class="main">

    <div class="pagetitle">
      <%--<h1>User Master</h1>--%>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultABM.aspx">Home</a></li>
          <%--<li class="breadcrumb-item">Admin Panel</li>--%>
          <li class="breadcrumb-item active">Stockist Master View</li>
        </ol>
      </nav>
    </div>
    <!-- End Page Title -->

    <section class="section">

     <asp:Panel ID="Panel1" runat="server" class="card"  >

                  <div class="pagetitle my-3 mx-3">
             <h1><a id="A1_BtnBack_Stockist_Master_List" runat="server" class="m-1" href="/ABM/ABM_Master_Stockist_List.aspx"
                     data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Stockist Master List">
                     <i class="ri-arrow-left-line me-1"></i>
                 </a>Stockist Master View</h1>
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
                    <a id="Btn_Delete" runat="server" class="btn btn-danger m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete" onserverclick="Btn_Delete_serverclick"  onclick="return confirm('Are you sure you want to delete this record?');" ><i class="bx bxs-trash-alt me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Delete</span></a>
                    <a id="Btn_Create_Appointment" runat="server" class="btn btn-warning m-2" data-bs-toggle="tooltip" data-bs-placement="bottom"   visible="false" title="Create Appointment"  ><i class="bx bxs-calendar-event me-1 m-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Appointment</span></a><%--onserverclick="Btn_Create_Appointment_serverclick"--%>
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
                            <label for="LblStockist_Id" class="col-sm-12 col-form-label">Stockist ID</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblStockist_Id_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblDivision_Name" class="col-sm-12 col-form-label">Division_Name</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblDivision_Name_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblSML_No" class="col-sm-12 col-form-label">SML No</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblSML_No_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblSML_Saturation" class="col-sm-12 col-form-label">SML Saturation</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblSML_Saturation_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblSTOCKIST_Name" class="col-sm-12 col-form-label">Stockist Name</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblSTOCKIST_Name_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblQualification" class="col-sm-12 col-form-label">Qualification</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblQualification_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblOwner_Contact_Person" class="col-sm-12 col-form-label">Owner_Contact_Person</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblOwner_Contact_Person_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblClass" class="col-sm-12 col-form-label">Class</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblClass_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblCity" class="col-sm-12 col-form-label">City</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblCity_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-6">

                        <div class="row ">
                            <label for="LblAddress1" class="col-sm-12 col-form-label">Address 1</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblAddress1_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblAddress2" class="col-sm-12 col-form-label">Address 2</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblAddress2_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblAddress3" class="col-sm-12 col-form-label">Address 3</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblAddress3_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblArea" class="col-sm-12 col-form-label">Area</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblArea_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblPinCode" class="col-sm-12 col-form-label">PinCode</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblPinCode_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblDate_Of_Birth" class="col-sm-12 col-form-label">Date Of Birth</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblDate_Of_Birth_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblMobile_No" class="col-sm-12 col-form-label">Mobile No.</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblMobile_No_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div class="row ">
                            <label for="LblContact_Person" class="col-sm-12 col-form-label">Contact Person</label>
                            <div class="col-sm-12">
                                <asp:Label ID="LblContact_Person_Data" runat="server" class="col-form-label" Text="" Font-Bold="True"></asp:Label>
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
