<%@ Page Title="GV sorting filter pagenation select"  Async="true" Language="C#" 
    MasterPageFile="~/AKodam_Management/AKSS_Management.Master" 
    AutoEventWireup="true" 
    CodeBehind="AKSS_Component_GV_sorting_filter_pagenation_select.aspx.cs" 
    Inherits="AKSS_Management.AKodam_Management.AKSS_Component_GV_sorting_filter_pagenation_select"
    EnableEventValidation="false" 
    %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
            
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"                      
                                     CssClass="table datatable table-hover"                        
                                     ShowHeader="true"
                                     SortExpression="Id"
                                     AllowSorting="true"
                                     DataKeyNames="id" 
                                     OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                     OnRowCreated="GridView1_RowCreated" 
                           >                          
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
            </div>
          </div>
        </div>     
      </div>
    </section>

  </main><!-- End #main -->


</asp:Content>
