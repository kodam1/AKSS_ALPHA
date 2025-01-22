<%@ Page Title="" Language="C#" MasterPageFile="~/AKodam_Management/AKSS_Management.Master" 
    AutoEventWireup="true" CodeBehind="AKSS_Component_Icon_Button.aspx.cs" Inherits="AKSS_Management.AKodam_Management.AKSS_Component_Icon_Button" %>
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
             <h1>Component Icon Button</h1>
         </div>

      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
            
                <div class="row g-3 my-3 m-3" >
                    <div class="text-center">

                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="reset" class="btn btn-secondary">Reset</button>   

                        <asp:Button ID="BtnSave" runat="server" Text="Submit" class="btn btn-primary" Visible="true" />                      
                        <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary" Visible="true" />                      
                        <asp:Button ID="BtnDelete" runat="server" Text="Delete" type="reset" class="btn btn-danger" Visible="true" />                       
                        <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset" class="btn btn-secondary" Visible="true" />                        
                        <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel" class="btn btn-primary" Visible="true" />                        
                    </div>                     
                </div>

                 <div class="row g-3 my-3 m-3" >
                     <div class="text-center" >
                         
                         <a id="BtnSelectPatient" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"><i class="bi bi-card-checklist me-1"></i>Select</a>
                         <a id="A1" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"><i class="bx bx-printer me-1"></i>Print</a>
                         <a id="A2" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="bx bxs-edit me-1"></i>Edit</a>
                         <a id="A3" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="bx bxs-trash-alt me-1"></i>Delete</a>
                         <a id="A4" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"><i class="bx bx-copy me-1"></i>Copy</a>
                         <a id="A5" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"><i class="bx bxs-phone-call me-1"></i>Call</a>
                         <a id="A6" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"><i class="bx bxs-message-alt-detail me-1"></i>Message</a>
                         <a id="A7" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"><i class="bx bxl-whatsapp me-1"></i>WhatsApp</a>
                         <a id="A8" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"><i class="bx bx-mail-send me-1"></i>Mail</a>

                         <button type="button" class="btn btn-secondary m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom">
                             Tooltip on bottom
                         </button>

                     </div>
                  </div>

                <div class="row g-3 my-3 m-3" >
                      <div class="text-center"  >
                      <a id="A35" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"    ><i class="bi bi-card-checklist me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >Select</span></a>
                      <a id="A36" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"     ><i class="bx bx-printer me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >Print</span></a>
                      <a id="A37" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"      ><i class="bx bxs-edit me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >Edit</span></a>
                      <a id="A38" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"    ><i class="bx bxs-trash-alt me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >Delete</span></a>
                      <a id="A39" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"      ><i class="bx bx-copy me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >Copy</span></a>
                      <a id="A40" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"      ><i class="bx bxs-phone-call me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >Call</span></a>
                      <a id="A41" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"   ><i class="bx bxs-message-alt-detail me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >Message</span></a>
                      <a id="A42" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"  ><i class="bx bxl-whatsapp me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >WhatsApp</span></a>
                      <a id="A43" runat="server" class="btn btn-primary btn-lg m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"      ><i class="bx bx-mail-send me-1"></i><br /><span style="font-size:medium;margin-top:-5px" >Mail</span></a>                               

                  

                     </div>
                </div>

                <div class="row g-3 my-3 m-3" >
                <div class="text-center gx-3 ">
                    <br />
                    <a id="A91" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"><i class="bi bi-card-checklist me-1"></i></a>
                    <a id="A10" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"><i class="bx bx-printer me-1"></i></a>
                    <a id="A11" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="bx bxs-edit me-1"></i></a>
                    <a id="A12" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="bx bxs-trash-alt me-1"></i></a>
                    <a id="A13" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"><i class="bx bx-copy me-1"></i></a>
                    <a id="A14" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"><i class="bx bxs-phone-call me-1"></i></a>
                    <a id="A15" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"><i class="bx bxs-message-alt-detail me-1"></i></a>
                    <a id="A16" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"><i class="bx bxl-whatsapp me-1"></i></a>
                    <a id="A17" runat="server" class="btn btn-dark btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"><i class="bx bx-mail-send me-1"></i></a>

                
                </div>
                </div>

                 <div class="row g-3 my-3 m-3" >
                    <div class="text-center"  >
                    <a id="A53" runat="server" class="btn btn-dark m-2"><i class="bi bi-card-checklist me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Select</span></a>
                    <a id="A54" runat="server" class="btn btn-dark m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"    ><i class="bx bx-printer me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Print</span></a>
                    <a id="A55" runat="server" class="btn btn-dark m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"     ><i class="bx bxs-edit me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Edit</span></a>
                    <a id="A56" runat="server" class="btn btn-dark m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"   ><i class="bx bxs-trash-alt me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Delete</span></a>
                    <a id="A57" runat="server" class="btn btn-dark m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"     ><i class="bx bx-copy me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Copy</span></a>
                    <a id="A58" runat="server" class="btn btn-dark m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"     ><i class="bx bxs-phone-call me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Call</span></a>
                    <a id="A59" runat="server" class="btn btn-dark m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"  ><i class="bx bxs-message-alt-detail me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Message</span></a>
                    <a id="A60" runat="server" class="btn btn-dark m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp" ><i class="bx bxl-whatsapp me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >WhatsApp</span></a>
                    <a id="A61" runat="server" class="btn btn-dark m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"     ><i class="bx bx-mail-send me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Mail</span></a>                               

                 

                       </div>
                  </div>


                 <div class="row g-3 my-3 m-3" >
                    <div class="text-center"  >
                    <a id="A62" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"   ><i class="bi bi-card-checklist me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Select</span></a>
                    <a id="A63" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"    ><i class="bx bx-printer me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Print</span></a>
                    <a id="A64" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"     ><i class="bx bxs-edit me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Edit</span></a>
                    <a id="A65" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"   ><i class="bx bxs-trash-alt me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Delete</span></a>
                    <a id="A66" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"     ><i class="bx bx-copy me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Copy</span></a>
                    <a id="A67" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"     ><i class="bx bxs-phone-call me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Call</span></a>
                    <a id="A68" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"  ><i class="bx bxs-message-alt-detail me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Message</span></a>
                    <a id="A69" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp" ><i class="bx bxl-whatsapp me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >WhatsApp</span></a>
                    <a id="A70" runat="server" class="btn btn-light m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"     ><i class="bx bx-mail-send me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Mail</span></a>                               

                

                       </div>
                  </div>

                <div class="row g-3 my-3 m-3" >
                <div class="text-center gx-3">
                    <br />
                    <a id="A26" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"><i class="bi bi-card-checklist me-1"></i></a>
                    <a id="A27" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"><i class="bx bx-printer me-1"></i></a>
                    <a id="A28" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="bx bxs-edit me-1"></i></a>
                    <a id="A29" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="bx bxs-trash-alt me-1"></i></a>
                    <a id="A30" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"><i class="bx bx-copy me-1"></i></a>
                    <a id="A31" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"><i class="bx bxs-phone-call me-1"></i></a>
                    <a id="A32" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"><i class="bx bxs-message-alt-detail me-1"></i></a>
                    <a id="A33" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"><i class="bx bxl-whatsapp me-1"></i></a>
                    <a id="A34" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"><i class="bx bx-mail-send me-1"></i></a>
 
                </div>
                </div>
                <div class="row g-3 my-3 m-3" >
                <div class="text-center gx-3 ">
                    <br />
                    <a id="A9" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"><i class="bi bi-card-checklist me-1"></i></a>
                    <a id="A18" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"><i class="bx bx-printer me-1"></i></a>
                    <a id="A19" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="bx bxs-edit me-1"></i></a>
                    <a id="A20" runat="server" class="btn btn-danger btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="bx bxs-trash-alt me-1"></i></a>
                    <a id="A21" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"><i class="bx bx-copy me-1"></i></a>
                    <a id="A22" runat="server" class="btn btn-primary btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"><i class="bx bxs-phone-call me-1"></i></a>
                    <a id="A23" runat="server" class="btn btn-info btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"><i class="bx bxs-message-alt-detail me-1"></i></a>
                    <a id="A24" runat="server" class="btn btn-success btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp"><i class="bx bxl-whatsapp me-1"></i></a>
                    <a id="A25" runat="server" class="btn btn-warning btn-lg m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"><i class="bx bx-mail-send me-1"></i></a>
 
                </div>
              </div>


                  <div class="row g-3 my-3 m-3" >
                    <div class="text-center"  >

                         <%--<i class="icon bi bi-eye me-1 m-1"
    style="background-color: #0d6efd; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; 
        padding-top: 10px !important;padding-left: 10px !important;padding-bottom: 15px !important;">        
    <asp:Button ID="GvBtn_View" runat="server" Text="View" CssClass="btn btn-primary  m-1"
        data-bs-toggle="tooltip" data-bs-placement="bottom" title="View"                                                                                                                                
        OnclientClick="return confirm('Are you sure you want to View this user?');" />
       
