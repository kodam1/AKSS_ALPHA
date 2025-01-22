<%@ Page Title="Billing Expenses" Async="true" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Create_Billing_Expenses.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Create_Billing_Expenses" 
    
    %>

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

     <asp:Panel ID="Panel1" runat="server" class="card"  >
         <div class="pagetitle my-3 mx-3 ">             
                 <h1><a id="A1_BtnBackCMIS_Billing_Expenses_List" runat="server" class="m-1" href="/CMIS/CMIS_Billing_Expenses_List.aspx"
                     data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Billing Expenses List">
                     <i class="ri-arrow-left-line me-1"></i>
                 </a>Billing Expenses</h1>                              
         </div>
      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <%--<h5 class="card-title">                  
                  <asp:Label ID="Lblh5_Title" runat="server" Text="Create Billing Expenses"></asp:Label>
              </h5>--%>

                <div class="row g-3 m-1">
                    <div class="col-lg-12">
                       
                        <span class="card-title" style="font-size: larger">                                       
                            <asp:Label ID="Lblh5_Title" runat="server" Text="Create Billing Expenses"></asp:Label>
                        </span>
                        <span style="float: right;">
                            
                        </span>
                    </div>
                </div>

                <div class="row g-3 ">

                    <div class="col-md-12 mb-3" style="display: block;">
                        <div class="form-floating">
                            <asp:TextBox ID="txtBillingExpensesId" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtBillingExpensesId_TextChanged" ></asp:TextBox><%-- AutoPostBack="true" OnTextChanged="txtBillingExpensesId_TextChanged"--%>
                            <label for="txtBillingExpensesId">Billing Expenses Id</label>
                        </div>
                    </div>

                    <div class="col-md-12 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtBillingPartyNameOrExpenses" runat="server" class="form-control"  AutoPostBack="true" OnTextChanged="txtBillingPartyNameOrExpenses_TextChanged"></asp:TextBox>
                            <label for="txtBillingPartyNameOrExpenses">Billing Party Name Or Expenses<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>

                </div>

                <div class="row g-3">
                    <div class="col-md-12 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtAmount" runat="server" class="form-control"></asp:TextBox>
                            <label for="txtAmount">Amount<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-md-12 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                            <label for="txtDate">Date<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-md-12 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtNotes" runat="server" class="form-control" TextMode="MultiLine" Height="100px" Width="100%"></asp:TextBox>
                            <label for="txtNotes">Notes<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>
                </div>
                   
            </div>
          </div>

        </div>
 
      <div class="row g-3 mb-3">
    
       <div class="text-center">      
           <asp:Button ID="BtnSave" runat="server" Text="Create Billing/Expenses" OnClick="BtnSave_Click" class="btn btn-primary"/> <%--OnClick="BtnSave_Click" --%>
            <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary"  Visible="false"/> <%--OnClick="BtnSave_Click" --%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset"  class="btn btn-danger"  Visible="false" OnClick="BtnDelete_Click"/> <%--OnClick="BtnDelete_Click"--%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset"  class="btn btn-secondary" OnClick="BtnReset_Click" Visible="true"/>  <%-- OnClick="BtnReset_Click"--%>
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" Visible="false"/> <%--OnClick="BtnExportToExcel_Click" --%>
           
       </div>
     </div>

      </div>

     </asp:Panel>
    
    </section>

  </main>
    
    <!-- End #main -->

</asp:Content>

