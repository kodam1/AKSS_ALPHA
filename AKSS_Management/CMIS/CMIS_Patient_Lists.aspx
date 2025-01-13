<%@ Page Title="Patient Lists New"  Async="true"  Language="C#" 
    MasterPageFile="~/CMIS/CMIS.Master" AutoEventWireup="true" 
    CodeBehind="CMIS_Patient_Lists.aspx.cs" Inherits="AKSS_Management.CMIS.CMIS_Patient_Lists"
      EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Patient Lists New</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/Default.aspx">Home</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Patient Lists New</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Patient Lists New</h5>
            
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"                      
                                     CssClass="table datatable table-hover"                        
                                     ShowHeader="true"
                                     SortExpression="id"
                                     AllowSorting="true"
                                     DataKeyNames="id" 
                                     OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                     OnRowCreated="GridView1_RowCreated" 
                           >                          
                            <Columns>                                
                                <asp:BoundField DataField="id" HeaderText="Sr No." ShowHeader="true"   />
                                <asp:BoundField DataField="FullName" HeaderText="Full Name" ShowHeader="true"  />
                                <asp:BoundField DataField="Contact_Number" HeaderText="Mob No." ShowHeader="true" />
                                
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