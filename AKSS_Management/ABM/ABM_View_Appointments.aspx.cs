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
    public partial class ABM_View_Appointments : System.Web.UI.Page
   {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {                 
                    LblAppointmentID_Data.Text = Request.QueryString["Id"].ToString();
                    LblAppointmentID_Data_TextChanged(sender, e);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Page_Load", "alert('Data Not Present !');", true);
                }

            }
        }       
        
        protected async void LblAppointmentID_Data_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";                
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Id", Convert.ToInt32( LblAppointmentID_Data.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
                    {

                        LblAppointmentID_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Id"].ToString()) ? dt.Rows[0]["Id"].ToString() : "-";
                        LblDate_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Date"].ToString()) ? dt.Rows[0]["Date"].ToString() : "-";
                        LblDoctorName_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["DoctorName"].ToString()) ? dt.Rows[0]["DoctorName"].ToString() : "-";
                        LblChemistName_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["ChemistName"].ToString()) ? dt.Rows[0]["ChemistName"].ToString() : "-";
                        LblStockistName_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["StockistName"].ToString()) ? dt.Rows[0]["StockistName"].ToString() : "-";
                        LblArea_Location_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Area_Location"].ToString()) ? dt.Rows[0]["Area_Location"].ToString() : "-";
                        LblNotes_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Note"].ToString()) ? dt.Rows[0]["Note"].ToString() : "-";
                    }
                }
                else
                {
                    ClearAll();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "LblAppointmentID_Data_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected void Btn_Edit_serverclick(object sender, EventArgs e)
        {
            if (LblAppointmentID_Data.Text.Trim() != null)
            {
                Response.Redirect("/ABM/ABM_Create_Appointments.aspx?Id=" + LblAppointmentID_Data.Text.Trim(), false);
            }
        }
        
        protected async void BtnDelete_serverclick(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                        new SqlParameter("@Id" , Convert.ToInt32(LblAppointmentID_Data.Text.Trim()))
                        };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {                    
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Record Deleted Succefully !');window.location.href='/ABM/ABM_List_Appointments.aspx';", true);
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

        public void ClearAll()
        {
            LblAppointmentID_Data.Text = String.Empty;
            LblDate_Data.Text = String.Empty;
            LblDoctorName_Data.Text = String.Empty;
            LblChemistName_Data.Text = String.Empty;
            LblStockistName_Data.Text = String.Empty;
            LblArea_Location_Data.Text = String.Empty;
            LblNotes_Data.Text = String.Empty;
        }

    }
}