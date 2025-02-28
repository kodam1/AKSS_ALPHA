﻿<%@ Page Title="Clinic Master" Async="true"  Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Clinic_Master.aspx.cs" Inherits="AKSS_Management.CMIS.CMIS_Clinic_Master" %>
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
             <h1>Clinic Master</h1>
         </div>
      <div class="row">
        
        <div class="col-lg-8">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">Clinic Info</h5> 
                
              <div class="row g-3 ">
                  <div class="col-md-12 mb-3" style="display:block ;">
                  <div class="form-floating">
                    <asp:TextBox id="txtClinicId" runat="server" class="form-control"  AutoPostBack="true" OnTextChanged="txtClinicId_TextChanged"  ></asp:TextBox><%-- AutoPostBack="true" OnTextChanged="txtClinicId_TextChanged"--%>
                    <label for="txtClinicId">Clinic Id</label>
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-floating">
                     <asp:TextBox id="txtClinicName" runat="server" class="form-control"  AutoPostBack="true" OnTextChanged="txtClinicName_TextChanged"  ></asp:TextBox>   <%-- AutoPostBack="true" OnTextChanged="txtClinicName_TextChanged"--%>                 
                    <label for="txtClinicName">Clinic Name<span style="font-weight:600;color:red"> *</span></label>
                  </div>
                </div>               
              </div>
             <div class="row g-3">
              <div class="col-md-6 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="txtClinicEmail" runat="server" class="form-control" title="eg: abc@gmail.com" ToolTip="eg: abc@gmail.com" ></asp:TextBox>                                        
                 <label for="txtClinicEmail">Email<span style="font-weight:600;color:red"> *</span></label>
               </div>
             </div>
               <div class="col-md-6 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="txtDoctorName" runat="server" class="form-control" ></asp:TextBox>                                        
                 <label for="txtDoctorName">Doctor Name<span style="font-weight:600;color:red"> *</span></label>                           
               </div>
             </div>
             </div>
              <div class="row g-3">
                <div class="col-md-6 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="txtDoctorDegree" runat="server" class="form-control" ></asp:TextBox>                                        
                    <label for="txtDoctorDegree">Doctor Degree<span style="font-weight:600;color:red"> *</span></label>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                     <div class="form-floating">
                       <asp:TextBox id="txtDoctorSpecialization" runat="server" class="form-control" ></asp:TextBox>                                       <%-- TextMode="MultiLine" Height="100px" Width="100%" --%>
                       <label for="txtDoctorSpecialization">Doctor Specialization<span style="font-weight:600;color:red"> *</span></label>
                     </div>
                </div>
              </div>
              <div class="row g-3 mb-3"">                                    
                <div class="col-md-2 mb-3">                
                    <div class="form-floating">
                      <asp:TextBox id="txtCountryCode" runat="server"  class="form-control"   ></asp:TextBox>                                        
                      <label for="txtCountryCode"><small>Country Code</small><span style="font-weight:600;color:red"> *</span></label>
                    </div>                 
                </div>
                <div class="col-md-4 mb-3">                
                   <div class="form-floating">
                     <asp:TextBox id="txtContactNumber" runat="server"  class="form-control"   ></asp:TextBox>                                        
                     <label for="txtContactNumber">Contact Number<span style="font-weight:600;color:red"> *</span></label>
                   </div>                 
               </div>                      
                <div class="col-md-6 mb-3">                
                    <div class="form-floating">
                      <asp:TextBox id="txtClinicTelephoneNumber" runat="server"  class="form-control" ></asp:TextBox>                                        
                      <label for="txtClinicTelephoneNumber">Clinic Telephone Number<span style="font-weight:600;color:red"> *</span></label>
                    </div>                 
                </div>
             </div>
       
                <div class="row g-3">
                    <div class="col-md-6 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtOldCasePrice" runat="server" class="form-control"></asp:TextBox>
                            <label for="txtOldCasePrice">Old Case Price<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtNewCasePrice" runat="server" class="form-control"></asp:TextBox>
                            <label for="txtNewCasePrice">New Case Price<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>

                </div>
                <div class="row g-3">
                    <div class="col-md-6 mb-3">
                        <div class="form-floating">
                            <asp:TextBox ID="txtClinicAddress" runat="server" class="form-control" TextMode="MultiLine" Height="100px" Width="100%"></asp:TextBox>
                            <label for="txtClinicAddress">Clinic Address<span style="font-weight: 600; color: red"> *</span></label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="form-floating">
                     <asp:TextBox id="txtWorkingHours" runat="server"  class="form-control"   TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                     <label for="txtWorkingHours">Working Hours<span style="font-weight:600;color:red"> *</span></label>
                   </div>                 
               </div>
               
             </div>
              <div class="row g-3">
                <div class="col-md-12 mb-3">                
                    <div class="form-floating">
                      <asp:TextBox id="txtSpecialNotes" runat="server"  class="form-control"   TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                      <label for="txtSpecialNotes">Special Notes<span style="font-weight:600;color:red"> *</span></label>
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

           <asp:Button ID="BtnSave" runat="server" Text="Submit" class="btn btn-primary" OnClick="BtnSave_Click"/> <%--OnClick="BtnSave_Click" --%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset"  class="btn btn-danger" Visible="false"/> <%--OnClick="BtnDelete_Click"--%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset"  class="btn btn-secondary"  Visible="false"/>  <%-- OnClick="BtnReset_Click"--%>
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" Visible="false"/> <%--OnClick="BtnExportToExcel_Click" --%>
           
       </div>
     </div>

      </div>

     </asp:Panel>

     <asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto" Width="100%" Visible="false" >
         <div class="pagetitle">
          <h3 class="mb-3">Clinic Master</h3>
         </div>

         <div class="row">
             <div class="col-lg-12">
                 <div class="card-body">
                     <h5 class="card-title">Clinic Master Data</h5>

                     <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" 
                                    CssClass="table datatable" 
                                    DataKeyNames="Clinic_ID"
                                    ShowHeader="true"
                                    AllowSorting="true"
                                    
                                    >
                         <Columns>
                             	<%--SELECT Clinic_ID,Clinic_Name,Clinic_Email,Doctor_Name,Doctor_Degree,Doctor_Specialization,
                                     Country_Code,Contact_Number,Clinic_Telephone_Number,
	                                Old_Case_Price,New_Case_Price,Clinic_Address,Working_Hours,Special_Notes,
                                     CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Mst_Clinic]; --%>

                                    <asp:BoundField DataField="Clinic_ID" HeaderText="Clinic_ID" />
                                    <asp:BoundField DataField="Clinic_Name" HeaderText="Clinic_Name" />
                                    <asp:BoundField DataField="Clinic_Email" HeaderText="Clinic_Email" />
                                    <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor_Name" />
                                    <asp:BoundField DataField="Doctor_Degree" HeaderText="Doctor_Degree" />
                                    <asp:BoundField DataField="Doctor_Specialization" HeaderText="Doctor_Specialization" />
                                    <asp:BoundField DataField="Country_Code" HeaderText="Country_Code" />                            
                                    <asp:BoundField DataField="Contact_Number" HeaderText="Contact_Number" />
                                    <asp:BoundField DataField="Clinic_Telephone_Number" HeaderText="Clinic_Telephone_Number" />
                                    <asp:BoundField DataField="Old_Case_Price" HeaderText="Old_Case_Price" />
                                    <asp:BoundField DataField="New_Case_Price" HeaderText="New_Case_Price" />
                                    <asp:BoundField DataField="Clinic_Address" HeaderText="Clinic_Address" />
                                    <asp:BoundField DataField="Working_Hours" HeaderText="Working_Hours" />
                                    <asp:BoundField DataField="Special_Notes" HeaderText="Special_Notes" />

                         </Columns>
                     </asp:GridView>
                 </div>
             </div>
         </div>

     </asp:Panel>
    </section>

  </main><!-- End #main -->

</asp:Content>