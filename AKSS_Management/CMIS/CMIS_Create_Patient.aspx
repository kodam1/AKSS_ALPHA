<%@ Page Title="Create Patient" Async="true"  Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Create_Patient.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Create_Patient" %>

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
                 <h1><a id="A1_BtnBackPatient_List" runat="server" class="m-1" href="/CMIS/CMIS_Patient_List.aspx"
                     data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Patient List">
                     <i class="ri-arrow-left-line me-1"></i>
                 </a>Patient</h1>                              
         </div>



      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">                  
                  <asp:Label ID="Lblh5_Title" runat="server" Text="Create Patient"></asp:Label>
              </h5> 
                
              <div class="row g-3 ">
                  <div class="col-md-6 mb-3" style="display:block;">
                  <div class="form-floating">
                    <asp:TextBox id="txtPatientId" runat="server" class="form-control"  AutoPostBack="true" OnTextChanged="txtPatientId_TextChanged"  ></asp:TextBox><%----%>
                    <label for="txtPatientId">Patient Id</label>
                  </div>
                </div>
                 <div class="col-md-6 mb-3" style="display:block;">
                  <div class="form-floating">
                    <asp:TextBox id="txtTokenNo" runat="server" class="form-control" ></asp:TextBox><%----%>
                    <label for="txtTokenNo">Token Number</label>
                  </div>
                </div>
                  <div class="col-md-6 mb-3">
                      <div class="form-floating">
                          <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>
                          <label for="txtFirstName">First Name<span style="font-weight: 600; color: red"> *</span></label>
                      </div>
                  </div>
                  <div class="col-md-6 mb-3">
                      <div class="form-floating">
                          <asp:TextBox ID="txtMiddleName" runat="server" class="form-control"></asp:TextBox>
                          <label for="txtMiddleName">Middle Name<span style="font-weight: 600; color: red"> *</span></label>
                      </div>
                  </div>

              </div>
               <%--  <div class="row g-3">

                 </div>--%>
                <div class="row g-3">
                     <div class="col-md-6 mb-3">
                      <div class="form-floating">
                          <asp:TextBox ID="txtLastName" runat="server" class="form-control"></asp:TextBox>
                          <label for="txtLastName">Last Name<span style="font-weight: 600; color: red"> *</span></label>
                      </div>
                  </div>
                    <div class="col-md-2 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtCountryCode" runat="server" class="form-control"></asp:TextBox>
                            <label for="txtCountryCode"><small>Country Code</small><span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtContactNumber" runat="server" class="form-control"></asp:TextBox>
                            <label for="txtContactNumber">Contact Number<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>

                </div>
                <div class="row g-3">
                    <div class="col-md-6 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" title="eg: abc@gmail.com" ToolTip="eg: abc@gmail.com"></asp:TextBox>
                            <label for="txtEmail">Email<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="form-floating mb-3">
                            <asp:DropDownList ID="DdlGender" runat="server" class="form-select" aria-label="Gender">
                                <asp:ListItem Text="Male" Value="Male" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                            </asp:DropDownList>
                            <label for="DdlGender">Gender<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>

                </div>

                <div class="row g-3">
                    <div class="col-md-6 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtAge" runat="server" class="form-control" TextMode="Number" title="eg: 21" ToolTip="eg: 21"></asp:TextBox>
                            <label for="txtAge">Age<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="form-floating mb-3">
                            <asp:DropDownList ID="DdlBloodGroup" runat="server" class="form-select" aria-label="DdlBloodGroup">
                                <asp:ListItem Text="Select Blood Group" Value="Select Blood Group" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="O positive (35%)" Value="O positive (35%)" ></asp:ListItem>
                                <asp:ListItem Text="O negative (13%)" Value="O negative (13%)"></asp:ListItem>
                                <asp:ListItem Text="A positive (30%)" Value="A positive (30%)"></asp:ListItem>
                                <asp:ListItem Text="A negative (8%)" Value="A negative (8%)" ></asp:ListItem>
                                <asp:ListItem Text="B positive (8%)" Value="B positive (8%)"></asp:ListItem>
                                <asp:ListItem Text="B negative (2%)" Value="B negative (2%)"></asp:ListItem>
                                <asp:ListItem Text="AB positive (2%)" Value="AB positive (2%)"></asp:ListItem>
                            </asp:DropDownList>
                            <label for="DdlBloodGroup">Blood Group<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>

                </div>

             <div class="row g-3">
              <div class="col-md-4 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="txtHeight" runat="server" class="form-control"  ></asp:TextBox>                                        
                 <label for="txtHeight">Height<span style="font-weight:600;color:red"> *</span></label>
               </div>
             </div>
              <div class="col-md-4 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="txtWeight" runat="server" class="form-control"  ></asp:TextBox>                                        
                 <label for="txtWeight">Weight<span style="font-weight:600;color:red"> *</span></label>
               </div>
             </div>
              <div class="col-md-4 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="txtBP" runat="server" class="form-control"  ></asp:TextBox>                                        
                 <label for="txtBP">BP<span style="font-weight:600;color:red"> *</span></label>
               </div>
             </div>
             </div>
              
       
               <div class="row g-3">
                <div class="col-md-12 mb-3">                
                   <div class="form-floating">
                     <asp:TextBox id="txtSymptoms" runat="server"  class="form-control" TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                     <label for="txtSymptoms">Symptoms<span style="font-weight:600;color:red"> *</span></label>
                   </div>               
                </div>               
             </div>
               <div class="row g-3">                    
                  <div class="col-md-12 mb-3">                
                   <div class="form-floating">
                     <asp:TextBox id="txtAddress" runat="server"  class="form-control" TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                     <label for="txtAddress">Address<span style="font-weight:600;color:red"> *</span></label>
                   </div>                 
               </div>
               </div>
               <div class="row g-3">   
                <div class="col-md-12 mb-3">                
                   <div class="form-floating">
                     <asp:TextBox id="txtNotes" runat="server"  class="form-control"   TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                     <label for="txtNotes">Notes<span style="font-weight:600;color:red"> *</span></label>
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

           <asp:Button ID="BtnSave" runat="server" Text="Create Patient" class="btn btn-primary" OnClick="BtnSave_Click"/> <%-- --%>
            <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary"  Visible="false"/> <%--OnClick="BtnSave_Click" --%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  class="btn btn-danger"  Visible="false"/> <%--OnClick="BtnDelete_Click"--%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset"  class="btn btn-secondary"  Visible="true" OnClick="BtnReset_Click" />  <%-- --%>
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" Visible="false"/> <%--OnClick="BtnExportToExcel_Click" --%>
           
       </div>
     </div>

      </div>

     </asp:Panel>

     <asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto" Width="100%" Visible="false" >
        <%-- <div class="pagetitle">
          <h3 class="mb-3">User Master List</h3>
         </div>--%>

         <div class="row">
             <div class="col-lg-12">
                 <div class="card-body">
                     <h5 class="card-title">Client Follow Up Master List</h5>

                     <asp:GridView ID="gvClientFollowUpMaster" runat="server" AutoGenerateColumns="false" 
                                    CssClass="table datatable" DataKeyNames="ClientId"
                                    ShowHeader="true"
                                    >
                         <Columns>
                             <asp:BoundField DataField="ClientId" HeaderText="Client Id" />
                             <asp:BoundField DataField="Client_Name" HeaderText="Client_Name" />
                             <asp:BoundField DataField="Ratting" HeaderText="Ratting" />
                              <asp:BoundField DataField="Category" HeaderText="Category" />
                             <asp:BoundField DataField="Address1" HeaderText="Address 1" />
                             <asp:BoundField DataField="Open_Hours" HeaderText="Open_Hours" />
                             <asp:BoundField DataField="Direction" HeaderText="Direction" />
                            <%-- <asp:BoundField DataField="Review" HeaderText="Review" />--%>
                             <asp:BoundField DataField="Address2" HeaderText="Address 2" />
                            <asp:BoundField DataField="Mobile_No" HeaderText="Mobile No" />
                            <asp:BoundField DataField="Telephone_No" HeaderText="Telephone No" />
                             <asp:BoundField DataField="Follow_Up_Reason" HeaderText="Follow Up" />
                             <asp:BoundField DataField="Website" HeaderText="Website" />
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
