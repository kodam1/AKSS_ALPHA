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
    public partial class CMIS_Create_Lab_Reports_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Lab_Report_ID"] != null)
                {
                    LblLabReportId_Data.Text = Request.QueryString["Lab_Report_ID"].ToString();
                    txtLabReportId_TextChanged(sender, e);
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

        protected async void txtLabReportId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Lab_Report";                
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Lab_Report_ID", Convert.ToInt32( LblLabReportId_Data.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Lab_Report_ID"].ToString() != "")
                    {
                        LblLabReportId_Data.Text = dt.Rows[0]["Lab_Report_ID"].ToString();
                        LblTitle_Data.Text = dt.Rows[0]["Title"].ToString();
                        LblDescription_Data.Text = dt.Rows[0]["Descriptions"].ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtLabReportId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void BtnDelete_serverclick(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Lab_Report";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                new SqlParameter("@Lab_Report_ID" ,Convert.ToInt32( LblLabReportId_Data.Text.Trim()))
                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('Record Deleted Succefully !');", true);
                    //BindOnFirstPageLoad();
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "q1", "alert('Go Back To Lab Report List !');", true);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Record Deleted Succefully !');window.location.href='/CMIS/CMIS_Lab_Reports_List.aspx';", true);
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

        protected void Btn_Edit_serverclick(object sender, EventArgs e)
        {
            try
            {
                if (LblLabReportId_Data.Text != null)
                {
                    Response.Redirect("/CMIS/CMIS_Create_Lab_Reports.aspx?Lab_Report_ID=" + LblLabReportId_Data.Text.Trim(), false);
                }
            }
            catch
            {
                throw;
            }
        }

        public void ClearAll()
        {
            LblLabReportId_Data.Text = string.Empty;
            LblTitle_Data.Text = string.Empty;
            LblDescription_Data.Text = string.Empty;           
        }


    }
}