<%@ Page Title="List Appointments" Async="true"  Language="C#" MasterPageFile="~/ABM/ABM.Master" 
    AutoEventWireup="true" CodeBehind="ABM_List_Appointments.aspx.cs" 
    Inherits="AKSS_Management.ABM.ABM_List_Appointments" %>

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

        <!-- Bootstrap Modal Structure -->
        <div id="dynamicModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="modalBody">
                        <!-- Modal Content Here -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary" id="modalSaveButton">Yes</button>
                    </div>
                </div>
            </div>
        </div>


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

     <asp:Panel ID="Panel1" runat="server" class="card" Visible="false" >
         <div class="pagetitle my-3 mx-3">
             <h1>View Appointments List</h1>
         </div>
      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">
                  View Appointments List
                  <span style="float:right;">
                        <a id="A_Btn_Add_Billing_Expenses" runat="server" class="btn btn-primary btn-lg m-1" 
                            data-bs-toggle="tooltip" data-bs-placement="bottom" title="Add Billing Expenses">
                            <i class="bx bxs-plus-circle me-1"></i>
                            Add Appointments</a>
                  </span>
              </h5>                                                
            </div>
          </div>

        </div>
 
              <div class="row g-3 mb-3">
    
       <div class="text-center">
         <%--<button type="submit" class="btn btn-primary">Submit</button>
         <button type="reset" class="btn btn-secondary">Reset</button>--%>

           <asp:Button ID="BtnSave" runat="server" Text="Create Patient" class="btn btn-primary" /> <%-- OnClick="BtnSave_Click"--%>
            <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary"  Visible="false"/> <%--OnClick="BtnSave_Click" --%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  class="btn btn-danger"  Visible="false"/> <%--OnClick="BtnDelete_Click"--%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset"  class="btn btn-secondary"  Visible="true"  />  <%--OnClick="BtnReset_Click" --%>
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" Visible="true" OnClick="BtnExportToExcel_Click"/> <%--OnClick="BtnExportToExcel_Click" --%>
           
       </div>
     </div>

      </div>

     </asp:Panel>

     <asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto" Width="100%" Visible="true" >
        <%-- <div class="pagetitle">
          <h3 class="mb-3">User Master List</h3>
         </div>--%>

         <div class="row">
             <div class="col-lg-12">
                 <div class="card">
                     <%--<h5 class="card-title">
                         Billing Expenses List                        
                      
                     </h5> --%>

                     <div class="row g-3 m-1">
                         <div class="col-lg-12">
                         <span style="font-size:large">
                              View Appointments List 
                         </span>
                         <span style="float:right;">
                              <a id="A1_BtnAddViewAppointments" runat="server" class="m-1" href="/ABM/ABM_Create_Appointments.aspx"
                                 data-bs-toggle="tooltip" data-bs-placement="bottom" title="Add Appointments">
                                 <i class="bx bxs-plus-circle me-1" style="font-size: xx-large;"></i>
                                     </a>
                        </span>
                             </div>
                     </div>


                    <div class="row">
        
                    <div class="col-lg-12">
 
                      <div class="card ">
                        <%--<div class="card-body">--%>

                            <div class="row mt-1">
                                <div class="col-md-12 text-end">
                                    <asp:Button ID="Button1" runat="server" Text="Download Excel" class="btn btn-primary" 
                                        Visible="false" OnClick="BtnExportToExcel_Click" />

                                    <a id="A73" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip" 
                                        data-bs-placement="bottom" title="Download Excel" onserverclick="BtnExportToExcel_Click" >
                                        <i class="bx bxs-download me-1" style="font-size: x-large;"></i>
                                       <%-- <br />--%>
                                        <span style="font-size:medium;" >
                                       Download Excel</span>

                                    </a>                               
                                    <%--OnClick="BtnExportToExcel_Click" --%>
                                </div>
                            </div>
                        <div class="row g-3 ">
                            <div class="col-lg-12" style="display:none;">
                              
                                <asp:TextBox id="Txt_GV_Custom_Search1" runat="server" Font-Bold="true" Text="" 
                                    Title="Search" AutoPostBack="true" OnTextChanged="Txt_GV_Custom_Search_TextChanged" 
                                    CssClass="form-control-lg bi bi-search" Width="100%" Phaceholder="Search here..." Wrap="true"
                                    ToolTip="Search here...."
                                    >
                                </asp:TextBox>
                            </div>
                            <div class="col-md-12 mb-3 mt-1 d-flex align-items-center" style="padding-top:30px" >
                                
                               <a style="cursor:pointer;"> <i class="bx bx-search-alt me-1"
                                    style=" border-radius: 5px; font-weight: 100;font-size: x-large; 
                                    padding-left: 10px;"> </i></a>
                                   
                               
                                <asp:TextBox ID="Txt_GV_Custom_Search" runat="server" BorderColor="Black" class="form-control"
                                    ToolTip="Search here..." Placeholder="Patient Search ..."
                                    TextMode="SingleLine" Width="95%" AutoPostBack="true" OnTextChanged="Txt_GV_Custom_Search_TextChanged">
                                </asp:TextBox>                                    
                            

                            </div>
                        </div>                    
                     <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false"
                         DataKeyNames="Id"
                         ShowHeader="true"
                         CssClass="table datatable"
                         SortExpression="Id"
                         AllowSorting="true"
                         OnRowCommand="GridView1_RowCommand"
                         OnRowCreated="GridView1_RowCreated"                        
                         >
                         <Columns>
                             <asp:TemplateField HeaderText="Appointments Info"  >
                                 <ItemTemplate>
                                     <div class="row g-3 ">

                                         <table class="table table-hover">
                                             <%--<tr class="text-center">
                                                 <td rowspan="5" width="100px" Height="100px" style="border-radius:100%">                                                    
                                                        <asp:ImageButton ID="ImgBtnLogo" runat="server" ImageUrl="~/assets/img/patient.png"
                                                            AlternateText="Logo" Width="100px" Height="100px" BorderStyle="Ridge" Style="border-radius: 100%"
                                                            BackColor="YellowGreen" CssClass="img-thumbnail img-resonsive"
                                                            CommandName="Select"
                                                            CommandArgument="<%# Container.DataItemIndex %>" />

                                                    

                                                 </td>                                                
                                             </tr>  --%>                                           
                                             <tr>
                                                 <td>
                                                      <asp:HiddenField ID="HfId" runat="server" Value='<%# Bind("Id") %>' />
                                                     <b>ID #</b><asp:Label ID="LblId" runat="server" Text='<%# Bind("Id") %>' Font-Bold="false"></asp:Label>                                                     
                                                 </td>
                                             </tr>
                                             <tr>

                                                 <td>
                                                     <b>Date:</b>
                                                     <asp:Label ID="LblDate" runat="server" Text='<%# Bind("Date") %>' Font-Bold="false"></asp:Label></td>
                                             </tr>
                                            <tr>
                                                 <td>
                                                     <b>DoctorName:</b>
                                                     <asp:Label ID="LblDoctorName" runat="server" Text='<%# Bind("DoctorName") %>' Font-Bold="false"></asp:Label></td>

                                             </tr>
                                                <tr>

                                                 <td>
                                                     <b>ChemistName:</b>
                                                     <asp:Label ID="LblChemistName" runat="server" Text='<%# Bind("ChemistName") %>' Font-Bold="false"></asp:Label></td>
                                             </tr>
                                              <tr>

                                                 <td>
                                                     <b>StockistName:</b>
                                                     <asp:Label ID="LblStockistName" runat="server" Text='<%# Bind("StockistName") %>' Font-Bold="false"></asp:Label></td>
                                             </tr>
                                              <tr>

                                                 <td>
                                                     <b>Area_Location:</b>
                                                     <asp:Label ID="LblArea_Location" runat="server" Text='<%# Bind("Area_Location") %>' Font-Bold="false"></asp:Label></td>
                                             </tr>
                                              <tr>

                                                 <td>
                                                     <b>Note:</b>
                                                     <asp:Label ID="Lbl" runat="server" Text='<%# Bind("Note") %>' Font-Bold="false"></asp:Label></td>
                                             </tr>
                                             <tr>
                                                 <td>                                                   
                                                    <span style="float: right;">
                                                        
                                                        <i class="icon bi bi-eye me-1 m-1"
                                                            style="background-color: #0d6efd; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; 
                                                                padding-top: 10px !important;padding-left: 10px !important;padding-bottom: 15px !important;">        
                                                            <asp:Button ID="GvBtn_View" runat="server" Text="View" CssClass="btn btn-primary  m-1"
                                                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="View"                                                                                                                                                                                               
                                                                CommandName="GvBtn_View" style="font-family: arial;"
                                                                CommandArgument="<%# Container.DataItemIndex %>"/>
                                                        </i>
                                                         <%--OnclientClick="return confirm('Are you sure you want to View this user?');"--%>

                                                        <i class="bx bxs-edit me-1 m-1"
                                                            style="background-color: #0d6efd; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; 
                                                            padding-left: 10px;">
                                                            <asp:Button ID="GvBtn_Edit" runat="server" Text="Edit" CssClass="btn btn-primary  m-1"
                                                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"                                                                                                                                                                                                
                                                                CommandName="GvBtn_Edit" style="font-family: arial;"
                                                                CommandArgument="<%# Container.DataItemIndex %>"/>
                                                        </i>

                                                        <%--  OnclientClick="return confirm('Are you sure you want to edit this user?');"
                                                              OnClientClick="showModal('Edit Record','Are you sure you want to edit this record ?','')"
                                                              OnclientClick="return confirm('Are you sure you want to edit this user?');" --%>

                                                        <i class="bx bxs-trash-alt me-1 m-1"
                                                            style="background-color: #dc3545; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; 
                                                            padding-left: 10px;">
                                                            <asp:Button ID="GvBtn_Delete" runat="server" Text="Delete" CssClass="btn btn-danger m-1"
                                                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"
                                                                OnclientClick="return confirm('Are you sure you want to delete this record?');"
                                                                CommandName="GvBtn_Delete" style="font-family: arial;"
                                                                CommandArgument="<%# Container.DataItemIndex %>"/>
                                                        </i>                                                         
                                                    </span>
                                                 </td>
                                             </tr>    
                                         </table>
                                                          
                                     </div>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         
                         </Columns>
                     </asp:GridView>
                        <%--</div>--%>

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




