<%@ Page Title="Emp Create" Async="true" Language="C#" 
    MasterPageFile="~/AKodam_Management/AKSS_Management.Master" 
    AutoEventWireup="true" CodeBehind="EmpDemoCreate.aspx.cs" 
    Inherits="AKSS_Management.AKodam_Management.EmpDemoCreate"

%>

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
             <h1>Emp Master</h1>
         </div>
      <div class="row">
        
        <div class="col-lg-6">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">Emp Personal Info</h5> 
                
              <div class="row g-3 ">
                  <div class="col-md-6 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="txtEmpId" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtEmpId_TextChanged" ></asp:TextBox> 
                    <label for="txtEmpId">Emp Id</label>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-floating">
                     <asp:TextBox id="txtEmpName" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtEmpName_TextChanged" ></asp:TextBox>                    
                    <label for="txtEmpName">Emp Name</label>
                  </div>
                </div>               
              </div>
             <div class="row g-3">         
               <div class="col-md-6 mb-3">            
                    <div class="form-floating mb-3">
                    <asp:DropDownList id="DdlRole" runat="server" class="form-select"  aria-label="DdlRole" >
                       <asp:ListItem Text="Select" Value="Select" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="admin" Value="admin"></asp:ListItem>
                        <asp:ListItem Text="abm" Value="abm"></asp:ListItem>
                        <asp:ListItem Text="dba" Value="dba"></asp:ListItem>
                        <asp:ListItem Text="tester" Value="tester"></asp:ListItem>
                        <asp:ListItem Text="wings" Value="wings"></asp:ListItem>
                        <asp:ListItem Text="singer" Value="singer"></asp:ListItem>
                        <asp:ListItem Text="dancer" Value="dancer"></asp:ListItem>
                        <asp:ListItem Text="writer eng" Value="writer eng"></asp:ListItem>
                        <asp:ListItem Text="reder" Value="reder"></asp:ListItem>
                        <asp:ListItem Text="fullstack" Value="fullstack"></asp:ListItem>
                        <asp:ListItem Text="azure devops" Value="azure devops"></asp:ListItem>
                        <asp:ListItem Text="playboy" Value="playboy"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="DdlRole">Role</label>
                  </div>
               </div>
                <div class="col-md-6 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="txtSalary" runat="server" class="form-control" ></asp:TextBox>                                        
                    <label for="txtSalary">Salary</label>
                  </div>
                </div>
             </div>                      
            </div>
          </div>

        </div>

        
              <div class="row g-3 mb-3">
    
       <div class="text-center">
         <%--<button type="submit" class="btn btn-primary">Submit</button>
         <button type="reset" class="btn btn-secondary">Reset</button>--%>

           <asp:Button ID="BtnSave" runat="server" Text="Submit" OnClick="BtnSave_Click" class="btn btn-primary"/> <%----%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset" OnClick="BtnDelete_Click" class="btn btn-danger"/> <%----%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset" OnClick="BtnReset_Click" class="btn btn-secondary"/>  <%-- --%>           
           
       </div>
     </div>

      </div>

     </asp:Panel>
   
    </section>

  </main><!-- End #main -->

</asp:Content>
