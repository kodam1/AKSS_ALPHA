using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Web.Security;
using ClosedXML.Excel;
using System.IO;
using System.Configuration;
using DocumentFormat.OpenXml.Office2010.Excel;


namespace AKSS_Management.CMIS
{
    public partial class CMIS_Patient_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    LblPatientID_Data.Text = Request.QueryString["ID"].ToString();
                    txtPatientId_TextChanged(sender,e);
                }
                else
                {
                    BindOnFirstPageLoad();
                }

            }
        }

        public void BindOnFirstPageLoad()
        {
           // BtnSave.Text = "Submit";                      
        }

        protected async void txtPatientId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_CREATE_PATIENT";
                //BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@ID", Convert.ToInt32( LblPatientID_Data.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ID"].ToString() != "")
                    {
                        //txtPatientId.Text = dt.Rows[0]["ID"].ToString();
                        LblFirstName_Data.Text = dt.Rows[0]["First_Name"].ToString();
                        LblMiddleName_Data.Text = dt.Rows[0]["Middle_Name"].ToString();
                        LblLastName_Data.Text = dt.Rows[0]["Last_Name"].ToString();
                        LblCountry_Code_Data.Text = dt.Rows[0]["Country_Code"].ToString();
                        LblContactNumber_Data.Text = dt.Rows[0]["Contact_Number"].ToString();
                        LblEmail_Data.Text = dt.Rows[0]["Email"].ToString();
                        LblGender_Data.Text = dt.Rows[0]["Gender"].ToString();
                        LblAge_Data.Text = dt.Rows[0]["Age"].ToString();
                        LblBloodGroup_Data.Text = dt.Rows[0]["Blood_Group"].ToString();
                        LblWeight_Data.Text = dt.Rows[0]["Weight"].ToString();
                        LblHeight_Data.Text = dt.Rows[0]["Height"].ToString();
                        LblBP_Data.Text = dt.Rows[0]["BP"].ToString();
                        LblSymptoms_Data.Text = dt.Rows[0]["Symptoms"].ToString();
                        LblAddress_Data.Text = dt.Rows[0]["Address"].ToString();
                        LblNotes_Data.Text = dt.Rows[0]["Notes"].ToString();
                    
                        //919967534214
                        string mobile_number = LblCountry_Code_Data.Text.Trim() + LblContactNumber_Data.Text.Trim();
                        //                        string WhatsApp = "https://api.whatsapp.com/send?phone="+ mobile_number + "&text=tera%20tea%20break%20khabi%20raheta%20hai";
                        string WhatsApp = "https://api.whatsapp.com/send?phone=" + mobile_number + "&text=Hi how are you ?";
                        A_WhatsApp.HRef = WhatsApp;


                        string Call = "tel:"+ mobile_number;
                        A_Call.HRef = Call;

                        // string sms = "sms:"+ mobile_number+"?&body=Hi%2520there%252C%2520I%2527d%2520like%2520to%2520place%2520an%2520order%2520for...";
                        string sms = "sms:" + mobile_number + "?&body=Hi%2520there...";
                        A_Message.HRef= sms;

                        //<a href="mailto:email@example.com?cc=secondemail@example.com, anotheremail@example.com, &bcc=lastemail@example.com&subject=Mail from our Website&body=Some body text here">Send Email</a>
                        string mail = "mailto:akshaykodam11@gmail.com?cc=secondeakshay@gmail.com,&bcc=akshaykodam1994@gmail.com&subject=Mail from our Website&body=Cinic from JARNY Software Solutions";
                        A_Mail.HRef= mail;


                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtPatientId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }
        
        protected void Btn_Edit_serverclick(object sender, EventArgs e)
        {
            try
            {
                if (LblPatientID_Data.Text != null)
                {
                    Response.Redirect("/CMIS/CMIS_Create_Patient.aspx?ID=" + LblPatientID_Data.Text.Trim(),false);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void Btn_Delete_serverclick(object sender, EventArgs e)
        {
            try
            {
                if (LblPatientID_Data.Text != null)
                {
                    //Response.Redirect("/CMIS/CMIS_Create_Patient.aspx?ID=" + id);
                    try
                    {
                        string spname = "CRUD_CMIS_CREATE_PATIENT";
                        SqlParameter[] parameters = {
                        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                        new SqlParameter("@ID" , Convert.ToInt32(LblPatientID_Data.Text.Trim()))
                        };

                        int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                        if (i > 0)
                        {
                            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('Record Deleted Succefully !');", true);
                            //Response.Redirect("/CMIS/CMIS_Patient_List.aspx", false);
                            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "q1", "alert('Go Back To Patient List !');", true);

                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Record Deleted Succefully !');window.location.href='/CMIS/CMIS_Patient_List.aspx';", true);
                            //BindOnFirstPageLoad();
                            ClearAll();
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D2", "alert('Data Not Deleted !');", true);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }

            }
            catch
            {
                throw;
            }
        }
        
        protected void Btn_Create_Appointment_serverclick(object sender, EventArgs e)
        {
            try
            {
                if (LblPatientID_Data.Text != null)
                {
                    Response.Redirect("/CMIS/CMIS_Appointment.aspx?ID=" + LblPatientID_Data.Text.Trim());
                }
            }
            catch
            {
                throw;
            }
        }

        public void ClearAll()
        {
            LblPatientID_Data.Text = string.Empty;
            LblFirstName_Data.Text = string.Empty;
            LblMiddleName_Data.Text = string.Empty;
            LblLastName_Data.Text = string.Empty;
            LblCountry_Code_Data.Text = string.Empty;
            LblContactNumber_Data.Text = string.Empty;
            LblEmail_Data.Text = string.Empty;
            LblGender_Data.Text = string.Empty;
            LblAge_Data.Text = string.Empty;
            LblBloodGroup_Data.Text = string.Empty;
            LblWeight_Data.Text = string.Empty;
            LblHeight_Data.Text = string.Empty;
            LblBP_Data.Text = string.Empty;
            LblSymptoms_Data.Text = string.Empty;
            LblAddress_Data.Text = string.Empty;
            LblNotes_Data.Text = string.Empty;
        }


    }
}