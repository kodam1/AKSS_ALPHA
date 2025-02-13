<%@ Page  Title="Medicine List" Async="true" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" AutoEventWireup="true" 
    CodeBehind="CMIS_Medicine_List.aspx.cs" Inherits="AKSS_Management.CMIS.CMIS_Medicine_List" %>
 

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


    <div class="pagetitle">
     <%-- <h1>User Master</h1>--%>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultCMIS.aspx">Home</a></li>
          <%--<li class="breadcrumb-item">Admin Panel</li>--%>
          <li class="breadcrumb-item active">Medicine List</li>
        </ol>
      </nav>
    </div>
    <!-- End Page Title -->

    <section class="section">

     <asp:Panel ID="Panel1" runat="server" class="card" Visible="false" >
         <div class="pagetitle my-3 mx-3">
             <h1>Medicine List</h1>
         </div>
      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">
                  Medicine List
                  <span style="float:right;">
                        <a id="A_Btn_Add_Medicine" runat="server" class="btn btn-primary btn-lg m-1" 
                            data-bs-toggle="tooltip" data-bs-placement="bottom" title="Add Medicine">
                            <i class="bx bxs-plus-circle me-1"></i>
                            Add Medicine</a>
                  </span>
              </h5>                                                
            </div>
          </div>

        </div>
 
      <div class="row g-3 mb-3">
    
       <div class="text-center">

           <asp:Button ID="BtnSave" runat="server" Text="Create Medicine" class="btn btn-primary" /> <%-- OnClick="BtnSave_Click"--%>
            <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary"  Visible="false"/> <%--OnClick="BtnSave_Click" --%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  class="btn btn-danger"  Visible="true"/> <%--OnClick="BtnDelete_Click"--%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset"  class="btn btn-secondary"  Visible="false"  />  <%--OnClick="BtnReset_Click" --%>
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" Visible="false"/> <%--OnClick="BtnExportToExcel_Click" --%>
           
       </div>
     </div>

      </div>

     </asp:Panel>

     <asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto" Width="100%" Visible="true" >

         <div class="row">
             <div class="col-lg-12">
                 <div class="card">

                     <div class="row g-3 m-1">
                         <div class="col-lg-12">
                         <span style="font-size:large">
                              Medicine List 
                         </span>
                         <span style="float:right;">
                              <a id="A1_BtnAddMedicine" runat="server" class="m-1" href="/CMIS/CMIS_Create_Medicine.aspx"
                                 data-bs-toggle="tooltip" data-bs-placement="bottom" title="Add Medicine">
                                 <i class="bx bxs-plus-circle me-1" style="font-size: xx-large;"></i>
                                     </a>
                        </span>
                             </div>
                     </div>


                    <div class="row">
        
                    <div class="col-lg-12">
 
                      <div class="card ">
                        <%--<div class="card-body">--%>
                        <div class="row g-3 ">
                            <div class="col-lg-12" style="display:none;">
                              
                                <asp:TextBox id="Txt_GV_Custom_Search1" runat="server" Font-Bold="true" Text="" 
                                    Title="Search" AutoPostBack="true" OnTextChanged="Txt_GV_Custom_Search_TextChanged" 
                                    CssClass="form-control-lg bi bi-search" Width="100%" Phaceholder="Search here..." Wrap="true"
                                    ToolTip="Search here...."
                                    >
                                </asp:TextBox>
                            </div>
                            <div class="col-md-12 mb-3 mt-3 d-flex align-items-center" style="padding-top:30px" >
                                
                               <a style="cursor:pointer;"> <i class="bx bx-search-alt me-1"
                                    style=" border-radius: 5px; font-weight: 100;font-size: x-large; 
                                    padding-left: 10px;"> </i></a>
                                   
                               
                                <asp:TextBox ID="Txt_GV_Custom_Search" runat="server" BorderColor="Black" class="form-control"
                                    ToolTip="Search here..." Placeholder="Medicine Search ..."
                                    TextMode="SingleLine" Width="95%" AutoPostBack="true" OnPreRender="Txt_GV_Custom_Search_TextChanged">
                                </asp:TextBox>                                    
                            

                            </div>
                        </div>                    
                     <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false"
                         DataKeyNames="Medicine_ID"
                         ShowHeader="true"
                         CssClass="table datatable"
                         SortExpression="Medicine_ID"
                         AllowSorting="true"
                         OnRowCommand="GridView1_RowCommand"
                         OnRowCreated="GridView1_RowCreated"                        
                         >
                         <Columns>
                             <asp:TemplateField HeaderText="Billing Expenses Info"  >
                                 <ItemTemplate>
                                     <div class="row g-3 ">

                                         <table class="table table-hover">
                                             <tr class="text-center">
                                                 <td rowspan="5" width="100px" Height="100px" style="border-radius:100%">                                                    
                                                        <asp:ImageButton ID="ImgBtnLogo" runat="server" ImageUrl="~/assets/img/patient.png"
                                                            AlternateText="Logo" Width="100px" Height="100px" BorderStyle="Ridge" Style="border-radius: 100%"
                                                            BackColor="YellowGreen" CssClass="img-thumbnail img-resonsive"
                                                            CommandName="Select"
                                                            CommandArgument="<%# Container.DataItemIndex %>" />

                                                     <asp:HiddenField ID="HfId" runat="server" Value='<%# Bind("Medicine_ID") %>' />

                                                 </td>                                                
                                             </tr>                                             
                                             <tr>
                                                 <td>
                                                     <b>ID #</b><asp:Label ID="LblId" runat="server" Text='<%# Bind("Medicine_ID") %>' Font-Bold="false"></asp:Label>                                                     
                                                 </td>
                                             </tr>
                                             <tr>

                                                 <td>
                                                     <b>Title:</b>
                                                     <asp:Label ID="LblTitle" runat="server" Text='<%# Bind("Title") %>' Font-Bold="false"></asp:Label></td>
                                             </tr>
                                             <tr>
                                                 <td>
                                                     <b>Category:</b>
                                                     <asp:Label ID="LblCategory" runat="server" Text='<%# Bind("Category") %>' Font-Bold="false"></asp:Label>

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
                                                                OnclientClick="return confirm('Are you sure you want to delete this user?');"
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

