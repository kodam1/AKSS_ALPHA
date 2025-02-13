<%@ Page Title="Profile" Async="true"  Language="C#" MasterPageFile="~/AKodam_Management/AKSS_Management.Master" 
    AutoEventWireup="true" CodeBehind="AKSS_Profile.aspx.cs" 
    Inherits="AKSS_Management.AKodam_Management.AKSS_Profile" 
    validateRequest="false" 
    %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <main id="main" class="main">

  <div class="pagetitle">
    <%--<h1>Send Bulk Email</h1>--%>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/DefaultAKSS.aspx">Home</a></li>
        <li class="breadcrumb-item">Pages</li>
        <li class="breadcrumb-item active">Profile</li>
      </ol>
    </nav>
  </div>
  <!-- End Page Title -->

  <section class="section">

   <asp:Panel ID="Panel1" runat="server" class="card"  >
       <div class="pagetitle my-3 mx-3">
           <h1>Profile</h1>
       </div>
    <div class="row">
      
      <div class="col-lg-12">
 
        <div class="card ">
          <%--<div class="card-body">--%>
            <%--<h5 class="card-title">Send Bulk Email</h5>--%> 

            <div class="row g-3 mt-3 mx-1">
                <div class="col-md-12 mb-3">
                <div class="form-floating">
                  <asp:TextBox id="txtID" runat="server"  class="form-control" ReadOnly="true" AutoPostBack="true" OnTextChanged="txtID_TextChanged"></asp:TextBox>  <%-- TextMode="MultiLine" Height="100px" Width="100%"   AutoPostBack="true" OnTextChanged="txtID_TextChanged"--%>
                  <label for="txtID">Profile ID </label>
                </div>
              </div>
              
            </div>
              
            <div class="row g-3  mx-1">
                <div class="col-md-6 mb-3">
                <div class="form-floating">
                  <asp:TextBox id="txtFullName" runat="server"  class="form-control"  AutoPostBack="true" OnTextChanged="txtFullName_TextChanged"></asp:TextBox>  <%-- TextMode="MultiLine" Height="100px" Width="100%" AutoPostBack="true" OnTextChanged="txtClientId_TextChanged"--%>
                  <label for="txtFullName">Profile Full Name </label>
                </div>
              </div>
                <div class="col-md-6 mb-3">
                <div class="form-floating">
                  <asp:TextBox id="txtDesignation" runat="server"  class="form-control"  ></asp:TextBox>  <%-- TextMode="MultiLine" Height="100px" Width="100%" AutoPostBack="true" OnTextChanged="txtClientId_TextChanged"--%>
                  <label for="txtDesignation">Profile Designation </label>
                </div>
              </div>
                <div class="col-md-6 mb-3">
                  <div class="mb-3">
                      
                    <asp:CheckBox ID="chkIsActive" runat="server" Checked="true" CssClass="form-control" Text="Active" /> 
                  
                  </div>
              </div>              
            </div>
             
         </div>

          <div class="card ">
              <div class="row g-3">
                  <div class="col-md-12 mb-3">
                      <div class="mb-3">

                          <!-- TinyMCE Editor -->
                          <textarea class="tinymce-editor" runat="Server" id="TxtTinymceEditor" 
                              style="height: 1000px !important">                               
                          </textarea>
                          <!-- End TinyMCE Editor -->

                          <br />
                      </div>
                  </div>
              </div>
          </div>       

      </div>

            <div class="row g-3 mb-3">
  
     <div class="text-center">
       
         <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click"  class="btn btn-primary"/> <%--OnClick="BtnSave_Click"--%>
         <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
          <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset"  class="btn btn-danger" Visible="false"/> <%--OnClick="BtnDelete_Click"--%>
         <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset" OnClick="BtnReset_Click" class="btn btn-secondary"/>  <%-- OnClick="BtnReset_Click"--%>
         <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" OnClick="BtnExportToExcel_Click"  Visible="false"/> <%--OnClick="BtnExportToExcel_Click" --%>
         
     </div>
   </div>

    </div>

   </asp:Panel>

   <asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto" Width="100%" style="height:auto;" Visible="false" >
     
       <div class="row">
           <div class="col-lg-12">
               <div class="card-body">
                   <h5 class="card-title">Client Email List</h5>

                   <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False"                      
                                   CssClass="table datatable table-hover"                        
                                   ShowHeader="true"
                                   SortExpression="Id"
                                   AllowSorting="true"
                                   DataKeyNames="Id" 
                                    OnRowCommand="GridView1_RowCommand"
                                    OnRowCreated="GridView1_RowCreated"
                                  >
                       <Columns>

<%--                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
 OnRowCreated="GridView1_RowCreated" --%>
                           <asp:BoundField DataField="Id" HeaderText="Sr No." />
                           <asp:BoundField DataField="FullName" HeaderText="FullName" />
                           <asp:BoundField DataField="Designation" HeaderText="Designation" />
                            <asp:BoundField DataField="IsActive" HeaderText="Status" />
                            
                           <asp:TemplateField HeaderText="select">
                               <ItemTemplate>
                                   <asp:Button ID="BtnGvSelect" Text="Select" runat="server" CommandName="Select"
                                       CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-primary" />
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
