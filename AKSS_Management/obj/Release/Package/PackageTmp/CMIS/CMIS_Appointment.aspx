<%@ Page Title="Appointment" Async="true" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Appointment.aspx.cs" Inherits="AKSS_Management.CMIS.CMIS_Appointment" %>
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
         <div class="pagetitle my-3 mx-3">
             <h1>Appointment</h1>
         </div>
      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">Create Appointment</h5> 
                
              <div class="row g-3 ">
                  <div class="col-md-12 mb-3" style="display:block;">
                  <div class="form-floating">
                    <asp:TextBox id="txtAppointmentId" runat="server" class="form-control"   ></asp:TextBox><%-- AutoPostBack="true" OnTextChanged="txtClientId_TextChanged"--%>
                    <label for="txtAppointmentId">Appointment Id</label>
                  </div>
                </div>
                <div class="col-6 col-md-6 mb-3">
                  <div class="form-floating">
                     <asp:TextBox id="txtSelectPatient" runat="server" class="form-control" Style="border-left: 8px solid #0000ff80;" disabled="disabled" Placeholder=" Select Patient"  ></asp:TextBox>   <%-- AutoPostBack="true" OnTextChanged="txtClientName_TextChanged"--%>                 
                    <label for="txtSelectPatient"  Style="border-left: 8px solid #0000ff80;"> Select Patient<span style="font-weight:600;color:red"> *</span></label>
                  </div>
                </div>  
                <div class="col-6 col-md-6 mb-3">
                  <div class="text-center" style="margin-top: 5px !important;">
                     <a  ID="BtnSelectPatient" runat="server" class="btn btn-primary btn-lg"> <i class="bi bi-card-checklist me-1"></i> Select</a> 
                  </div>
                </div> 
              </div>
             <div class="row g-3">
              <div class="col-md-12 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="txtCaseComplaint" runat="server" class="form-control"  ></asp:TextBox>                                        
                 <label for="txtCaseComplaint">Case Complaint<span style="font-weight:600;color:red"> *</span></label>
               </div>
             </div>
               <div class="col-md-6 mb-3">
                <%-- <div class="">                 
                     <label for="RdlGendeer">Gender<span style="font-weight:600;color:red"> *</span></label>
                    <asp:RadioButtonList ID="RdlGendeer"  runat="server" RepeatDirection="Horizontal" CssClass="form-control" >
                        <asp:ListItem Text="Male" Value="Male" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female" ></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other" ></asp:ListItem>
                    </asp:RadioButtonList>                   
                 </div>--%>
