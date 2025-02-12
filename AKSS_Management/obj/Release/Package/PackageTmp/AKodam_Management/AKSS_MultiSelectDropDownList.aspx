<%@ Page Title="Multi Select Drop Down List"  Async="true"  Language="C#" 
    MasterPageFile="~/AKodam_Management/AKSS_Management.Master" AutoEventWireup="true"
    CodeBehind="AKSS_MultiSelectDropDownList.aspx.cs" 
    Inherits="AKSS_Management.AKodam_Management.AKSS_MultiSelectDropDownList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Multi Select Drop Down List Demo</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/Default.aspx">Home</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Multi Select Drop Down List</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Multi Select Drop Down List</h5>                     
                    <div class="row g-3 my-3">
                        <div class="col-md-4 mb-3">
                            <div class="form-floating mb-3">

                                <asp:TextBox ID="txtCustomItem" runat="server" Placeholder="Enter custom item"></asp:TextBox>
                                <asp:ListBox ID="ddlItems" runat="server" CssClass="form-select multi-select" 
                                    ClientIDMode="Static" SelectionMode="Multiple" Width="450px" OnChange="getSelectedText()">
                                      <asp:ListItem Text="" Value="0" />
                                    <asp:ListItem Text="Nikunj Satasiya" Value="1" />
                                    <asp:ListItem Text="Ronak Rabadiya" Value="2" />
                                    <asp:ListItem Text="Hiren Dobariya" Value="3" />
                                    <asp:ListItem Text="Vivek Ghadiya" Value="4" />
                                    <asp:ListItem Text="Pratik Pansuriya" Value="5" />
                                    <asp:ListItem Text="Kishan Patel" Value="6" />
                                </asp:ListBox>

                                 <br>
                                <%--<asp:Button Text="Submit Students" CssClass="btn btn-default btn-success" runat="server" OnClick="Submit" />--%>

                                 <!-- Hidden field to store selected texts -->
                                <asp:HiddenField ID="hfSelectedTexts" runat="server" />
            
                                <!-- Button to trigger server-side code -->
                                <asp:Button ID="btnGetSelected" runat="server" Text="Get Selected Items" OnClick="btnGetSelected_Click" />

                            </div>
                        </div>
                    </div>
                </div>
           
          </div>
        </div>     
      </div>
    </section>
       
         <script>
             $(document).ready(function () {
                 // Initialize Select2
                 $('#<%= ddlItems.ClientID %>').attr('multiple', 'multiple').select2({
                    placeholder: "Select options",
                    allowClear: true
                });
             });

             // Capture selected items on button click
             $('#<%= btnGetSelected.ClientID %>').click(function () {
                 // Get all selected item texts
                 var selectedTexts = $('#<%= ddlItems.ClientID %> option:selected').map(function () {
                        return $(this).text();
                    }).get().join(',');

                    // Store in hidden field
                 $('#<%= hfSelectedTexts.ClientID %>').val(selectedTexts);

                 alert(hfSelectedTexts.text);

             });

             // Restore selected values from the hidden field
            <%-- var selectedValues = $('#<%= hfSelectedTexts.ClientID %>').val(); // Comma-separated values
             if (selectedValues) {
                 // Split the values into an array and set them as selected
                 $('#<%= ddlItems.ClientID %>').val(selectedValues.split(',')).trigger('change');
                }--%>

             function getSelectedText() {
                 var selectedTexts = [];
                 // Loop through all ListBox items and get selected ones
                 $('#<%= ddlItems.ClientID %> option:selected').each(function () {
                    selectedTexts.push($(this).text());
                });

                 $('#<%= hfSelectedTexts.ClientID %>').val(selectedTexts);

                alert("Selected texts: " + selectedTexts.join(', '));
             }

             function addCustomItem() {
                 const customText = $('#customItemText').val().trim(); // Get custom item text
                 if (customText) {
                     const customValue = 'custom-' + Date.now(); // Generate a unique value

                     // Add the custom item to the dropdown
                     const newOption = new Option(customText, customValue, true, true);
                     $('#<%= ddlItems.ClientID %>').append(newOption).trigger('change');

                     // Clear the input field
                     $('#customItemText').val('');
                 }
             }


         </script>

  </main><!-- End #main -->


</asp:Content>

