<%@ Page Title="Client FollowUp List" Async="true"  Language="C#" MasterPageFile="~/AKodam_Management/AKSS_Management.Master" AutoEventWireup="true" CodeBehind="ClientFollowUpMasterList.aspx.cs" Inherits="AKSS_Management.AKodam_Management.ClientFollowUpMasterList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" EnableViewState="false" >

    <style>
        .pnlTitle{                     
            background-color: #f6f9ff;
           /* #161f321a;*/
            padding: 15px;
            border-radius: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main id="main" class="main">

    <%--        
    <div class="pagetitle">
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

            <asp:Panel ID="Panel1" runat="server" class="card" ScrollBars="Auto">
                <div class="pagetitle my-3 mx-3 pnlTitle">
                    <h1>Client Follow Up Master List</h1>
                </div>
                <div class="row g-3 mb-3">
                    <div class="text-center">
                        <asp:Button ID="BtnExportToExcel" runat="server" Text="Export To Excel" 
                                    OnClick="BtnExportToExcel_Click" class="btn btn-primary" />                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <%--<div class="card-body">--%>
                            <%--<h5 class="card-title">Client Follow Up Master List</h5>--%>
                             <%--<asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto">--%>
                            <asp:GridView ID="gvClientFollowUpMaster" runat="server" AutoGenerateColumns="false" 
                                Class="table datatable" 
                                DataKeyNames="ClientId" 
                                OnRowCreated="gvClientFollowUpMaster_RowCreated"
                                OnRowCommand="gvClientFollowUpMaster_RowCommand"
                                OnSelectedIndexChanged="gvClientFollowUpMaster_SelectedIndexChanged"
                                OnPageIndexChanging="gvClientFollowUpMaster_PageIndexChanging"
                                ShowHeader="true"
                                OnRowDataBound="gvClientFollowUpMaster_RowDataBound"
                                AutoGenerateSelectButton="False" ShowHeaderWhenEmpty="True">
                                

                    <%--             AllowPaging="True" 
                                     AllowSorting="true"
                                     OnDataBound="GridView1_DataBound"
                                     OnRowCommand="GridView1_RowCommand"
                                     OnRowCreated="GridView1_RowCreated"
                                     OnRowDataBound="GridView1_RowDataBound"
                                     OnRowDeleted="GridView1_RowDeleted"
                                     OnRowDeleting="GridView1_RowDeleting"
                                     OnRowEditing="GridView1_RowEditing"
                                     OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                     OnRowUpdated="GridView1_RowUpdated"
                                     OnRowUpdating="GridView1_RowUpdating"
                                     OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                     OnPageIndexChanging="GridView1_PageIndexChanging"
                                     OnSorting="GridView1_Sorting"
                                     OnSorted="GridView1_Sorted"
                                     AllowPaging="True" DataKeyNames="Id" AllowSorting="true"                                                
                        --%>

                                <Columns>
                                    <asp:BoundField DataField="ClientId" HeaderText="Client Id" />
                                    <asp:BoundField DataField="Client_Name" HeaderText="Client_Name" />
                                    <asp:BoundField DataField="Ratting" HeaderText="Ratting" />
                                    <asp:BoundField DataField="Category" HeaderText="Category" />
                                    <asp:BoundField DataField="Address1" HeaderText="Address 1" />
                                    <asp:BoundField DataField="Open_Hours" HeaderText="Open_Hours" />
                                    <asp:BoundField DataField="Direction" HeaderText="Direction" />                                    
                                    <asp:BoundField DataField="Address2" HeaderText="Address 2" />
                                    <asp:BoundField DataField="Mobile_No" HeaderText="Mobile No" />
                                    <asp:BoundField DataField="Telephone_No" HeaderText="Telephone No" />
                                    <asp:BoundField DataField="Follow_Up_Reason" HeaderText="Follow Up" />
                                    <asp:BoundField DataField="Website" HeaderText="Website" />
                                    <asp:BoundField DataField="IsActive" HeaderText="Active" />
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>                                            
                                            <asp:Button ID="GvSelect" Text="Select" runat="server" CommandName="Select" CssClass="btn btn-primary"
                                                CommandArgument="<%# Container.DataItemIndex %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <%--</asp:Panel>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </asp:Panel>

        </section>

    </main>
    
</asp:Content>
