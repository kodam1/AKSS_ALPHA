<%@ Page Title="Emp Demo"  Async="true" Language="C#" MasterPageFile="~/AKodam_Management/AKSS_Management.Master" 
    AutoEventWireup="true" CodeBehind="EmpDemo.aspx.cs" EnableEventValidation="false" 
    Inherits="AKSS_Management.AKodam_Management.EmpDemo" %>

<%@ Register Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <%-- <script>

        $(document).ready(function () {
            $("#<%=GridView1.ClientID%>").DataTable();
        });

    </script>--%>

   <%-- <script src="./../assets/vendor/simple-datatables/simple-datatables.js"></script>--%>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Emp Demo</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/Default.aspx">Home</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Emp Demo</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Employee List</h5>
              <%--<p>This is an examle page with no contrnt. You can use it as a starter for your custom pages.</p>--%>

                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>

                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"                      
                                     CssClass="table datatable table-hover"                        
                                     ShowHeader="true"
                                     SortExpression="Id"
                                     AllowSorting="true"
                                     DataKeyNames="id" 
                                     OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                     OnRowCreated="GridView1_RowCreated" 
                           >
                           <%--AllowPaging="true"
                                OnRowDataBound="GridView1_RowDataBound"
                                AllowSorting="true"
                                DataKeyNames="id"
                                PageSize="4" 
                               ShowHeader="true"
                                                                                                                                 
                                OnDataBound="GridView1_DataBound"
                                OnRowCommand="GridView1_RowCommand"
                                OnRowDataBound="GridView1_RowDataBound"
                                OnRowDeleted="GridView1_RowDeleted"
                                OnRowDeleting="GridView1_RowDeleting"
                                OnRowEditing="GridView1_RowEditing"
                                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                OnRowUpdated="GridView1_RowUpdated"
                                OnRowUpdating="GridView1_RowUpdating"
                                OnPageIndexChanging="GridView1_PageIndexChanging"
                                OnSorting="GridView1_Sorting"
                                OnSorted="GridView1_Sorted"                               
                           --%>

                            <Columns>
                                
                                <asp:BoundField DataField="id" HeaderText="Sr No." ShowHeader="true"   />
                                <asp:BoundField DataField="name" HeaderText="name" ShowHeader="true"  />
                                <asp:BoundField DataField="role" HeaderText="role" ShowHeader="true" />
                                <asp:BoundField DataField="salary" HeaderText="salary" ShowHeader="true"  />
                                <asp:TemplateField HeaderText="select">
                                    <ItemTemplate>                                        
                                        <asp:Button ID="BtnGvSelect" Text="Select" runat="server" CommandName="Select" 
                                            CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-primary" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                   <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>



            </div>
          </div>

        </div>     
      </div>
    </section>

  </main><!-- End #main -->


</asp:Content>
