<%@ Page  Title="Send Bulk Email"  Async="true" Language="C#" MasterPageFile="~/AKodam_Management/AKSS_Management.Master" 
    AutoEventWireup="true" CodeBehind="AKSS_Send_bulk_email.aspx.cs" 
    Inherits="AKSS_Management.AKodam_Management.AKSS_Send_bulk_email" validateRequest="false" %>


<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <main id="main" class="main">

   <%-- <div class="pagetitle">
      <h1>Send Bulk Email</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultAKSS.aspx">Home</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Send Bulk Email</li>
        </ol>
      </nav>
    </div>--%>
    <!-- End Page Title -->

    <section class="section">

     <asp:Panel ID="Panel1" runat="server" class="card"  >
         <div class="pagetitle my-3 mx-3">
             <h1>Send Bulk Email</h1>
         </div>
      <div class="row">
        
        <div class="col-lg-12">
 
          <div class="card ">
            <div class="card-body">
              <%--<h5 class="card-title">Send Bulk Email</h5>--%> 

              <div class="row g-3 mt-3">
                  <div class="col-md-12 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="txtID" runat="server"  class="form-control"   AutoPostBack="true" OnTextChanged="txtID_TextChanged"></asp:TextBox>  <%-- TextMode="MultiLine" Height="100px" Width="100%" AutoPostBack="true" OnTextChanged="txtClientId_TextChanged"--%>
                    <label for="txtID">ID </label>
                  </div>
                </div>
                
              </div>
                
              <div class="row g-3 ">
                  <div class="col-md-12 mb-3">
                  <div class="form-floating">
                    <asp:TextBox id="txtFrom" runat="server"  class="form-control"  ></asp:TextBox>  <%-- TextMode="MultiLine" Height="100px" Width="100%" AutoPostBack="true" OnTextChanged="txtClientId_TextChanged"--%>
                    <label for="txtFrom">From </label>
                  </div>
                </div>
                
              </div>

              <div class="row g-3">                 
                <div class="col-md-12 mb-3">
                     <div class="form-floating">
                       <asp:TextBox id="txtTo" runat="server" class="form-control" TextMode="MultiLine" Height="100px" Width="100%" ></asp:TextBox>                                        
                       <label for="txtTo">To</label>
                     </div>
                </div>
              </div>

              <div class="row g-3">                 
                <div class="col-md-12 mb-3">
                     <div class="form-floating">
                       <asp:TextBox id="txtCc" runat="server" class="form-control"  ></asp:TextBox> <%--TextMode="MultiLine" Height="100px" Width="100%"--%>                                       
                       <label for="txtCc">Cc</label>
                     </div>
                </div>
              </div>

              <div class="row g-3">                 
                <div class="col-md-12 mb-3">
                     <div class="form-floating">
                       <asp:TextBox id="txtBcc" runat="server" class="form-control"  ></asp:TextBox>    <%--TextMode="MultiLine" Height="100px" Width="100%"--%>                                    
                       <label for="txtBcc">Bcc</label>
                     </div>
                </div>
              </div>

              <div class="row g-3">                 
                <div class="col-md-12 mb-3">
                     <div class="form-floating">
                       <asp:TextBox id="txtSubject" runat="server" class="form-control"  ></asp:TextBox>    <%--TextMode="MultiLine" Height="100px" Width="100%"--%>                                    
                       <label for="txtSubject">Subject</label>
                     </div>
                </div>
              </div>
                 
              <div class="row g-3">                 
                <div class="col-md-12 mb-3">
                     <div class="form-floating">
                       <asp:FileUpload id="UfUploadFile" runat="server" class="form-control" AllowMultiple="true" ></asp:FileUpload>    <%--TextMode="MultiLine" Height="100px" Width="100%"--%>                                    
                       <label for="UfUploadFile">Upload File</label>
                     </div>
                    <asp:Label ID="lblUploadFile" runat="server" CssClass="form-control" text=""></asp:Label>
                </div>
              </div>

              <div class="row g-3">                 
                <div class="col-md-12 mb-3">                      
                    <asp:Label ID="LblTotalcount" runat="server" CssClass="form-control" text=""></asp:Label>
                </div>
              </div>
                
                    
      <div class="row g-3">
          <div class="col-md-12 mb-3">
              <div class="mb-3">
               
                  <%----%>
                   <%--<div class="form-floating">--%>
                  <FTB:FreeTextBox id="TxtMail_Body" 
                     toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,
                                     FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,
                                     Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,
                                     JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,
                                     Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Print,
                                     Save|SymbolsMenu,StylesMenu,InsertHtmlMenu|InsertRule,InsertDate,
                                     InsertTime|InsertTable,EditTable;InsertTableRowAfter,InsertTableRowBefore,
                                     DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,
                                     DeleteTableColumn|InsertForm,InsertTextBox,InsertTextArea,InsertRadioButton,
                                     InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,
                                     InsertImageFromGallery,Preview,SelectAll,WordClean,NetSpell"
                     runat="Server" Width="100%" Height="600px" Visible="false"
                     DesignModeCss="/demos/demo.css" /> 
                    <label for="TxtMail_Body">Mail Body</label>
                    <%--</div>--%>

                       <!-- TinyMCE Editor -->
                 <textarea class="tinymce-editor" runat="Server" id="TxtTinymceEditor">
                                 
                 </textarea><!-- End TinyMCE Editor -->


                  <br />                                           
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

           <asp:Button ID="BtnSave" runat="server" Text="Send Bulk Email" OnClick="BtnSave_Click"  class="btn btn-primary"/> <%--OnClick="BtnSave_Click"--%>
           <%--<asp:Button ID="btnUpdate" runat="server" Text="Modify" OnClick="BtnUpdate_Click" class="btn btn-primary"/>--%>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete"  type="reset"  class="btn btn-danger" OnClick="BtnDelete_Click" Visible="false"/> <%--OnClick="BtnDelete_Click"--%>
           <asp:Button ID="BtnReset" runat="server" Text="Reset" type="reset" OnClick="BtnReset_Click" class="btn btn-secondary"/>  <%-- OnClick="BtnReset_Click"--%>
           <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel"  class="btn btn-primary" OnClick="BtnExportToExcel_Click" Visible="true"/> <%--OnClick="BtnExportToExcel_Click" --%>
           
       </div>
     </div>

      </div>

     </asp:Panel>

     <asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto" Width="100%" style="height:auto;" Visible="true" >
       
         <div class="row">
             <div class="col-lg-12">
                 <div class="card-body">
                     <h5 class="card-title">Client Email List</h5>

                     <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False"                      
                                     CssClass="table datatable table-hover"                        
                                     ShowHeader="true"
                                     SortExpression="ID"
                                     AllowSorting="true"
                                     DataKeyNames="ID" 
                                     OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                     OnRowCreated="GridView1_RowCreated" 
                                    >
                         <Columns>
                             <asp:BoundField DataField="ID" HeaderText="Id" />
                             <asp:BoundField DataField="From" HeaderText="From" />
                             <asp:BoundField DataField="To" HeaderText="To" />
                              <asp:BoundField DataField="Cc" HeaderText="Cc" />
                             <asp:BoundField DataField="Bcc" HeaderText="Bcc" />
                             <asp:BoundField DataField="Subject" HeaderText="Subject" />
                             <asp:BoundField DataField="Upload_File_Name" HeaderText="Upload_File_Name" />                            
                             <%--<asp:BoundField DataField="Mail_Body" HeaderText="Mail_Body" />--%>
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" />
                             <asp:BoundField DataField="CreateDate_Time" HeaderText="CreateDate_Time" />
                             <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" />
                            <asp:BoundField DataField="ModifiedDate_Time" HeaderText="ModifiedDate_Time" />
                             <asp:TemplateField HeaderText="select">
                                 <ItemTemplate>
                                     <asp:Button ID="BtnGvSelect" Text="Select" runat="server" CommandName="Select"
                                         CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-primary" />
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                     </asp:GridView>
                 </div>
             </div>
         </div>

     </asp:Panel>
    </section>

  </main><!-- End #main -->



</asp:Content>