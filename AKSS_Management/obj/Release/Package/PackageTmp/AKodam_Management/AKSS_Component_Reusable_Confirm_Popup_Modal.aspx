<%@ Page  Title="Reusable Confirm Popup Model" Async="true" Language="C#" 
    MasterPageFile="~/AKodam_Management/AKSS_Management.Master" 
    AutoEventWireup="true" CodeBehind="AKSS_Component_Reusable_Confirm_Popup_Modal.aspx.cs" 
    Inherits="AKSS_Management.AKodam_Management.AKSS_Component_Reusable_Confirm_Popup_Modal" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <style>
      input[type="checkbox" i] {
          width:20px;
          height:20px
      }
  </style>

    <script type="text/javascript">
      
        function showModal(title, bodyContent, saveButtonHandler) {
            debugger;
            $('#modalTitle').text(title);
            $('#modalBody').html(bodyContent);

            // Bind click event handler to the Save button
            $('#modalSaveButton').off('click').on('click', function () {
                if (saveButtonHandler && typeof saveButtonHandler === 'function') {
                    saveButtonHandler();
                }
                $('#dynamicModal').modal('hide');
            });

            $('#dynamicModal').modal('show');
        };

        //showModal('Dynamic Title', '<p>This is dynamic content.</p>', function () {
        //    alert('Save button clicked!');
        //});


        function showModal1(title, bodyContent, saveButtonHandler) {

            alert("showModal1 click");
            debugger;
            $('#dynamicModal').modal('show');

           <%-- $('#<%=dynamicModal.ClientID%> ').modal('show');--%>

            alert("after showModal1 click");
        };

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <main id="main" class="main">

           <!-- Bootstrap Modal Structure -->

   <div class="modal fade" id="dynamicModal" tabindex="-1" > <%--runat="server"--%>
       <div class="modal-dialog modal-sm">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="modalTitle">dynamicModal title</h5>
                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body" id="modalBody">
                   dynamicModal body
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                   <button type="button" class="btn btn-primary" id="modalSaveButton">Save changes</button>
               </div>
           </div>
       </div>
   </div>


      
   <%-- <div class="pagetitle">
      <h1>Reusable Component Confirm Popup Modal</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultAKSS.aspx">Home</a></li>
          <li class="breadcrumb-item">AKSS Management</li>
          <li class="breadcrumb-item active">Confirm Popup Modal</li>
        </ol>
      </nav>
    </div>--%>
    <!-- End Page Title -->

    <section class="section">

        <asp:Panel ID="Panel1" runat="server" class="card" Visible="true">
            <div class="pagetitle my-3 mx-3">
              <h1>Reusable Component Confirm Popup Modal</h1>
            </div>
            <div class="row">

                <div class="col-lg-8">

                    <div class="card ">
                        <div class="card-body">
                            <%--<h5 class="card-title">Patient List</h5>--%>

                         
                            <!-- Bills/Expenses  Modal -->
                            <div class="modal fade" id="Billing_ExpensesModal" tabindex="-1">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Bills/Expenses</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Bill expenses refer to the costs incurred by an individual or a business in the process of producing or offering its primary goods or services.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Bills/Expenses  Modal-->


                            <div class="row g-3 mb-3">
                                <div class="text-center">

                                    <i class="bi bi-question-circle-fill" data-bs-toggle="modal" data-bs-target="#Billing_ExpensesModal"
                        style="font-size: 28px;"></i>

                                    <br />

                                    <asp:Button ID="BtnSave" runat="server" Text="Create Patient"                                         
                                        OnClientClick="return showModal1('Save Title','are you sure you want to save ?','BtnSave');"
                                        data-bs-toggle="modal" data-bs-target="#dynamicModal"
                                        class="btn btn-primary" />
                                    <%--  data-bs-toggle="modal" data-bs-target="#dynamicModal" OnClick="BtnSave_Click"
                                         OnClientClick="return showModal1('Save Title','are you sure you want to save ?','BtnSave');"
                                        --%>
                                    <asp:Button ID="BtnPrint" runat="server" Text="Print" class="btn btn-primary" OnClick="BtnPrint_Click" Visible="true" />
                                    <%--OnClick="BtnSave_Click" --%>
                                    <asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary" />
                                    <asp:Button ID="BtnDelete" runat="server" Text="Delete" class="btn btn-danger" OnClick="BtnDelete_Click" Visible="true" />
                                    <%--OnClick="BtnDelete_Click"--%>
                                    <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset" class="btn btn-secondary" OnClick="BtnReset_Click" Visible="true" />
                                    <%--OnClick="BtnReset_Click" --%>
                                    <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel" class="btn btn-primary" 
                                          data-bs-toggle="modal" data-bs-target="#Billing_ExpensesModal"
                                        OnClick="BtnExportToExcel_Click" Visible="true" />
                                    <%--OnClick="BtnExportToExcel_Click" --%>

                                    <i class="bx bxs-edit me-1 m-1"
                                        style="background-color: #0d6efd; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; padding-left: 10px;">
                                        <asp:Button ID="GvBtn_Edit" runat="server" Text="Edit" CssClass="btn btn-primary  m-1" title="Edit"
                                            
                                            data-bs-toggle="modal" data-bs-target="#Billing_ExpensesModal"
                                            
                                            OnClick="GvBtn_Edit_Click" />
                                    </i>

                                   <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"  OnClientClick="return confirm('Are you sure you want to edit this user?');"--%>

                                    <a id="A_GvBtn_Create_Appointment" visible="true" runat="server" class="btn btn-warning  m-1"                                                                                 
                                        title="Create Appointment"
                                          OnClick="return showModal1('Save Title','are you sure you want to Create Appointment ?','BtnSave');"
                                       
                                        onserverclick="A_GvBtn_Create_Appointment_serverclick">
                                        <i class="bx bxs-calendar-event me-1"></i>Create Appointment
                                    </a>
                                  <%-- showModal1(title, bodyContent, saveButtonHandler) 
                                        data-bs-toggle="modal" data-bs-target="#dynamicModal"
                                      data-bs-toggle="tooltip" data-bs-placement="bottom" --%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                 
            </div>

        </asp:Panel>

    </section>

  </main><!-- End #main -->

</asp:Content>



