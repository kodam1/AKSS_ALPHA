<%@ Page Title="Import/Export Databases" Language="C#" MasterPageFile="~/CMIS/CMIS.Master" 
    AutoEventWireup="true" CodeBehind="CMIS_Import_Export_Databases.aspx.cs" 
    Inherits="AKSS_Management.CMIS.CMIS_Import_Export_Databases" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Import/Export Databases</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/Default.aspx">Home</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Import/Export Databases</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section faq">
      <div class="row">
        <div class="col-lg-12">   
            
          <!-- F.A.Q Group 1 -->
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Import/Export Database Feature:</h4>
                <div class="accordion-body">
                   <p> Our clinic management app utilizes an offline 
                    database, meaning it can only be actively used on one 
                    device at a time. The Import/Export feature comes in 
                    handy when you switch devices and want to transfer 
                    your valuable clinic data securely. 
                    </p>
                </div>
                 <h5 class="lead">Here's how it works: </h5>
                <h4 class="card-title">Export a database: </h4>
                
              <div class="accordion accordion-flush" id="faq-group-1">

                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" data-bs-target="#faqsOne-1" type="button" data-bs-toggle="collapse">
                      1. Create a Backup ?
                    </button>
                  </h2>
                  <div id="faqsOne-1" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
                    <div class="accordion-body">
                      The app generates a complete copy of your clinic data named "clinic.db".
                    </div>
                  </div>
                </div>

                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" data-bs-target="#faqsOne-2" type="button" data-bs-toggle="collapse">
                      2. Secure Your Backup ?
                    </button>
                  </h2>
                  <div id="faqsOne-2" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
                    <div class="accordion-body">
                      We recommend you to save it in a safe and secure location. Remember, this data represents your entire clinic's offline information.                     
                    </div>
                  </div>
                </div>

                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" data-bs-target="#faqsOne-3" type="button" data-bs-toggle="collapse">
                      3. Verify Everything ?
                    </button>
                  </h2>
                  <div id="faqsOne-3" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
                    <div class="accordion-body">
                      Use an SQLite viewer to confirm all your data is present before proceeding.
                    </div>
                  </div>
                </div>                
              </div>

            </div>
          </div>
          <!-- End F.A.Q Group 1 -->

        </div>

          <div class="col-lg-12">
              <div class="card">
                  <div class="card-body">
                      <h5 class="card-title">Import a database:</h5>

                      <!-- Default Accordion -->
                      <div class="accordion" id="accordionExample">
                          <div class="accordion-item">
                              <h2 class="accordion-header" id="headingOne">
                                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                      Transfer the Backup #1
                                  </button>
                              </h2>
                              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <%--<strong>This is the first item's accordion body.</strong>--%> 
                  Move the "clinic.db" file to your new device.
                                  </div>
                              </div>
                          </div>
                          <div class="accordion-item">
                              <h2 class="accordion-header" id="headingTwo">
                                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                      Import and Resume #2
                                  </button>
                              </h2>
                              <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <%--<strong>This is the second item's accordion body.</strong>--%> 
                  Use the app to import the backup and get back to managing your clinic instantly. 
                                  </div>
                              </div>
                          </div>
                          <div class="accordion-item">
                              <h2 class="accordion-header" id="headingThree">
                                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                      Restart for Smoothness #3
                                  </button>
                              </h2>
                              <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <%--<strong>This is the third item's accordion body.</strong>--%> 
                  For optimal performance, restart the app after a successful import. 
                                  </div>
                              </div>
                          </div>
                      </div>
                      <!-- End Default Accordion Example -->

                  </div>
              </div>
          </div>

      </div>

        <div class="row">
             <div class="col-lg-12">
                 <div class="card">
                     <div class="card-body">
                         <h5 class="card-title">Disclaimer:</h5>
                         <p>
                             While the Import/Export feature is designed to be secure and reliable, please be aware of the following:

                         </p>
                         <!-- Default Accordion -->
                         <div class="accordion" id="DataPrivacy">
                             <div class="accordion-item">
                                 <h2 class="accordion-header" id="DataPrivacy_h">
                                     <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#DataPrivacy_b" aria-expanded="false" aria-controls="collapseOne">
                                         Data Privacy #1
                                     </button>
                                 </h2>
                                 <div id="DataPrivacy_b" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                     <div class="accordion-body">
                                         <%--<strong>This is the first item's accordion body.</strong>--%> 
                                          You are solely responsible for the security and privacy of your exported database. We recommend storing it in a secure and encrypted location.
                                     </div>
                                 </div>
                             </div>
                             <div class="accordion-item">
                                 <h2 class="accordion-header" id="CompatibilityTwo">
                                     <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCompatibilityTwo" aria-expanded="false" aria-controls="collapseTwo">
                                         Compatibility #2
                                     </button>
                                 </h2>
                                 <div id="collapseCompatibilityTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                     <div class="accordion-body">
                                         <%--<strong>This is the second item's accordion body.</strong>--%> 
                                             We strive to maintain compatibility between app versions, but future updates might impact import functionality. Always back up before updating.
                                     </div>
                                 </div>
                             </div>
                             <div class="accordion-item">
                                 <h2 class="accordion-header" id="headingDataLossThree">
                                     <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDataLossThree" aria-expanded="false" aria-controls="collapseThree">
                                         Data Loss #3
                                     </button>
                                 </h2>
                                 <div id="collapseDataLossThree" class="accordion-collapse collapse" aria-labelledby="headingDataLossThree" data-bs-parent="#accordionExample">
                                     <div class="accordion-body">
                                         <%--<strong>This is the third item's accordion body.</strong>--%> 
                                        We cannot guarantee against potential data loss during export, import, or device transfer. Always double-check your data before relying on the imported database.
                                     </div>
                                 </div>
                             </div>
                             <div class="accordion-item">
                                 <h2 class="accordion-header" id="headingLimitedSupportFour">
                                     <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLimitedSupportFour" aria-expanded="false" aria-controls="collapseLimitedSupportFour">
                                         Limited Support #4
                                     </button>
                                 </h2>
                                 <div id="collapseLimitedSupportFour" class="accordion-collapse collapse" aria-labelledby="headingLimitedSupportFour" data-bs-parent="#accordionExample">
                                     <div class="accordion-body">
                                         <%--<strong>This is the third item's accordion body.</strong>--%> 
                                        This feature is provided as-is with limited technical support. For complex migration issues, we recommend consulting a data specialist.
                                     </div>
                                 </div>
                             </div>

                            

                         </div>
                         <!-- End Default Accordion Example -->
                         <br />
                         <p>
                             By using the Import/Export feature, you acknowledge and agree to these terms and conditions.
                         </p>

                     </div>
                 </div>             
             </div>
         </div>
    </section>

  </main><!-- End #main -->

</asp:Content>

