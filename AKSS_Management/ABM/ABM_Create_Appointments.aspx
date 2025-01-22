<%@ Page Title="Create Appointments" Async="true" Language="C#" MasterPageFile="~/ABM/ABM.Master"
    AutoEventWireup="true" CodeBehind="ABM_Create_Appointments.aspx.cs"
    Inherits="AKSS_Management.ABM.ABM_Create_Appointments" %>

<%--<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>--%>
<%--<%@ Register Assembly="AjaxControlToolkit, Version=20.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" TagPrefix="telerik" TypeName="AjaxControlToolkit.ComboBox" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <style>
        input[type="checkbox" i] {
            width: 20px;
            height: 20px
        }

        .demo-container label {
            display: block;
            margin: 15px 0 5px 0;
        }

        .btn-send-invite {
            float: right;
            margin: 25px auto 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main id="main" class="main">
        <div class="pagetitle">
            <%--<h1>User Master</h1>--%>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/DefaultABM.aspx">Home</a></li>
                    <%--<li class="breadcrumb-item">Admin Panel</li>--%>
                    <li class="breadcrumb-item active">Create Appointment</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section">

            <asp:Panel ID="Panel1" runat="server" class="card">

                <%--<asp:UpdatePanel ID="Up1" runat="server">
                    <ContentTemplate>--%>
                    
                <div class="pagetitle my-3 mx-3 ">
                    <h1><a id="A1_BtnBackAppointments_List" runat="server" class="m-1" href="/ABM/ABM_List_Appointments.aspx"
                        data-bs-toggle="tooltip" data-bs-placement="bottom" title="Back To Appointments List">
                        <i class="ri-arrow-left-line me-1"></i>
                    </a>Create Appointment</h1>
                </div>

                <div class="row">

                    <div class="col-lg-12">

                        <div class="card ">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <asp:Label ID="Lblh5_Title" runat="server" Text="Create Appointment"></asp:Label>
                                </h5>

                                <div class="row g-3 ">
                                    <div class="col-md-12 d-flex align-items-center" style="display: block;">
                                          <a style="cursor:pointer;" id="A_BtnSearchAppointmentId" runat="server" onserverclick="A_BtnSearchAppointmentId_serverclick"> <i class="bx bx-search-alt me-1"
                                           style=" border-radius: 5px; font-weight: 100;font-size: x-large; 
                                           padding-left: 10px;"> </i></a>
                                        <div class="form-floating search-form d-flex align-items-center " style="width:100% !important">
                                            <asp:TextBox ID="txtAppointmentId" runat="server" class="form-control"  Width="100%"   ></asp:TextBox><%--AutoPostBack="true" OnTextChanged="txtAppointmentId_TextChanged" --%>
                                            <label for="txtAppointmentId">Appointment Id</label>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating">
                                            <asp:TextBox ID="txtDate" runat="server" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                                            <label for="txtDate">Date<span style="font-weight: 600; color: red"> *</span></label>
                                        </div>
                                    </div>

                                </div>

                                <div class="row g-3">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating mb-3">
                                                Select Doctor
                                            <asp:ListBox ID="DdlDoctor" runat="server" CssClass="form-select multi-select"
                                                ClientIDMode="Static" aria-label="Doctor" SelectionMode="Multiple"
                                                DataTextField="DOCTOR_Name" DataValueField="Dr_Id" OnChange="getDdlDoctorSelectedText()">
                                            </asp:ListBox>
                                              <asp:HiddenField ID="hfDdlDoctorSelectedTexts" runat="server" />
                                           <%-- <label for="DdlDoctor">Doctor<span style="font-weight: 600; color: red"> *</span></label>--%>
                                        </div>
                                    </div>

                                </div>

                                <div class="row g-3">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating mb-3">
                                             Select Chemist
                                            <asp:ListBox ID="DdlChemist" runat="server" CssClass="form-select multi-select" 
                                                ClientIDMode="Static" aria-label="DdlChemist"  SelectionMode="Multiple"
                                                DataTextField="CHEMIST_Name" DataValueField="Chemist_Id" OnChange="getDdlChemistSelectedText()">
                                            </asp:ListBox>
                                            <asp:HiddenField ID="hfDdlChemistSelectedTexts" runat="server" />

                                        </div>
                                    </div>

                                </div>

                                <div class="row g-3">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating mb-3">
                                             Select Stockist
                                            <asp:ListBox ID="DdlStockist" runat="server" CssClass="form-select multi-select" 
                                                ClientIDMode="Static" aria-label="DdlStockist"  SelectionMode="Multiple"
                                                DataTextField="STOCKIST_Name" DataValueField="Stockist_Id"  OnChange="getDdlStockistSelectedText()">
                                            </asp:ListBox>
                                               <asp:HiddenField ID="hfDdlStockistSelectedTexts" runat="server" />

                                        </div>
                                    </div>

                                </div>



                                <div class="row g-3">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating">
                                            <asp:TextBox ID="txtAreaLocation" runat="server" class="form-control" TextMode="MultiLine" Height="100px" Width="100%"></asp:TextBox>
                                            <label for="txtAreaLocation">Area/Location<span style="font-weight: 600; color: red"> *</span></label>
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
                            <%--<button type="submit" class="btn btn-primary">Submit</button>
         <button type="reset" class="btn btn-secondary">Reset</button>--%>

                            <asp:Button ID="BtnSave" runat="server" Text="Create Appointment" class="btn btn-primary"
                                OnClick="BtnSave_Click"/>
                            <%--  --%>
                            <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary" Visible="false" />
                            <%--OnClick="BtnSave_Click" --%>
                            <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
                            <asp:Button ID="BtnDelete" runat="server" Text="Delete" class="btn btn-danger" Visible="false" />
                            <%--OnClick="BtnDelete_Click"--%>
                            <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset" class="btn btn-secondary" Visible="true" 
                                 OnClick="BtnReset_Click" />
                            <%----%>
                            <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel" class="btn btn-primary" Visible="false" />
                            <%--OnClick="BtnExportToExcel_Click" --%>
                        </div>
                    </div>

                </div>
                    
                    
                   <%-- </ContentTemplate>

                </asp:UpdatePanel>--%>

            </asp:Panel>

        </section>

        <script>

           <%-- $(document).ready(function () {
                // Initialize Select2
                $('#<%= ddlItems.ClientID %>').attr('multiple', 'multiple').select2({
                     placeholder: "Select options",
                     allowClear: true
                 });
             });
            
            function getSelectedText() {
                var selectedTexts = [];
                // Loop through all ListBox items and get selected ones
                $('#<%= ddlItems.ClientID %> option:selected').each(function () {
                     selectedTexts.push($(this).text());
                 });

                $('#<%= hfSelectedTexts.ClientID %>').val(selectedTexts);

                alert("Selected texts: " + selectedTexts.join(', '));
            }--%>

           
            $(document).ready(function () {
                // Initialize Select2
                $('#<%= DdlDoctor.ClientID %>').attr('multiple', 'multiple').select2({
                placeholder: "Select Doctor",
                allowClear: true
            });
            });

            function getDdlDoctorSelectedText() {
                var selectedTexts = [];
                // Loop through all ListBox items and get selected ones
                $('#<%= DdlDoctor.ClientID %> option:selected').each(function () {
                     selectedTexts.push($(this).text());
                 });

                 $('#<%= hfDdlDoctorSelectedTexts.ClientID %>').val(selectedTexts);

                 //alert("Selected texts: " + selectedTexts.join(', '));
            }

            $(document).ready(function () {
                // Initialize Select2
                $('#<%= DdlChemist.ClientID %>').attr('multiple', 'multiple').select2({
                      placeholder: "Select Chemist",
                      allowClear: true
                  });
            });

            function getDdlChemistSelectedText() {
                var selectedTexts = [];
                // Loop through all ListBox items and get selected ones
                $('#<%= DdlChemist.ClientID %> option:selected').each(function () {
                     selectedTexts.push($(this).text());
                 });

                 $('#<%= hfDdlChemistSelectedTexts.ClientID %>').val(selectedTexts);

                 //alert("Selected texts: " + selectedTexts.join(', '));
             }

             $(document).ready(function () {
                 // Initialize Select2
                 $('#<%= DdlStockist.ClientID %>').attr('multiple', 'multiple').select2({
                     placeholder: "Select Stockist",
                     allowClear: true
                 });
             });

            function getDdlStockistSelectedText() {
                var selectedTexts = [];
                // Loop through all ListBox items and get selected ones
                $('#<%= DdlStockist.ClientID %> option:selected').each(function () {
                       selectedTexts.push($(this).text());
                   });

                   $('#<%= hfDdlStockistSelectedTexts.ClientID %>').val(selectedTexts);

               // alert("Selected texts: " + selectedTexts.join(', '));
            }


        </script>

    </main>
    <!-- End #main -->

</asp:Content>
