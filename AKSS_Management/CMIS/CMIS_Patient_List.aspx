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
  </style>
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

                     <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false"
                         DataKeyNames="ID"
                         ShowHeader="true"
                         CssClass="table datatable"
                         SortExpression="Id"
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
                                                        <%--<asp:Button ID="GvBtn_Edit" runat="server" Text="Edit" CssClass="btn btn-primary" />--%>
                                                        <a id="A_GvBtn_Edit" runat="server" class="btn btn-primary m-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"
                                                            CommandName="Edit"
                                                            CommandArgument="<%# Container.DataItemIndex %>">
                                                            
                                                            <i class="bx bxs-edit me-1"></i>Edit
                                                        </a>
                                                        <a id="A_GvBtn_Delete" runat="server" class="btn btn-danger m-1" data-bs-toggle="tooltip"
                                                            data-bs-placement="bottom" title="Delete" commandname="Delete"
                                                            commandargument="<%# Container.DataItemIndex %>">
                                                            <i class="bx bxs-trash-alt me-1"></i>Delete
                                                        </a>
                                                        <a id="A_GvBtn_Create_Appointment" runat="server" class="btn btn-warning  m-1" data-bs-toggle="tooltip" 
                                                            data-bs-placement="bottom" title="Create Appointment"
                                                            commandname="Create_Appointment"
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