<%--                    <div class="form-floating mb-3">
                    <asp:DropDownList id="DdlGender" runat="server" class="form-select"  aria-label="State" >
                       <asp:ListItem Text="Male" Value="Male" Selected="True"></asp:ListItem>
                       <asp:ListItem Text="Female" Value="Female" ></asp:ListItem>
                       <asp:ListItem Text="Other" Value="Other" ></asp:ListItem>
                    </asp:DropDownList>
                    <label for="DdlGender">Gender<span style="font-weight:600;color:red"> *</span></label>
                  </div>--%>
               
               <div class="form-floating">
                  <asp:TextBox id="txtDate" runat="server" TextMode="Date" class="form-control" ></asp:TextBox>                                        
                 <label for="txtDate">Date<span style="font-weight:600;color:red"> *</span></label>                           
               </div>
             </div>
             </div>
              <div class="row g-3">
                <div class="col-md-6 mb-3">
                 <div class="form-check " style="margin-top: 20px !important;margin-left:20px;">
                    <asp:CheckBox id="ChkIsAnOldCase" runat="server" Checked="true"  class="form-check-input-lg" Font-Size="Larger" />
                   <label for="ChkIsAnOldCase" class="form-check-label" style="font-size: x-large;"> is an old case ? <span style="font-weight:600;color:red"> *</span></label>                           
                 </div>
                </div>
                <div class="col-md-6 mb-3">
                     <div class="form-floating">
                       <asp:TextBox id="txtFees" runat="server" class="form-control" ></asp:TextBox>                                        
                       <label for="txtFees">Fees<span style="font-weight:600;color:red"> *</span></label>
                     </div>
                </div>
              </div>
              <div class="row g-3">
                <div class="col-6 col-md-6 mb-3">                
                    <div class="form-floating">
                      <asp:TextBox id="txtPrescription" runat="server"  class="form-control" Style="border-left: 8px solid #0000ff80;" Placeholder="Prescription"  disabled="disabled"  ></asp:TextBox>                                        
                      <label for="txtPrescription" Style="border-left: 8px solid #0000ff80;"> Prescription<span style="font-weight:600;color:red"> *</span></label>
                    </div>                 
                </div>
                <div class="col-6 col-md-6 mb-3">                
                  <div class="text-center" style="margin-top: 5px !important;">
                     <a  ID="BtnPrescription" runat="server" class="btn btn-primary btn-lg"> <i class="bi bi-card-checklist me-1"></i> Select</a> 
                  </div>                 
               </div>
               
             </div>
               <div class="row g-3">
                <div class="col-md-6 mb-3">                
                   <div class="form-floating">
                     <asp:TextBox id="txtTitle" runat="server"  class="form-control" TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                     <label for="txtTitle">Title<span style="font-weight:600;color:red"> *</span></label>
                   </div>               
                </div>
                <div class="col-md-6 mb-3">                
                   <div class="form-floating">
                     <asp:TextBox id="txtDescription" runat="server"  class="form-control" TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                     <label for="txtDescription">Description<span style="font-weight:600;color:red"> *</span></label>
                   </div>                 
               </div>
               
             </div>
               <div class="row g-3">
                <div class="col-6 col-md-6 mb-3">                
                    <div class="form-floating">
                      <asp:TextBox id="txtMedicines" runat="server"  class="form-control" Style="border-left: 8px solid #0000ff80;" Placeholder="Prescription"  disabled="disabled"  ></asp:TextBox>                                        
                      <label for="txtMedicines" Style="border-left: 8px solid #0000ff80;"> Medicines<span style="font-weight:600;color:red"> *</span></label>
                    </div>                 
                </div>
                <div class="col-6 col-md-6 mb-3">                
                  <div class="text-center" style="margin-top: 5px !important;">
                     <a  ID="BtnMedicines" runat="server" class="btn btn-primary btn-lg"> <i class="bi bi-card-checklist me-1"></i> Select</a> 
                  </div>                 
               </div>
              </div>
               <div class="row g-3">
                <div class="col-6 col-md-6 mb-3">                
                    <div class="form-floating">
                      <asp:TextBox id="txtLabReports" runat="server"  class="form-control" Style="border-left: 8px solid #0000ff80;" Placeholder="Prescription"  disabled="disabled"  ></asp:TextBox>                                        
                      <label for="txtLabReports" Style="border-left: 8px solid #0000ff80;"> Lab Reports<span style="font-weight:600;color:red"> *</span></label>
                    </div>                 
                </div>
                <div class="col-6 col-md-6 mb-3">                
                  <div class="text-center" style="margin-top: 5px !important;">
                     <a  ID="BtnLabReports" runat="server" class="btn btn-primary btn-lg"> <i class="bi bi-card-checklist me-1"></i> Select</a> 
                  </div>                 
               </div> 
             </div>
               <div class="row g-3">
                <div class="col-md-6 mb-3">                
                    <div class="form-floating">
                      <asp:TextBox id="txtNextVisitInDays" runat="server"  class="form-control" TextMode="Number"  ></asp:TextBox>                                        
                      <label for="txtNextVisitInDays">Next visit in days<span style="font-weight:600;color:red"> *</span></label>
                    </div>                 
                </div>
                <div class="col-md-12 mb-3">                
                   <div class="form-floating">
                     <asp:TextBox id="txtRemarks" runat="server"  class="form-control"   TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                     <label for="txtRemarks">Remarks<span style="font-weight:600;color:red"> *</span></label>
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

           <asp:Button ID="BtnSave" runat="server" Text="Submit" class="btn btn-primary"/> <%--OnClick="BtnSave_Click" --%>
            <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary"/> <%--OnClick="BtnSave_Click" --%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset"  class="btn btn-danger"  Visible="false"/> <%--OnClick="BtnDelete_Click"--%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset"  class="btn btn-secondary"  Visible="false"/>  <%-- OnClick="BtnReset_Click"--%>
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
