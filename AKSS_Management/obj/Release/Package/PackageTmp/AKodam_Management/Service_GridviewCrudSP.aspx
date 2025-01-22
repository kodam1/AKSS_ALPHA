<%@ Page Title="" Language="C#" MasterPageFile="~/AKodam_Management/AKSS_Management.Master" AutoEventWireup="true" CodeBehind="Service_GridviewCrudSP.aspx.cs" Inherits="AKSS_Management.AKodam_Management.Service_GridviewCrudSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
 </asp:ScriptManager>
 <div id="panel" style="height: 500px; background-color: White; padding: 10px; overflow:auto">
     <h1>
         <a href="../adminIndex.aspx">Back </a>| Service Master
     </h1>
     <asp:UpdatePanel ID="UpdatePanelService" runat="server" UpdateMode="Conditional">
         <ContentTemplate>
             <asp:GridView ID="gridService" runat="server" CssClass="EU_DataTable" AutoGenerateColumns="false"
                 ShowFooter="true" OnRowEditing="gridService_RowEditing" 
                 onrowcreated="gridService_RowCreated" 
                 onrowupdating="gridService_RowUpdating">
                 <Columns>
                     <asp:TemplateField ItemStyle-Width="30px" HeaderText="SR.NO">
                         <ItemTemplate>
                             <asp:Label ID="lblID" runat="server" Text='<%# Eval("service_id")%>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField ItemStyle-Width="600px" HeaderText="Service">
                         <ItemTemplate>
                             <asp:Label ID="lblService" runat="server" Text='<%# Eval("service_name")%>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtService" runat="server" Text='<%# Eval("service_name")%>'></asp:TextBox>
                         </EditItemTemplate>
                         <FooterTemplate>
                             <asp:TextBox ID="txtService" runat="server"></asp:TextBox>
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField ItemStyle-Width="100px" HeaderText="Service Photo">
                         <ItemTemplate>
                             <img src='<%# Eval("service_image")%>' alt='<%# Eval("service_image")%>' height="50px"
                                 width="50px" />
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:FileUpload ID="fuService" runat="server" />
                         </EditItemTemplate>
                         <FooterTemplate>
                             <asp:FileUpload ID="fuService" runat="server" />
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("service_id")%>'
                                 OnClientClick="return confirm('Do you want to delete?')" Text="Delete"></asp:LinkButton>
                         </ItemTemplate>
                         <FooterTemplate>
                             <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="AddService" />
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:CommandField ShowEditButton="True" />
                 </Columns>
             </asp:GridView>
             <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelService">
                 <ProgressTemplate>
                     Please wait image is getting uploaded....
                 </ProgressTemplate>
             </asp:UpdateProgress>
         </ContentTemplate>
         <Triggers>
        
         </Triggers>
     </asp:UpdatePanel>
 </div>
</asp:Content>
