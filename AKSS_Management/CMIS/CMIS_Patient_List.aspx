<%@ Page  Title="Patient List" Async="true"  Language="C#" 
    MasterPageFile="~/CMIS/CMIS.Master" AutoEventWireup="true" 
    CodeBehind="CMIS_Patient_List.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Patient_List" %>

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
             <h1>Patient List</h1>
         </div>
      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">Patient List</h5>                                                
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
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" Visible="false"/> <%--OnClick="BtnExportToExcel_Click" --%>
           
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
                 <div class="card-body">
                     <h5 class="card-title">Patient List</h5>                   
                        <div class="row g-3 ">
                            <div class="col-lg-12" style="display:none;">
                              
                                <asp:TextBox id="Txt_GV_Custom_Search1" runat="server" Font-Bold="true" Text="" 
                                    Title="Search" AutoPostBack="true" OnTextChanged="Txt_GV_Custom_Search_TextChanged" 
                                    CssClass="form-control-lg bi bi-search" Width="100%" Phaceholder="Search here..." Wrap="true"
                                    ToolTip="Search here...."
                                    >
                                </asp:TextBox>
                            </div>
                            <div class="col-md-12 mb-3 d-flex align-items-center" >
                                
                               <a style="cursor:pointer;"> <i class="bx bx-search-alt me-1"
                                    style=" border-radius: 5px; font-weight: 100;font-size: x-large; 
                                    padding-left: 10px;"> </i></a>
                                   
                               
                                <asp:TextBox ID="Txt_GV_Custom_Search" runat="server" BorderColor="Black" class="form-control"
                                    ToolTip="Search here..." Placeholder="Patient Search ..."
                                    TextMode="SingleLine" Width="100%" AutoPostBack="true" OnPreRender="Txt_GV_Custom_Search_TextChanged">
                                </asp:TextBox>                                    
                            

                            </div>
                        </div>                    
                     <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false"
                         DataKeyNames="ID"
                         ShowHeader="true"
                         CssClass="table datatable"
                         SortExpression="ID"
                         AllowSorting="true"
                         OnRowCommand="GridView1_RowCommand"
                         OnRowCreated="GridView1_RowCreated"
                        
                         >