</i>--%>
                    
                    <a id="A72" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="View"   ><i class="bi bi-eye me-1 m-1" style="font-size: x-large;"></i>&nbsp;<span style="font-size:medium;" >View</span></a>
                    <a id="A71" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="View"   ><i class="bi bi-eye me-1 m-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >View</span></a>
                    <a id="A44" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Select"   ><i class="bi bi-card-checklist me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Select</span></a>
                    <a id="A45" runat="server" class="btn btn-warning m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Print"    ><i class="bx bx-printer me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Print</span></a>
                    <a id="A46" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"     ><i class="bx bxs-edit me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Edit</span></a>
                    <a id="A47" runat="server" class="btn btn-danger m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"   ><i class="bx bxs-trash-alt me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Delete</span></a>
                    <a id="A48" runat="server" class="btn btn-success m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Copy"     ><i class="bx bx-copy me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Copy</span></a>
                    <a id="A49" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Call"     ><i class="bx bxs-phone-call me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Call</span></a>
                    <a id="A50" runat="server" class="btn btn-info m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Message"  ><i class="bx bxs-message-alt-detail me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Message</span></a>
                    <a id="A51" runat="server" class="btn btn-success m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WhatsApp" ><i class="bx bxl-whatsapp me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >WhatsApp</span></a>
                    <a id="A52" runat="server" class="btn btn-warning m-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail"     ><i class="bx bx-mail-send me-1" style="font-size: x-large;"></i><br /><span style="font-size:medium;" >Mail</span></a>                               
 
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
