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

namespace AKSS_Management.CMIS
{
    public partial class CMIS_Create_Lab_Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Lab_Report_ID"] != null)
                {                    
                    txtLabReportId.Text = Request.QueryString["Lab_Report_ID"].ToString();
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
            BtnSave.Text = "Submit";
            Lblh5_Title.Text = "Create Lab Report";
            GetMaxId();           
        }

        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Lab_Report";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Lab_Report_ID"].ToString() != "")
                    {
                        txtLabReportId.Text = dt.Rows[0]["Lab_Report_ID"].ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "GetMaxId", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtLabReportId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Lab_Report";
                BtnSave.Text = "Modify";
                Lblh5_Title.Text = "Modify Lab Report";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Lab_Report_ID", Convert.ToInt32( txtLabReportId.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Lab_Report_ID"].ToString() != "")
                    {                        
                        txtLabReportId.Text = dt.Rows[0]["Lab_Report_ID"].ToString();
                        txtTitle.Text = dt.Rows[0]["Title"].ToString();
                        txtDescription.Text = dt.Rows[0]["Descriptions"].ToString();                        
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

        protected async void txtTitle_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Lab_Report";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_Title"),
                    new SqlParameter("@Title",  txtTitle.Text.Trim())
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Lab_Report_ID"].ToString() != "")
                    {
                        txtTitle.Text = dt.Rows[0]["Title"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtTitle_TextChanged", "alert('Same Title Name Is Already Exists !');", true);
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtLabReportId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> CheckClientExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_CMIS_Create_Lab_Report";
                SqlParameter[] parameters = {
                     new SqlParameter("@CRUD_Action", "CHECK_ID_EXISTS"),
                     new SqlParameter("@Lab_Report_ID", Convert.ToInt32( txtLabReportId.Text.Trim())), 		            
 	            };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Lab_Report_ID"].ToString() != "")
                    {
                        user_exists_bool = true;
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckClientExistOrNot", "alert('Data Not Present !');", true);
                    user_exists_bool = false;
                }
                return user_exists_bool;
            }
            catch
            {
                throw;
            }
        }

        protected async void BtnSave_Click(object sender, EventArgs e)
        {
            Task<bool> ClientExist = CheckClientExistOrNot();

            try
            {
                string spname = "CRUD_CMIS_Create_Lab_Report";
                string CRUD_Action = string.Empty;
                string CreatedBy = string.Empty;
                string ModifiedBy = string.Empty;

                if (await ClientExist != true)
                {
                    CRUD_Action = "CREATE";
                    CreatedBy = ""; // session username
                }
                else
                {
                    CRUD_Action = "UPDATE";
                    ModifiedBy = ""; // session username
                }

                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", CRUD_Action),

                new SqlParameter("@Lab_Report_ID" ,txtLabReportId.Text.Trim()),
                new SqlParameter("@Title" , txtTitle.Text.Trim()),
                new SqlParameter("@Descriptions" , txtDescription.Text.Trim()),
                new SqlParameter("@CreatedBy" , "CreatedBy"),
                //new SqlParameter("@CreateDate_Time" , "CreateDate_Time"),
                new SqlParameter("@ModifiedBy" , "ModifiedBy"),
                //new SqlParameter("@ModifiedDate_Time" , "ModifiedDate_Time")

                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    if (await ClientExist != true)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert('Saved Succefully !');", true);
                        ClearAll();
                        BindOnFirstPageLoad();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u1", "alert('Updated Succefully !');", true);
                        ClearAll();
                        BindOnFirstPageLoad();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "e1", "alert('Data Not Saved !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Lab_Report";
                SqlParameter[] parameters = {

                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),                 
		        new SqlParameter("@Lab_Report_ID" , Convert.ToInt32(txtLabReportId.Text.Trim())),
                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('Record Deleted Succefully !');", true);
                    ClearAll();
                    BindOnFirstPageLoad();
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

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            ClearAll();
            BindOnFirstPageLoad();
        }

        protected async void BtnExportToExcel_Click(object sender, EventArgs e)
        {
            string spname = "CRUD_CMIS_Create_Lab_Report";
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", "GET_ALL")
            };
            DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

            if (dt.Rows.Count > 0)
            {               
                using (XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "Lab_Report");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=Lab_Report_List.xlsx");
                    using (MemoryStream MyMemoryStream = new MemoryStream())
                    {
                        wb.SaveAs(MyMemoryStream);
                        MyMemoryStream.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                    }
                }

            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }

        public void ClearAll()
        {
            txtLabReportId.Text = string.Empty;
            txtTitle.Text = string.Empty;
            txtDescription.Text = string.Empty;                        
        }
    }
}