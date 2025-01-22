<%@ Page Title="AKSS Code"  Async="true" Language="C#" MasterPageFile="~/AKodam_Management/AKSS_Management.Master"
    AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="AKSS_Code.aspx.cs" Inherits="AKSS_Management.AKodam_Management.AKSS_Code" %>

<%--  <%@ Register Assembly="AjaxControlToolkit, Version=20.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" 
      TagPrefix="ajaxToolkit" TypeName="AjaxControlToolkit.TextBoxWatermarkExtender" %>--%>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<%--<%@ Register Assembly="AjaxControlToolkit, Version=20.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" 
    TagPrefix="ajaxToolkit" TypeName="AjaxControlToolkit.HtmlEditorExtender" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
    function printDiv() 
    {

     console.log(" printDiv called " );
        var divToPrint = document.getElementById('<%= DivResult.ClientID %>');

      var newWin=window.open('','Print-Window');

      newWin.document.open();

        newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');

      newWin.document.close();

      setTimeout(function(){newWin.close();},10);

    }
    </script>

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

     <asp:Panel ID="PnlAkssCode" runat="server" class="card"  >
         
      <div class="row">
        
        <div class="col-lg-12">
       
            <div class="card-body">
              <h5 class="card-title">AKSS ShortCut Code</h5>
              
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                <ajaxToolkit:TabContainer id="TabContUserMasterList" runat="server" ActiveTabIndex="0" CssClass="card-body">

                     <ajaxToolkit:TabPanel ID="TabPnlDeveloper" runat="server" TabIndex="0" HeaderText="Developer" CssClass="mb-3">
                         <ContentTemplate>
                             <div class="row g-3 my-3">
                                 <div class="col-md-4 mb-3">
                                     <div class="form-floating mb-3">
                                         <asp:TextBox ID="TxtDeveloperTableName" runat="server" class="form-control" TextMode="SingleLine"
                                             ToolTip="Enter Function/Method Name" aria-label="TxtDeveloperTableName">                                   
                                         </asp:TextBox>
                                         <label for="TxtDeveloperTableName">Table Name</label>
                                     </div>
                                 </div>
                                 <div class="col-md-4 mb-3">
                                     <div class="form-floating mb-3">
                                         <asp:DropDownList ID="DdlDeveloperPageFunction" runat="server" class="form-select" aria-label="DdlDeveloperPageFunction">
                                             <asp:ListItem Value="Select Page Function" Text="Select Page Function" Selected="True">Select Page Function</asp:ListItem>
                                             <asp:ListItem Value="Page_Full_Functionality" Text="Page_Full_Functionality" >Page_Full_Functionality</asp:ListItem>
                                             <asp:ListItem Value="Namespaces" Text="Namespaces" >Namespaces</asp:ListItem>
                                             <asp:ListItem Value="Page_Load" Text="Page_Load" >Page_Load</asp:ListItem>
                                             <asp:ListItem Value="BindOnFirstPageLoad" Text="BindOnFirstPageLoad">BindOnFirstPageLoad</asp:ListItem>
                                             <asp:ListItem Value="GetMaxId" Text="GetMaxId">GetMaxId</asp:ListItem>
                                             <asp:ListItem Value="Bind_GV" Text="Bind_GV" >Bind_GV</asp:ListItem>
                                             <asp:ListItem Value="txtId_TextChanged" Text="txtId_TextChanged">txtId_TextChanged</asp:ListItem>
                                             <asp:ListItem Value="txtClientName_TextChanged" Text="txtClientName_TextChanged">txtClientName_TextChanged</asp:ListItem>
                                             <asp:ListItem Value="CheckClientExistOrNot" Text="CheckClientExistOrNot" >CheckClientExistOrNot</asp:ListItem>
                                             <asp:ListItem Value="BtnSave_Click" Text="BtnSave_Click">BtnSave_Click</asp:ListItem>
                                             <asp:ListItem Value="BtnOnlySave_Click" Text="BtnOnlySave_Click">BtnOnlySave_Click</asp:ListItem>
                                             <asp:ListItem Value="BtnOnlyUpdate_Click" Text="BtnOnlyUpdate_Click">BtnOnlyUpdate_Click</asp:ListItem>
                                             <asp:ListItem Value="BtnDelete_Click" Text="BtnDelete_Click">BtnDelete_Click</asp:ListItem>
                                             <asp:ListItem Value="BtnReset_Click" Text="BtnReset_Click" >BtnReset_Click</asp:ListItem>
                                             <asp:ListItem Value="BtnExportToExcel_Click" Text="BtnExportToExcel_Click">BtnExportToExcel_Click</asp:ListItem>
                                             <asp:ListItem Value="ClearAll" Text="ClearAll">ClearAll</asp:ListItem>
                                         </asp:DropDownList>
                                         <label for="DdlDeveloperPageFunction">Page Function</label>
                                     </div>
                                 </div>
                                 <div class="col-md-4 mb-3">                                 
                                     <div class="form-floating mb-3">
                                         <asp:DropDownList ID="DdlDeveloperGVFunctionality" runat="server" class="form-select" aria-label="DdlDeveloperGVFunctionality">
                                             <asp:ListItem Value="Select View Events" Text="Select View Events" Selected="True">Select View Events</asp:ListItem>
                                             <asp:ListItem Value="GridView1" Text="GridView1">GridView1</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Full_Functionality" Text="GridView1_Full_Functionality">GridView1_Full_Functionality</asp:ListItem>
                                             <asp:ListItem Value="GridView1_DataBound" Text="GridView1_DataBound">GridView1_DataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCommand" Text="GridView1_RowCommand">GridView1_RowCommand</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCreated" Text="GridView1_RowCreated">GridView1_RowCreated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDataBound" Text="GridView1_RowDataBound">GridView1_RowDataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleted" Text="GridView1_RowDeleted">GridView1_RowDeleted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleting" Text="GridView1_RowDeleting">GridView1_RowDeleting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowEditing" Text="GridView1_RowEditing">GridView1_RowEditing</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCancelingEdit" Text="GridView1_RowCancelingEdit">GridView1_RowCancelingEdit</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdated" Text="GridView1_RowUpdated">GridView1_RowUpdated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdating" Text="GridView1_RowUpdating">GridView1_RowUpdating</asp:ListItem>
                                             <asp:ListItem Value="GridView1_SelectedIndexChanged" Text="GridView1_SelectedIndexChanged">GridView1_SelectedIndexChanged</asp:ListItem>
                                             <asp:ListItem Value="GridView1_PageIndexChanging" Text="GridView1_PageIndexChanging">GridView1_PageIndexChanging</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorting" Text="GridView1_Sorting">GridView1_Sorting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorted" Text="GridView1_Sorted">GridView1_Sorted</asp:ListItem>                                                                                          
                                         </asp:DropDownList>
                                         <label for="DdlDeveloperGVFunctionality">Grid View Events</label>
                                     </div>                                 
                                 </div>
                             </div>
                             <div class="row g-3 mb-3">
                                 <div class="col-4 mb-3">
                                     <div class="form-floating mb-3">
                                         <asp:DropDownList ID="DdlDeveloperCSharpLogic" runat="server" class="form-select" aria-label="DdlDeveloperCSharpLogic">
                                             <asp:ListItem Value="Select Logic" Text="Select Logic" Selected="True">Select Logic</asp:ListItem>
                                             <asp:ListItem Value="GridView1_DataBound" Text="GridView1_DataBound">GridView1_DataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCommand" Text="GridView1_RowCommand">GridView1_RowCommand</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCreated" Text="GridView1_RowCreated">GridView1_RowCreated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDataBound" Text="GridView1_RowDataBound">GridView1_RowDataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleted" Text="GridView1_RowDeleted">GridView1_RowDeleted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleting" Text="GridView1_RowDeleting">GridView1_RowDeleting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowEditing" Text="GridView1_RowEditing">GridView1_RowEditing</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCancelingEdit" Text="GridView1_RowCancelingEdit">GridView1_RowCancelingEdit</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdated" Text="GridView1_RowUpdated">GridView1_RowUpdated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdating" Text="GridView1_RowUpdating">GridView1_RowUpdating</asp:ListItem>
                                             <asp:ListItem Value="GridView1_SelectedIndexChanged" Text="GridView1_SelectedIndexChanged">GridView1_SelectedIndexChanged</asp:ListItem>
                                             <asp:ListItem Value="GridView1_PageIndexChanging" Text="GridView1_PageIndexChanging">GridView1_PageIndexChanging</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorting" Text="GridView1_Sorting">GridView1_Sorting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorted" Text="GridView1_Sorted">GridView1_Sorted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Functionality1" Text="GridView1_Functionality1">GridView1_Functionality1</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Functionality2" Text="GridView1_Functionality2">GridView1_Functionality2</asp:ListItem>

                                         </asp:DropDownList>
                                         <label for="DdlDeveloperCSharpLogic">C# Logic</label>
                                     </div>
                                 </div>
                             </div>
                             <div class="row g-3 mb-3">
                                 <div class="col-4 mb-3">
                                     <div class="form-floating mb-3">
                                         <asp:DropDownList ID="DdlDeveloperStringFunction" runat="server" class="form-select" aria-label="DdlDeveloperStringFunction">
                                             <asp:ListItem Value="Select String Function" Text="Select String Function" Selected="True">Select String Function</asp:ListItem>
                                             <asp:ListItem Value="GridView1_DataBound" Text="GridView1_DataBound">GridView1_DataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCommand" Text="GridView1_RowCommand">GridView1_RowCommand</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCreated" Text="GridView1_RowCreated">GridView1_RowCreated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDataBound" Text="GridView1_RowDataBound">GridView1_RowDataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleted" Text="GridView1_RowDeleted">GridView1_RowDeleted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleting" Text="GridView1_RowDeleting">GridView1_RowDeleting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowEditing" Text="GridView1_RowEditing">GridView1_RowEditing</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCancelingEdit" Text="GridView1_RowCancelingEdit">GridView1_RowCancelingEdit</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdated" Text="GridView1_RowUpdated">GridView1_RowUpdated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdating" Text="GridView1_RowUpdating">GridView1_RowUpdating</asp:ListItem>
                                             <asp:ListItem Value="GridView1_SelectedIndexChanged" Text="GridView1_SelectedIndexChanged">GridView1_SelectedIndexChanged</asp:ListItem>
                                             <asp:ListItem Value="GridView1_PageIndexChanging" Text="GridView1_PageIndexChanging">GridView1_PageIndexChanging</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorting" Text="GridView1_Sorting">GridView1_Sorting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorted" Text="GridView1_Sorted">GridView1_Sorted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Functionality1" Text="GridView1_Functionality1">GridView1_Functionality1</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Functionality2" Text="GridView1_Functionality2">GridView1_Functionality2</asp:ListItem>

                                         </asp:DropDownList>
                                         <label for="DdlDeveloperStringFunction">String Function</label>
                                     </div>
                                 </div>
                                 <div class="col-4 mb-3">
                                     <div class="form-floating mb-3">
                                         <asp:DropDownList ID="DdlDeveloperMathFunciton" runat="server" class="form-select" aria-label="DdlDeveloperMathFunciton">
                                             <asp:ListItem Value="Select Math Funciton" Text="Select Math Funciton" Selected="True">Select Math Funciton</asp:ListItem>
                                             <asp:ListItem Value="GridView1_DataBound" Text="GridView1_DataBound">GridView1_DataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCommand" Text="GridView1_RowCommand">GridView1_RowCommand</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCreated" Text="GridView1_RowCreated">GridView1_RowCreated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDataBound" Text="GridView1_RowDataBound">GridView1_RowDataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleted" Text="GridView1_RowDeleted">GridView1_RowDeleted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleting" Text="GridView1_RowDeleting">GridView1_RowDeleting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowEditing" Text="GridView1_RowEditing">GridView1_RowEditing</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCancelingEdit" Text="GridView1_RowCancelingEdit">GridView1_RowCancelingEdit</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdated" Text="GridView1_RowUpdated">GridView1_RowUpdated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdating" Text="GridView1_RowUpdating">GridView1_RowUpdating</asp:ListItem>
                                             <asp:ListItem Value="GridView1_SelectedIndexChanged" Text="GridView1_SelectedIndexChanged">GridView1_SelectedIndexChanged</asp:ListItem>
                                             <asp:ListItem Value="GridView1_PageIndexChanging" Text="GridView1_PageIndexChanging">GridView1_PageIndexChanging</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorting" Text="GridView1_Sorting">GridView1_Sorting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorted" Text="GridView1_Sorted">GridView1_Sorted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Functionality1" Text="GridView1_Functionality1">GridView1_Functionality1</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Functionality2" Text="GridView1_Functionality2">GridView1_Functionality2</asp:ListItem>

                                         </asp:DropDownList>
                                         <label for="DdlDeveloperMathFunciton">Math Funciton</label>
                                     </div>
                                 </div>
                                 <div class="col-4 mb-3">
                                     <div class="form-floating mb-3">
                                         <asp:DropDownList ID="DdlDeveloperDateFunciton" runat="server" class="form-select" aria-label="DdlDeveloperDateFunciton">
                                             <asp:ListItem Value="Select Date Funciton" Text="Select Date Funciton" Selected="True">Select Date Funciton</asp:ListItem>
                                             <asp:ListItem Value="GridView1_DataBound" Text="GridView1_DataBound">GridView1_DataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCommand" Text="GridView1_RowCommand">GridView1_RowCommand</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCreated" Text="GridView1_RowCreated">GridView1_RowCreated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDataBound" Text="GridView1_RowDataBound">GridView1_RowDataBound</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleted" Text="GridView1_RowDeleted">GridView1_RowDeleted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowDeleting" Text="GridView1_RowDeleting">GridView1_RowDeleting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowEditing" Text="GridView1_RowEditing">GridView1_RowEditing</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowCancelingEdit" Text="GridView1_RowCancelingEdit">GridView1_RowCancelingEdit</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdated" Text="GridView1_RowUpdated">GridView1_RowUpdated</asp:ListItem>
                                             <asp:ListItem Value="GridView1_RowUpdating" Text="GridView1_RowUpdating">GridView1_RowUpdating</asp:ListItem>
                                             <asp:ListItem Value="GridView1_SelectedIndexChanged" Text="GridView1_SelectedIndexChanged">GridView1_SelectedIndexChanged</asp:ListItem>
                                             <asp:ListItem Value="GridView1_PageIndexChanging" Text="GridView1_PageIndexChanging">GridView1_PageIndexChanging</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorting" Text="GridView1_Sorting">GridView1_Sorting</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Sorted" Text="GridView1_Sorted">GridView1_Sorted</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Functionality1" Text="GridView1_Functionality1">GridView1_Functionality1</asp:ListItem>
                                             <asp:ListItem Value="GridView1_Functionality2" Text="GridView1_Functionality2">GridView1_Functionality2</asp:ListItem>

                                         </asp:DropDownList>
                                         <label for="DdlDeveloperDateFunciton">Date Funciton</label>
                                     </div>
                                 </div>
                             </div>
                             <div class="row g-3 mb-3">

                                 <div class="text-center">

                                     <asp:Button ID="BtnDeveloperSubmit" runat="server" Text="Submit" OnClick="BtnDeveloperSubmit_Click" class="btn btn-primary" />
                                     <asp:Button ID="BtnDeveloperReset" runat="server" Text="Reset" OnClick="BtnDeveloperReset_Click" type="reset" class="btn btn-secondary" />
                                     <asp:Button ID="BtnDeveloper_Print" runat="server" Text="Print" OnClientClick="printDiv();" class="btn btn-primary" />

                                 </div>
                             </div>
                             <div class="row g-3">
                                 <div class="col-md-12 mb-3">
                                     <div class="mb-3">
                                         O/P :
                                       <%-- <asp:TextBox ID="" runat="server" class="form-control"
                                            TextMode="MultiLine" Height="700px" Width="100%"
                                            ToolTip="Out Put" aria-label="TxtDeveloper">                                   
                                        </asp:TextBox>--%>

                                         <FTB:FreeTextBox id="TxtDeveloperResult" 
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
                                            runat="Server" Width="100%" Height="600px"
                                            DesignModeCss="/demos/demo.css" /> 
                                         <br />                                           
                                     </div>
                                 </div>
                                  <div class="col-md-12 mb-3">                                    
                                   <%--   <ajaxToolkit:TextBoxWatermarkExtender id="ajaxTextBox" runat="server" WatermarkText="Hello" >


                                      </ajaxToolkit:TextBoxWatermarkExtender>--%>
                                </div>
                                 <div class="col-md-12 mb-3">
                                        
                                    <%-- <ajaxToolkit:HtmlEditorExtender runat="server" TargetControlID="ajaxTextBox">

                                     </ajaxToolkit:HtmlEditorExtender>--%>
                                      
                                </div>
                             </div>

                             <%--<div class="row g-3">
                                   <div class="row g-3" id="DivResult" runat="server" style="display: block;">
                                       <table>
                                           <tr>
                                               <td style="width:700px">
                                                    <pre id="PResult" runat="server" >

                                                     </pre>
                                               </td>
                                           </tr>
                                       </table>
              
                                   </div>
                               </div>--%>
                         </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                    <ajaxToolkit:TabPanel ID="TabPanelDBA" runat="server" TabIndex="1" HeaderText="DBA" CssClass="mb-3">
                        <ContentTemplate>
                          <div class="row g-3 my-3">
                                <div class="col-md-4 mb-3">
                                <div class="form-floating mb-3">
                                <asp:TextBox id="TxtDBATableName" runat="server" class="form-control" TextMode="SingleLine" 
                                             ToolTip="Enter Table Name" aria-label="TxtDBATableName" >                                   
                                </asp:TextBox>
                                <label for="TxtDBATableName">Table Name</label>
                              </div>
                              </div>
                            <div class="col-md-4 mb-3">
                              <div class="form-floating mb-3">
                              <asp:DropDownList id="DdlDBACategory" runat="server" class="form-select"  aria-label="DdlDBACategory" >
                                <asp:ListItem Value="SP" Text="SP" selected="True">SP</asp:ListItem>
                                <asp:ListItem value="Function"  Text="Function" >Function</asp:ListItem>
                                <asp:ListItem value="View"  Text="View" >View</asp:ListItem>
                              </asp:DropDownList>
                              <label for="DdlDBACategory">Role</label>
                            </div>
                            </div>
                            <div class="col-4 mb-3">
                                <div class="form-floating mb-3">
                                <asp:DropDownList id="DdlDBASubCategory" runat="server" class="form-select"  aria-label="Sub Category" >
                                  <asp:ListItem Value="Select" Text="Select" selected="True">Select</asp:ListItem>
                                  <asp:ListItem value="value1"  Text="Text1" >Text1</asp:ListItem>
                                  <asp:ListItem value="value2"  Text="Text2" >Text2</asp:ListItem>
                                </asp:DropDownList>
                                <label for="DdlDBASubCategory">Sub Category</label>
                              </div>
                            </div>
                          </div>
                        
                         <div class="row g-3 mb-3">
 
                            <div class="text-center">
                            
                                <asp:Button ID="BtnDBA_Save" runat="server" Text="Submit" OnClick="BtnDBA_Save_Click" class="btn btn-primary"/>                                
                                <asp:Button ID="BtnDBA_Reset" runat="server" Text="Reset" OnClick="BtnDBA_Reset_Click" type="reset" class="btn btn-secondary"/>
                                <asp:Button ID="BtnDBA_Print" runat="server" Text="Print" OnClientClick="printDiv();" class="btn btn-primary"/>
        
                            </div>
                          </div>
                           <div class="row g-3">
                             <div class="col-md-12 mb-3">
                             <div class="mb-3">
                             O/P :
                           <%--  <asp:TextBox id="TxtResult" runat="server" class="form-control" 
                                          TextMode="MultiLine" Height="700px" Width="100%"
                                          ToolTip="Out Put" aria-label="TxtTableName" >                                   
                             </asp:TextBox>--%>


                                <FTB:FreeTextBox id="TxtDBAResult" 
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
                                runat="Server" Width="100%" Height="600px"
                                DesignModeCss="/demos/demo.css" /> 
                                <br /> 
                           
                           </div>
                           </div>
                            </div>
                            <%--<div class="row g-3">
                                <div class="row g-3" id="DivResult" runat="server" style="display: block;">
                                    <table>
                                        <tr>
                                            <td style="width:700px">
                                                 <pre id="PResult" runat="server" >

                                                  </pre>
                                            </td>
                                        </tr>
                                    </table>
                                   
                                </div>
                            </div>--%>
                    

                            </ContentTemplate>
                    </ajaxToolkit:TabPanel>                   

                    <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" TabIndex="2" HeaderText="Designer" CssClass="mb-3">
                        <ContentTemplate></ContentTemplate>
                    </ajaxToolkit:TabPanel>

                </ajaxToolkit:TabContainer>

                    <div class="row g-3">
                        <div class="row g-3" id="DivResult" runat="server" style="display: none;">
                            <table>
                                <tr>
                                    <td style="width: 700px">
                                        <pre id="PResult" runat="server">

                                        </pre>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>



                </ContentTemplate>
                </asp:UpdatePanel>   
                
                    <div class="row g-3"  style="display: none;">
                          <!-- TinyMCE Editor   -->
                         <textarea class="tinymce-editor" >
     
                         </textarea><!-- End TinyMCE Editor -->
                    </div>

                <div class="row g-3">
                    

                 <%--   OnSaveClick="SaveButton_Click"--%>
                </div>

            </div>
         
        </div>
      </div>

    </asp:Panel>
   
    </section>

  </main>
    <!-- End #main -->
</asp:Content>
