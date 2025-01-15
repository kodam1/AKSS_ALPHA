<%@ Page  Title="Medicine" Async="true" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Create_Medicine.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Create_Medicine" %>


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
                 <h1><a id="A1_BtnBackCMIS_Medicine_List" runat="server" class="m-1" href="/CMIS/CMIS_Medicine_List.aspx"
                     data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Medicine List">
                     <i class="ri-arrow-left-line me-1"></i>
                 </a>Medicine</h1>                              
         </div>
      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">                  
                    <asp:Label ID="Lblh5_Title" runat="server" Text="Create Medicine"></asp:Label>
              </h5>

                <div class="row g-3 ">

                    <div class="col-md-12 mb-3" style="display: block;">
                        <div class="form-floating">
                            <asp:TextBox ID="txtMedicineId" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtMedicine_ID_TextChanged" ></asp:TextBox><%-- AutoPostBack="true" OnTextChanged="txtMedicine_ID_TextChanged"--%>
                            <label for="txtMedicineId">Medicine Id</label>
                        </div>
                    </div>

                    <div class="col-md-12 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtTitle" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtTitle_TextChanged"></asp:TextBox>
                            <label for="txtTitle">Title<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>

                </div>

                <div class="row g-3">
            <%--        <div class="col-md-12 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtCategory" runat="server" class="form-control"></asp:TextBox>
                            <label for="txtCategory">Category<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>--%>
                    <div class="col-md-12 mb-3">
                   <div class="form-floating mb-3">
                    <asp:DropDownList id="DdlCategory" runat="server" class="form-select"  aria-label="Category" >
                        <asp:ListItem Text="Select Category" Value="Select Category" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Oral" Value="Oral"></asp:ListItem>
                        <asp:ListItem Text="Topical" Value="Topical"></asp:ListItem>
                        <asp:ListItem Text="Inhalers" Value="Inhalers"></asp:ListItem>
                        <asp:ListItem Text="Drops" Value="Drops"></asp:ListItem>
                        <asp:ListItem Text="Suppositories" Value="Suppositories"></asp:ListItem>
                        <asp:ListItem Text="Injections" Value="Injections"></asp:ListItem>                        
                        <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="DdlCategory">Category<span style="font-weight:600;color:red"> *</span></label>
                  </div>
                 </div>
                </div>

                <div class="row g-3">
                    <div class="col-md-12 mb-3">
                   <div class="form-floating mb-3">
                    <asp:DropDownList id="DdlDoseInterval" runat="server" class="form-select"  aria-label="DdlDoseInterval" >
                        <asp:ListItem Text="Select Dose Interval" Value="Select Dose Interval" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Daily morning, afternoon and evening" Value="Daily morning, afternoon and evening"></asp:ListItem>
                        <asp:ListItem Text="Daily morning and evening" Value="Daily morning and evening"></asp:ListItem>
                        <asp:ListItem Text="Daily morning and afternoon" Value="Daily morning and afternoon"></asp:ListItem>
                        <asp:ListItem Text="Daily afternoon and evening" Value="Daily afternoon and evening"></asp:ListItem>
                        <asp:ListItem Text="Daily afternoon and evening" Value="Daily afternoon and evening"></asp:ListItem>
                        <asp:ListItem Text="Daily morning" Value="Daily morning"></asp:ListItem>                        
                        <asp:ListItem Text="Daily afternoon" Value="Daily afternoon"></asp:ListItem>
                        <asp:ListItem Text="Daily evening" Value="Daily evening"></asp:ListItem>
                        <asp:ListItem Text="4 Times in a day" Value="4 Times in a day"></asp:ListItem>
                        <asp:ListItem Text="5 Times in a day" Value="5 Times in a day"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="DdlDoseInterval">Dose Interval<span style="font-weight:600;color:red"> *</span></label>
                  </div>
                 </div>
                </div>
                <div class="row g-3">
                    <div class="col-md-12 mb-3">
                     <div class="form-check " >
                        <asp:CheckBox id="ChkTakeMedicineBeforeMeal" runat="server" Checked="true"  class="form-check-input-lg" Font-Size="Larger" />&nbsp;&nbsp;
                       <label for="ChkTakeMedicineBeforeMeal" class="form-check-label" style="font-size: large;"> Take medicine before meal <span style="font-weight:600;color:red"> *</span></label>                           
                     </div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-md-12 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtDescriptions" runat="server" class="form-control" TextMode="MultiLine" Height="100px" Width="100%"></asp:TextBox>
                            <label for="txtDescriptions">Descriptions<span style="font-weight: 600; color: red"> *</span></label>
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

           <asp:Button ID="BtnSave" runat="server" Text="Create Medicine" OnClick="BtnSave_Click"  class="btn btn-primary"/> <%--OnClick="BtnSave_Click" --%>
            <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary"  Visible="false"/> <%--OnClick="BtnSave_Click" --%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset"  class="btn btn-danger"  Visible="false"/> <%--OnClick="BtnDelete_Click"--%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset"  class="btn btn-secondary" OnClick="BtnReset_Click" Visible="true"/>  <%-- OnClick="BtnReset_Click"--%>
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" Visible="false"/> <%--OnClick="BtnExportToExcel_Click" --%>
           
       </div>
     </div>

      </div>

     </asp:Panel>
    
    </section>

  </main><!-- End #main -->

</asp:Content>