<%--                           OnSelectedIndexChanged="GridView1_SelectedIndexChanged"--%>
                         <Columns>
                             <asp:TemplateField HeaderText="Patient Info"  >
                                 <ItemTemplate>
                                     <div class="row g-3 ">

                                         <table class="table table-hover">
                                             <tr class="text-center">
                                                 <td rowspan="5" width="100px" Height="100px" style="border-radius:100%">
                                                    <%--<i class="bi bi-person-plus"> </i>--%>
                                                        <asp:ImageButton ID="ImgBtnLogo" runat="server" ImageUrl="~/assets/img/patient.png"
                                                            AlternateText="Logo" Width="100px" Height="100px" BorderStyle="Ridge" Style="border-radius: 100%"
                                                            BackColor="YellowGreen" CssClass="img-thumbnail img-resonsive"
                                                            CommandName="Select"
                                                            CommandArgument="<%# Container.DataItemIndex %>" />

                                                     <asp:HiddenField ID="HfId" runat="server" Value='<%# Bind("ID") %>' />

                                                 </td>                                                
                                             </tr>                                             
                                             <tr>
                                                 <td>
                                                     <b>ID #</b><asp:Label ID="LblId" runat="server" Text='<%# Bind("ID") %>' Font-Bold="false"></asp:Label>                                                     
                                                 </td>
                                             </tr>
                                             <tr>

                                                 <td>
                                                     <b>Name:</b>
                                                     <asp:Label ID="LblFullName" runat="server" Text='<%# Bind("FullName") %>' Font-Bold="false"></asp:Label></td>
                                             </tr>
                                             <tr>
                                                 <td>
                                                     <b>Mob No:</b>
                                                     <asp:Label ID="LblContactNumber" runat="server" Text='<%# Bind("Contact_Number") %>' Font-Bold="false"></asp:Label>

                                                    <span style="float: right;">
                                                        
                                                        <i class="icon bi bi-eye me-1 m-1"
                                                            style="background-color: #0d6efd; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; 
                                                                padding-top: 10px !important;padding-left: 10px !important;padding-bottom: 15px !important;">        
                                                            <asp:Button ID="GvBtn_View" runat="server" Text="View" CssClass="btn btn-primary  m-1"
                                                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="View"                                                                                                                                
                                                                OnclientClick="return confirm('Are you sure you want to View this user?');"
                                                                CommandName="GvBtn_View" style="font-family: arial;"
                                                                CommandArgument="<%# Container.DataItemIndex %>"/>
                                                        </i>

                                                        <i class="bx bxs-edit me-1 m-1"
                                                            style="background-color: #0d6efd; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; 
                                                            padding-left: 10px;">
                                                            <asp:Button ID="GvBtn_Edit" runat="server" Text="Edit" CssClass="btn btn-primary  m-1"
                                                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"                                                                                                                                
                                                                OnclientClick="return confirm('Are you sure you want to edit this user?');"
                                                                CommandName="GvBtn_Edit" style="font-family: arial;"
                                                                CommandArgument="<%# Container.DataItemIndex %>"/>
                                                        </i>

                                                        <%--OnClientClick="showModal('Edit Record','Are you sure you want to edit this record ?','')"
                                                              OnclientClick="return confirm('Are you sure you want to edit this user?');" --%>

                                                        <i class="bx bxs-trash-alt me-1 m-1"
                                                            style="background-color: #dc3545; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; 
                                                            padding-left: 10px;">
                                                            <asp:Button ID="GvBtn_Delete" runat="server" Text="Delete" CssClass="btn btn-danger m-1"
                                                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"
                                                                OnclientClick="return confirm('Are you sure you want to delete this user?');"
                                                                CommandName="GvBtn_Delete" style="font-family: arial;"
                                                                CommandArgument="<%# Container.DataItemIndex %>"/>
                                                        </i>

                                                        <i class="bx bxs-calendar-event me-1 m-1"
                                                            style="background-color: #ffc107; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; 
                                                            padding-left: 10px;">
                                                            <asp:Button ID="GvBtn_Create_Appointment" runat="server" Text="Create Appointment" CssClass="btn btn-warning  m-1"
                                                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="Create Appointment"
                                                                OnclientClick="return confirm('Are you sure you want to create appointment for his user?');"
                                                                CommandName="GvBtn_Create_Appointment" style="font-family: arial;"
                                                                CommandArgument="<%# Container.DataItemIndex %>"/>
                                                        </i>

                                                        <a id="A_GvBtn_Edit" visible="false" runat="server" class="btn btn-primary m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"
                                                            CommandName="A_GvBtn_Edit"
                                                            CommandArgument="<%# Container.DataItemIndex %>">                                                            
                                                            <i class="bx bxs-edit me-1"></i>Edit
                                                        </a>

                                                        <a id="A_GvBtn_Delete" visible="false"  runat="server" class="btn btn-danger m-1" data-bs-toggle="tooltip"
                                                            data-bs-placement="bottom" title="Delete" commandname="A_GvBtn_Delete"
                                                            commandargument="<%# Container.DataItemIndex %>">
                                                            <i class="bx bxs-trash-alt me-1"></i>Delete
                                                        </a>

                                                        <a id="A_GvBtn_Create_Appointment"  visible="false" runat="server" class="btn btn-warning  m-1" data-bs-toggle="tooltip" 
                                                            data-bs-placement="bottom" title="Create Appointment"
                                                            commandname="A_GvBtn_Create_Appointment"
                                                            commandargument="<%# Container.DataItemIndex %>">
                                                            <i class="bx bxs-calendar-event me-1"></i>Create Appointment
                                                        </a>

                                                    </span>

                                                 </td>

                                             </tr>
                                             <tr style="display:none;">
                                                 <td>
                                                     <b>Age: </b>
                                                     <asp:Label ID="LblAge" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                                     &nbsp; &nbsp;
                                                     <b>Gender:</b>
                                                     <asp:Label ID="LblGender" runat="server" Text='<%# Bind("Gender") %>' Font-Bold="false"></asp:Label>
                                                     &nbsp;                                                    
                                                 </td>
                                             </tr>
<%--                                             <tr>
                                                 <td>
                                                  
                                                 <td>
                                                     <asp:Label ID="LblNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:Label></td>
                                             </tr>--%>
                                         </table>
                                      <%--   <div class="col-md-12 " style="display: block;">
                                             <div class="form-floating">
                                                 <asp:Label ID="LblId" runat="server" Text='<%# Bind("ID") %>'></asp:Label><br />
                                                  <asp:Label ID="LblFullName" runat="server" Text='<%# Bind("FullName") %>'></asp:Label><br />
                                                 <asp:Label ID="LblContactNumber" runat="server" Text='<%# Bind("Contact_Number") %>'></asp:Label><br />
                                                <asp:Label ID="LblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label><br />
                                                 <asp:Label ID="LblAge" runat="server" Text='<%# Bind("Age") %>'></asp:Label><br />
                                                 <asp:Label ID="LblNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:Label><br />
                                             </div>
                                         </div>   --%>                               
                                     </div>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         
                         </Columns>
                     </asp:GridView>
                 </div>
             </div>
         </div>

     </asp:Panel>
    </section>

  </main><!-- End #main -->

</asp:Content>


