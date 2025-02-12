<%@ Page  Title="Create Stockist" Async="true"  Language="C#" MasterPageFile="~/ABM/ABM.Master" 
    AutoEventWireup="true" CodeBehind="ABM_Master_Stockist_Create.aspx.cs" 
    Inherits="AKSS_Management.ABM.ABM_Master_Stockist_Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <main id="main" class="main">

    <div class="pagetitle">
      <%--<h1>User Master</h1>--%>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultABM.aspx">Home</a></li>
          <li class="breadcrumb-item">Master</li>
          <li class="breadcrumb-item active">Stockist Master</li>
        </ol>
      </nav>
    </div>
    <!-- End Page Title -->

    <section class="section">

     <asp:Panel ID="Panel1" runat="server" class="card"  >      
          <div class="pagetitle my-3 mx-3">
             <h1><a id="A1_BtnBackStockist_List" runat="server" class="m-1" href="/ABM/ABM_Master_Stockist_List.aspx"
                data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Stockist's List">
                <i class="ri-arrow-left-line me-1"></i>
            </a>Create Stockist Master</h1>
        </div>

      <div class="row">
        
        <div class="col-lg-6">
 
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">Stockist Personal Info</h5> 
                
              <div class="row g-3 ">
                  <div class="col-md-6 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="TxtStockistId" runat="server" class="form-control"  TextMode="Number" AutoPostBack="true" OnTextChanged="TxtStockistId_TextChanged" ></asp:TextBox> 
                    <label for="TxtStockistId">Stockist Id</label>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="form-floating mb-3">
                    <asp:DropDownList id="DdlDivisionName" runat="server" class="form-select"  aria-label="DdlDivisionName" >
                       <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                       <asp:ListItem Text="SPEKTRA" Value="SPEKTRA" ></asp:ListItem>                       
                    </asp:DropDownList>
                    <label for="DdlDivisionName">Division Name</label>
                  </div>
                </div>               
              </div>
             <div class="row g-3">
              <div class="col-md-6 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="TxtSML_No" runat="server" class="form-control"  TextMode="Number" ></asp:TextBox>                                        
                 <label for="TxtSML_No">SML No.</label>
               </div>
             </div>
               <div class="col-md-6 mb-3">
                    <div class="form-floating mb-3">
                    <asp:DropDownList id="DdlSML_Saturation" runat="server" class="form-select"  aria-label="DdlCML_Saturation" >
                       <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                       <asp:ListItem Text="Dr" Value="Dr" ></asp:ListItem>
                       <asp:ListItem Text="Mr" Value="Mr" ></asp:ListItem>
                       <asp:ListItem Text="Ms" Value="Ms" ></asp:ListItem>
                    </asp:DropDownList>
                    <label for="DdlSML_Saturation">SML Saturation</label>
                  </div>
               </div>
             </div>
              <div class="row g-3">
                <div class="col-md-6 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="TxtSTOCKIST_Name" runat="server" class="form-control"   AutoPostBack="true" OnTextChanged="TxtSTOCKIST_Name_TextChanged"  ></asp:TextBox>                                        
                    <label for="TxtSTOCKIST_Name">Stockist Name</label>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="form-floating mb-3">
                    <asp:DropDownList id="DdlQualification" runat="server" class="form-select"  aria-label="DdlQualification" >
                       <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                       <asp:ListItem Text="B P T (PHYSIO)"  Value="B P T (PHYSIO)" ></asp:ListItem>
                        <asp:ListItem Text="BAMS"  Value="BAMS" ></asp:ListItem>
                        <asp:ListItem Text="BDS"  Value="BDS" ></asp:ListItem>
                        <asp:ListItem Text="BHMS"  Value="BHMS" ></asp:ListItem>
                        <asp:ListItem Text="BSAM"  Value="BSAM" ></asp:ListItem>
                        <asp:ListItem Text="BUMS"  Value="BUMS" ></asp:ListItem>
                        <asp:ListItem Text="DHMS"  Value="DHMS" ></asp:ListItem>
                        <asp:ListItem Text="DM"  Value="DM" ></asp:ListItem>
                        <asp:ListItem Text="DNB"  Value="DNB" ></asp:ListItem>
                        <asp:ListItem Text="DNB (ORTHO)"  Value="DNB (ORTHO)" ></asp:ListItem>
                        <asp:ListItem Text="LCEH"  Value="LCEH" ></asp:ListItem>
                        <asp:ListItem Text="M P T (PHYSIO)"  Value="M P T (PHYSIO)" ></asp:ListItem>
                        <asp:ListItem Text="MBBS"  Value="MBBS" ></asp:ListItem>
                        <asp:ListItem Text="MBBS ,DLO"  Value="MBBS ,DLO" ></asp:ListItem>
                        <asp:ListItem Text="MBBS D.ORTHO"  Value="MBBS D.ORTHO" ></asp:ListItem>
                        <asp:ListItem Text="MBBS DGO"  Value="MBBS DGO" ></asp:ListItem>
                        <asp:ListItem Text="MBBS DIP DIAB"  Value="MBBS DIP DIAB" ></asp:ListItem>
                        <asp:ListItem Text="MBBS DLO"  Value="MBBS DLO" ></asp:ListItem>
                        <asp:ListItem Text="MBBS DNB"  Value="MBBS DNB" ></asp:ListItem>
                        <asp:ListItem Text="MBBS DNB (MEDICINE)"  Value="MBBS DNB (MEDICINE)" ></asp:ListItem>
                        <asp:ListItem Text="MD"  Value="MD" ></asp:ListItem>
                        <asp:ListItem Text="MD (OBS & GYN)"  Value="MD (OBS & GYN)" ></asp:ListItem>
                        <asp:ListItem Text="MD DGO"  Value="MD DGO" ></asp:ListItem>
                        <asp:ListItem Text="MD DM"  Value="MD DM" ></asp:ListItem>
                        <asp:ListItem Text="MD(MEDICINE)"  Value="MD(MEDICINE)" ></asp:ListItem>
                        <asp:ListItem Text="MDS"  Value="MDS" ></asp:ListItem>
                        <asp:ListItem Text="MS"  Value="MS" ></asp:ListItem>
                        <asp:ListItem Text="MS (ENT)"  Value="MS (ENT)" ></asp:ListItem>
                        <asp:ListItem Text="MS (GEN SURG)"  Value="MS (GEN SURG)" ></asp:ListItem>
                        <asp:ListItem Text="MS (OBG)"  Value="MS (OBG)" ></asp:ListItem>
                        <asp:ListItem Text="MS (OBS & GYN)"  Value="MS (OBS & GYN)" ></asp:ListItem>
                        <asp:ListItem Text="MS (ORTHO)"  Value="MS (ORTHO)" ></asp:ListItem>
                    </asp:DropDownList>
                    <label for="DdlQualification">Qualification</label>
                  </div>
                </div>
              </div>
              <div class="row g-3">
                <div class="col-md-6 mb-3">                
                        <div class="form-floating">
                           <asp:TextBox id="TxtOwner_Contact_Person" runat="server" class="form-control"  ></asp:TextBox>                                                 
                          <label for="TxtOwner_Contact_Person">Owner Contact Person</label>
                        </div>                   
                </div>
                <div class="col-md-6 mb-3">
                    <div class="form-floating mb-3">
                        <asp:DropDownList ID="DdlClass" runat="server" class="form-select" aria-label="DdlClass">
                            <asp:ListItem Value="" Text="Select" Selected="True">Select</asp:ListItem>
                            <asp:ListItem Value="A" Text="A"></asp:ListItem>
                            <asp:ListItem Value="B" Text="B"></asp:ListItem>
                        </asp:DropDownList>
                        <label for="DdlClass">Class</label>
                    </div>
                </div>
               
             </div>
                       
            </div>
          </div>

        </div>

          <div class="col-lg-6">
              <div class="card ">
                  <div class="card-body">
                       <h5 class="card-title">Stockist Address Info</h5>  
                       <div class="row g-3 ">

                       <div class="col-md-12 mb-3">
                           <div class="form-floating mb-3">
                           <asp:DropDownList id="DdlCity" runat="server" class="form-select"  aria-label="DdlCity" >
                             <asp:ListItem Value="Select" Text="" selected="True"></asp:ListItem>
                               <asp:ListItem Value="BENGALURU" Text="BENGALURU"></asp:ListItem>
                             <asp:ListItem Value="MUMBAI" Text="MUMBAI"></asp:ListItem>
                             <asp:ListItem value="MUMBAI-ANDHERI"  Text="MUMBAI-ANDHERI" ></asp:ListItem>                             
                           </asp:DropDownList>
                           <label for="DdlCity">City</label>
                         </div>
                       </div>               
                     </div>
                    <div class="row g-3">
                      <div class="col-md-12 mb-3">
                        <div class="form-floating">
                           <asp:TextBox id="TxtAddress1" runat="server" class="form-control" TextMode="MultiLine" Rows="3" Height="100px" Width="100%" ></asp:TextBox>                                                 
                          <label for="TxtAddress1">Address 1</label>
                        </div>
                      </div>
                    </div>
                     <div class="row g-3">
                       <div class="col-md-12 mb-3">
                         <div class="form-floating">
                           <asp:TextBox id="TxtAddress2" runat="server" class="form-control" TextMode="MultiLine" Rows="3" Height="100px" Width="100%"></asp:TextBox>                                                 
                          <label for="TxtAddress2">Address 2</label>
                         </div>
                       </div>
                     </div>
                     <div class="row g-3">
                       <div class="col-md-12 mb-3">
                         <div class="form-floating">
                           <asp:TextBox id="TxtAddress3" runat="server" class="form-control" TextMode="MultiLine" Rows="3" Height="100px" Width="100%"></asp:TextBox>                                                 
                          <label for="TxtAddress3">Address 3</label>
                         </div>
                       </div>
                     </div>
                  </div>
              </div>
          </div>

             <div class="col-lg-6">
             <div class="card ">
           <div class="card-body">
                <h5 class="card-title">Stockist Contact Info</h5>  
                <div class="row g-3 ">
                  <div class="col-md-6 mb-3">
                    <div class="form-floating mb-3">
                    <asp:DropDownList id="DdlArea" runat="server" class="form-select"  aria-label="DdlArea" >
                       <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                       <asp:ListItem Text="ANDHERI (E)" Value="ANDHERI (E)" ></asp:ListItem>
                       <asp:ListItem Text="BOMBAY" Value="BOMBAY" ></asp:ListItem>
                       <asp:ListItem Text="BOMBAY-26" Value="BOMBAY-26" ></asp:ListItem>
                       <asp:ListItem Text="MAROL" Value="MAROL" ></asp:ListItem>
                       <asp:ListItem Text="MUMBAI" Value="MUMBAI" ></asp:ListItem>
                       <asp:ListItem Text="MUMBAI ANDHERI" Value="MUMBAI ANDHERI" ></asp:ListItem>
                       <asp:ListItem Text="SAKINAKA" Value="SAKINAKA" ></asp:ListItem>
                       <asp:ListItem Text="MAHAKALI" Value="MAHAKALI" ></asp:ListItem>
                       <asp:ListItem Text="MAROL, ANDHERI E" Value="MAROL, ANDHERI E" ></asp:ListItem>
                       <asp:ListItem Text="PUMP HOUSE" Value="PUMP HOUSE" ></asp:ListItem>                        
                       </asp:DropDownList>
                    <label for="DdlArea">Area</label>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-floating">
                     <asp:TextBox id="TxtPinCode" runat="server" class="form-control"  TextMode="Number" ></asp:TextBox>                    
                    <label for="TxtPinCode">PinCode</label>
                  </div>
                </div>               
              </div>
             <div class="row g-3">
              <div class="col-md-6 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="TxtDate_Of_Birth" runat="server"  class="form-control" TextMode="Date" ></asp:TextBox>                                        
                 <label for="TxtDate_Of_Birth">Date Of Birth</label>
               </div>
             </div>
               <div class="col-md-6 mb-3">
                 <div class="form-floating">
                    <asp:TextBox id="TxtMobileNumber" runat="server" class="form-control"  TextMode="Number" ></asp:TextBox>                                          
                   <label for="TxtMobileNumber">Mobile Number</label>
                 </div>
               </div>
             </div>      
              <div class="row g-3">
              <div class="col-md-6 mb-3">
               <div class="form-floating">
                  <asp:TextBox id="TxtContact_Person" runat="server"  class="form-control" ></asp:TextBox>                                        
                 <label for="TxtContact_Person">Contact Person</label>
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
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset" OnClick="BtnDelete_Click"  OnClientClick="return confirm('Are you sure you want to delete this record?');" class="btn btn-danger"  Visible="false"/> <%----%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset" OnClick="BtnReset_Click" class="btn btn-secondary"/>  <%-- --%>
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel" OnClick="BtnExportToExcel_Click" class="btn btn-primary" Visible="false"/> <%-- --%>
           
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
                     <h5 class="card-title">Chemist Master List</h5>

                     <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" 
                                    CssClass="table datatable" DataKeyNames="Stockist_Id"
                                    ShowHeader="true"
                                    >
                         <Columns>
                                <asp:BoundField DataField="Stockist_Id" HeaderText="Stockist Id" />
                                <asp:BoundField DataField="Division_Name" HeaderText="Division Name" />
                                <asp:BoundField DataField="SML_No" HeaderText="SML No" />
                                <asp:BoundField DataField="SML_Saturation" HeaderText="SML Saturation" />
                                <asp:BoundField DataField="STOCKIST_Name" HeaderText="Stockist Name" />
                                <asp:BoundField DataField="Qualification" HeaderText="Qualification" />
                                <asp:BoundField DataField="Owner_Contact_Person" HeaderText="Owner Contact Person" />
                                <asp:BoundField DataField="Class" HeaderText="Class" />
                                <asp:BoundField DataField="City" HeaderText="City" />
                                <asp:BoundField DataField="Address1" HeaderText="Address 1" />
                                <asp:BoundField DataField="Address2" HeaderText="Address 2" />
                                <asp:BoundField DataField="Address3" HeaderText="Address 3" />
                                <asp:BoundField DataField="Area" HeaderText="Area" />
                                <asp:BoundField DataField="PinCode" HeaderText="PinCode" />
                                <asp:BoundField DataField="Date_Of_Birth" HeaderText="Date Of Birth" />
                                <asp:BoundField DataField="Mobile_No" HeaderText="Mobile No." />                          
                                <asp:BoundField DataField="Contact_Person" HeaderText="Contact Person." />                          
                         </Columns>
                     </asp:GridView>
                 </div>
             </div>
         </div>

     </asp:Panel>
    </section>

  </main><!-- End #main -->



</asp:Content>
