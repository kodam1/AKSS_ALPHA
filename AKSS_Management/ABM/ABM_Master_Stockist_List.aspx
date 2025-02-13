<%@ Page Title="Stockist Master List"  Async="true"  Language="C#" MasterPageFile="~/ABM/ABM.Master" 
    AutoEventWireup="true" CodeBehind="ABM_Master_Stockist_List.aspx.cs" 
    Inherits="AKSS_Management.ABM.ABM_Master_Stockist_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .datatable-input {            
                width: 315px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
  <main id="main" class="main">

    <div class="pagetitle">
      <%--<h1>Emp Demo</h1>--%>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/DefaultABM.aspx">Home</a></li>
          <%--<li class="breadcrumb-item">Pages</li>--%>
          <li class="breadcrumb-item active">Stockist Master List</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
       
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body" style="padding: 0 0px 20px 0px;">
              <%--<h5 class="card-title">Doctor Master List</h5>--%>

                <div class="row g-3 m-1">
                    <div class="col-lg-12">
                        <span style="font-size: large">Stockist Master List
                        </span>
                        <span style="float: right;">
                            <a id="A1_BtnAddMasterStockistCreate" runat="server" class="m-1" href="/ABM/ABM_Master_Stockist_Create.aspx"
                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="Add Stockist Master">
                                <i class="bx bxs-plus-circle me-1" style="font-size: xx-large;"></i>
                            </a>
                        </span>
                    </div>
                </div>

                <div class="col-lg-12">
                   <%-- <div class="card ">
                        <div class="card-body">--%>
                              <asp:Panel ID="PnlGV" runat="server" class="card" ScrollBars="Auto" Width="100%" Visible="true" >
                            <div class="row mt-1">
                                <div class="col-md-12 text-end">
                                    <asp:Button ID="Button1" runat="server" Text="Download Excel" class="btn btn-primary"
                                        Visible="false" OnClick="BtnExportToExcel_Click" />

                                    <a id="A73" runat="server" class="btn btn-primary m-2" data-bs-toggle="tooltip"
                                        data-bs-placement="bottom" title="Download Excel" onserverclick="BtnExportToExcel_Click">
                                        <i class="bx bxs-download me-1" style="font-size: x-large;"></i>
                                        <%-- <br />--%>
                                        <span style="font-size: medium;">Download Excel</span>
                                    </a>
                                </div>
                            </div>

                            <div class="row g-3 " style="display:none;">
                                <div class="col-md-12 mb-3 mt-3 d-flex align-items-center" style="padding-top: 30px">
                                    <a style="cursor: pointer;"><i class="bx bx-search-alt me-1"
                                        style="border-radius: 5px; font-weight: 100; font-size: x-large; padding-left: 10px;"></i></a>
                                    <asp:TextBox ID="Txt_GV_Custom_Search" runat="server" BorderColor="Black" class="form-control"
                                        ToolTip="Search here..." Placeholder="Patient Search ..."
                                        TextMode="SingleLine" Width="100%" AutoPostBack="true" OnPreRender="Txt_GV_Custom_Search_TextChanged">
                                    </asp:TextBox>
                                </div>
                            </div>
                           
                            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False"
                                CssClass="table datatable table-hover"
                                ShowHeader="true"
                                SortExpression="Stockist_Id"
                                AllowSorting="true"
                                DataKeyNames="Stockist_Id"
                                OnRowCommand="GridView1_RowCommand"
                                OnRowCreated="GridView1_RowCreated">
                               
                                <Columns>                                   
                                    <asp:BoundField DataField="Stockist_Id" HeaderText="Sr No." />
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
                                    <asp:BoundField DataField="Contact_Person" HeaderText="Contact Person" />

                                    <asp:TemplateField HeaderText="Action Select">
                                        <ItemTemplate>
                                            <%--<asp:Button ID="BtnGvSelect" Text="Select" runat="server" CommandName="Select" 
                                            CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-primary" />--%>
                                          <%--  <span style="float: right;">--%>
                                               <%-- <i class="icon bi bi-eye me-1 m-1"
                                                    style="background-color: #0d6efd; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; padding-top: 10px !important; padding-left: 10px !important; padding-bottom: 15px !important;">                                                    
                                                </i>   --%>        
                                            <asp:Button ID="GvBtn_View" runat="server" Text="View" CssClass="btn btn-primary  m-1"
                                                data-bs-toggle="tooltip" data-bs-placement="bottom" title="View"
                                                CommandName="GvBtn_View" Style="font-family: arial;"
                                                CommandArgument="<%# Container.DataItemIndex %>" />
                                          <%--  </span>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Action Edit">
                                        <ItemTemplate>
                                             <%-- <i class="bx bxs-edit me-1 m-1"
                                                  style="background-color: #0d6efd; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; padding-left: 10px;">                                                
                                              </i>--%>
                                              <asp:Button ID="GvBtn_Edit" runat="server" Text="Edit" CssClass="btn btn-primary  m-1"
                                                  data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"
                                                  CommandName="GvBtn_Edit" Style="font-family: arial;"
                                                  CommandArgument="<%# Container.DataItemIndex %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action Delete">
                                        <ItemTemplate>
                                            <%--<i class="bx bxs-trash-alt me-1 m-1"
                                                style="background-color: #dc3545; border-radius: 5px; margin-left: -15px; color: #ffffff; font-weight: 100; padding-left: 10px;">                                                                                             
                                            </i>--%>
                                             <asp:Button ID="GvBtn_Delete" runat="server" Text="Delete" CssClass="btn btn-danger m-1"
                                             data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"
                                             OnClientClick="return confirm('Are you sure you want to delete this record?');"
                                             CommandName="GvBtn_Delete" Style="font-family: arial;"
                                             CommandArgument="<%# Container.DataItemIndex %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                             </asp:Panel>
                       <%-- </div>
                    </div>--%>
                </div>
                            

               </div>
          </div>
        </div>     
      </div>
             
    </section>

  </main><!-- End #main -->


</asp:Content>

