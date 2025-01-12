<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/AKodam_Management/AKSS_Management.Master" 
    AutoEventWireup="true" CodeBehind="UserMaster.aspx.cs" Inherits="AKSS_Management.AdminPanel.UserMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"  >
     


   
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
         
      <div class="row">
        
        <div class="col-lg-12">
 
          <div >
            <div class="card-body">
              <h5 class="card-title">User Master</h5>

              <!-- Floating Labels Form -->
              <div class="row g-3">
                  <div class="col-md-6 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="txtUserId" runat="server" class="form-control"  OnTextChanged="txtUserId_TextChanged" AutoPostBack="true" placeholder="Your Name"></asp:TextBox>
                    <label for="txtUserId">User Id</label>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-floating">
                     <asp:TextBox id="txtUserName" runat="server" class="form-control"   placeholder="User Name" ></asp:TextBox>                    
                    <label for="txtUserName">User Name</label>
                  </div>
                </div>               
              </div>
             <div class="row g-3">
              <div class="col-md-6 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="txtEmail" runat="server" class="form-control" TextMode="Email"  placeholder="Email" ></asp:TextBox>                                        
                 <label for="txtEmail">Email</label>
               </div>
             </div>
               <div class="col-md-6 mb-3">
                 <div class="form-floating">
                    <asp:TextBox id="txtPassword" runat="server" class="form-control" Type="password" ToolTip="true"></asp:TextBox>                                        
                      
                   <label for="txtPassword">Password</label>
                 </div>
               </div>
             </div>
              <div class="row g-3">
                <div class="col-md-6 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="txtFullName" runat="server" class="form-control"   placeholder="Full Name" ></asp:TextBox>                                        
                    <label for="txtFullName">Full Name</label>
                  </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="form-floating mb-3">
                    <asp:DropDownList id="ddlRole" runat="server" class="form-select"  aria-label="State" >
                      <asp:ListItem Value="Select" Text="Select" selected="True">Select</asp:ListItem>
                      <asp:ListItem value="Admin"  Text="Admin" >Admin</asp:ListItem>
                      <asp:ListItem value="User"  Text="User" >User</asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlRole">Role</label>
                  </div>
                </div>
              </div>
              <div class="row g-3">
                <div class="col-md-6 mb-3">                
                    <div class="form-floating">
                      <asp:TextBox id="txtPhoneNumber" runat="server" TextMode="Number" class="form-control"   placeholder="Phone No." ></asp:TextBox>                                        
                      <label for="txtPhoneNumber">Phone No</label>
                    </div>                 
                </div>
                <div class="col-md-6 mb-3">
                  <div class="mb-3">
                      
                    <asp:CheckBox ID="chkIsActive" runat="server" Checked="true" CssClass="form-control" Text="Active" /> 
                  <%--  <label for="chkIsActive">Active</label>--%>
                  </div>
                </div>
             </div>
             <div class="row g-3">
             
                <div class="text-center">
                  <%--<button type="submit" class="btn btn-primary">Submit</button>
                  <button type="reset" class="btn btn-secondary">Reset</button>--%>

                    <asp:Button ID="BtnSave" runat="server" Text="Submit" OnClick="BtnSave_Click" class="btn btn-primary"/>
                    <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
                     <asp:Button ID="BtnDelete" runat="server" Text="Delete" OnClick="BtnDelete_Click" type="reset" class="btn btn-danger"/>
                    <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" type="reset" class="btn btn-secondary"/>
                    <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel" OnClick="BtnExportToExcel_Click" class="btn btn-primary"/>
                    
                </div>
              </div>
              <!-- End floating Labels Form -->

            </div>
          </div>

        </div>
      </div>

    </asp:Panel>

     <asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto" Width="100%" >
        <%-- <div class="pagetitle">
          <h3 class="mb-3">User Master List</h3>
         </div>--%>

         <div class="row">
             <div class="col-lg-12">
                 <div class="card-body">
                     <h5 class="card-title">User Master List</h5>

                     <asp:GridView ID="gvUserMaster" runat="server" AutoGenerateColumns="false" CssClass="table datatable" 
                          ShowHeader="true">
                         <Columns>
                             <asp:BoundField DataField="UserId" HeaderText="User Id" />
                             <asp:BoundField DataField="UserName" HeaderText="User Name" />
                             <asp:BoundField DataField="Email" HeaderText="Email" />
                             <%-- <asp:BoundField DataField="PasswordHash" HeaderText="Password" />--%>
                             <asp:BoundField DataField="FullName" HeaderText="FullName" />
                             <asp:BoundField DataField="Role" HeaderText="Role" />
                             <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" />
                             <asp:BoundField DataField="IsActive" HeaderText="Active" />

                         </Columns>
                     </asp:GridView>
                 </div>
             </div>
         </div>

     </asp:Panel>
    </section>

  </main><!-- End #main -->


</asp:Content>
