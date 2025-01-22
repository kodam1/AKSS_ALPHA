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

namespace AKSS_Management.ABM
{
    public partial class ABM_Master_Doctor_View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["UserName"].ToString()))
                {
                    ViewState["Session_UserName"] = Session["UserName"].ToString();
                }
                else
                {
                    Response.Redirect("/pages_login.aspx");
                }

                if (Request.QueryString["Dr_Id"] != null)
                {                    
                    LblDr_Id_Data.Text = Request.QueryString["Dr_Id"].ToString();
                    LblDr_Id_Data_TextChanged(sender, e);
                }
                else
                {
                    BindOnFirstPageLoad();
                }

            }
        }
       
        public void BindOnFirstPageLoad()
        {
            
        }
       
        protected async void LblDr_Id_Data_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_DoctorMaster_test";                
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Dr_Id", Convert.ToInt32( LblDr_Id_Data.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Dr_Id"].ToString() != "")
                    {                       
                        LblDr_Id_Data.Text = !string.IsNullOrEmpty( dt.Rows[0]["Dr_Id"].ToString()) ? dt.Rows[0]["Dr_Id"].ToString() : "-" ;
                        LblDivision_Name_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Division_Name"].ToString()) ? dt.Rows[0]["Division_Name"].ToString() : "-";
                        LblDML_No_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["DML_No"].ToString()) ? dt.Rows[0]["DML_No"].ToString() : "-";
                        LblDML_Saturation_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["DML_Saturation"].ToString()) ? dt.Rows[0]["DML_Saturation"].ToString() : "-";
                        LblDOCTOR_Name_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["DOCTOR_Name"].ToString()) ? dt.Rows[0]["DOCTOR_Name"].ToString() : "-";
                        LblQualification_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Qualification"].ToString()) ? dt.Rows[0]["Qualification"].ToString() : "-";
                        LblSpeciality_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Speciality"].ToString()) ? dt.Rows[0]["Speciality"].ToString() : "-";
                        LblClass_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Class"].ToString()) ? dt.Rows[0]["Class"].ToString() : "-";
                        LblCity_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["City"].ToString()) ? dt.Rows[0]["City"].ToString() : "-";
                        LblAddress1_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address1"].ToString()) ? dt.Rows[0]["Address1"].ToString() : "-";
                        LblAddress2_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address2"].ToString()) ? dt.Rows[0]["Address2"].ToString() : "-";
                        LblAddress3_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address3"].ToString()) ? dt.Rows[0]["Address3"].ToString() : "-";
                        LblArea_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Area"].ToString()) ? dt.Rows[0]["Area"].ToString() : "-";
                        LblPinCode_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["PinCode"].ToString()) ? dt.Rows[0]["PinCode"].ToString() : "-";
                        LblDate_Of_Birth_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Date_Of_Birth"].ToString()) ? dt.Rows[0]["Date_Of_Birth"].ToString() : "-";
                        LblMobile_No_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Mobile_No"].ToString()) ? dt.Rows[0]["Mobile_No"].ToString() : "-";
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "LblDr_Id_Data_TextChanged", "alert('Data Not Present !');", true);
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
                if (LblDr_Id_Data.Text != null)
                {
                    Response.Redirect("/ABM/ABM_Master_Doctor_Create.aspx?Dr_Id=" + LblDr_Id_Data.Text.Trim(), false);
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
                if (LblDr_Id_Data.Text != null)
                {                   
                    try
                    {
                        string spname = "CRUD_ABM_DoctorMaster_test";
                        SqlParameter[] parameters = {
                        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                        new SqlParameter("@Dr_Id" , Convert.ToInt32(LblDr_Id_Data.Text.Trim()))
                        };

                        int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                        if (i > 0)
                        {
                           
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Record Deleted Succefully !');window.location.href='/ABM/ABM_Master_Doctor_List.aspx';", true);                            
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

        public void ClearAll()
        {
            LblDr_Id_Data.Text = string.Empty;
            LblDivision_Name_Data.Text = string.Empty;
            LblDML_No_Data.Text = string.Empty;
            LblDML_Saturation_Data.Text = string.Empty;
            LblDOCTOR_Name_Data.Text = string.Empty;
            LblQualification_Data.Text = string.Empty;
            LblSpeciality_Data.Text = string.Empty;
            LblClass_Data.Text = string.Empty;
            LblCity_Data.Text = string.Empty;
            LblAddress1_Data.Text = string.Empty;
            LblAddress2_Data.Text = string.Empty;
            LblAddress3_Data.Text = string.Empty;
            LblArea_Data.Text = string.Empty;
            LblPinCode_Data.Text = string.Empty;
            LblDate_Of_Birth_Data.Text = string.Empty;
            LblMobile_No_Data.Text = string.Empty;
        }


    }
}