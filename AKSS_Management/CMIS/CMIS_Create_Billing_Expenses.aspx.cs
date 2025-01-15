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
    public partial class CMIS_Create_Billing_Expenses : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Billing_Expenses_ID"] != null)
                {
                    // int ClientId = Convert.ToInt32(Request.QueryString["ClientId"].ToString());
                    txtBillingExpensesId.Text = Request.QueryString["Billing_Expenses_ID"].ToString();
                    txtBillingExpensesId_TextChanged(sender, e);
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
            Lblh5_Title.Text = "Create Billing Expenses";
            GetMaxId();           
        }

        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Billing_Expenses";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Billing_Expenses_ID"].ToString() != "")
                    {
                        txtBillingExpensesId.Text = dt.Rows[0]["Billing_Expenses_ID"].ToString();
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

        protected async void txtBillingExpensesId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Billing_Expenses";
                BtnSave.Text = "Modify";
                Lblh5_Title.Text = "Modify Billing Expenses";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Billing_Expenses_ID", Convert.ToInt32( txtBillingExpensesId.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Billing_Expenses_ID"].ToString() != "")
                    {                        
                        txtBillingExpensesId.Text = dt.Rows[0]["Billing_Expenses_ID"].ToString();
                        txtBillingPartyNameOrExpenses.Text = dt.Rows[0]["Billing_Party_Name_Or_Expenses"].ToString();
                        txtAmount.Text = dt.Rows[0]["Amount"].ToString();
                        txtDate.Text = dt.Rows[0]["Date"].ToString();
                        txtNotes.Text = dt.Rows[0]["Notes"].ToString();                                             
                    }
                }
                else
                {
                    BtnReset_Click(sender, e);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtBillingExpensesId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtBillingPartyNameOrExpenses_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Billing_Expenses";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_Billing_Party_Name_Or_Expenses"),
                    new SqlParameter("@Billing_Party_Name_Or_Expenses",  txtBillingPartyNameOrExpenses.Text.Trim())
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Billing_Expenses_ID"].ToString() != "")
                    {
                        txtBillingExpensesId.Text = dt.Rows[0]["Billing_Expenses_ID"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtBillingPartyNameOrExpenses_TextChanged", "alert('Same Client Name Is Already Exists !');", true);
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> CheckBillingNameExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_CMIS_Create_Billing_Expenses";
                SqlParameter[] parameters = {
                     new SqlParameter("@CRUD_Action", "CHECK_ID_EXISTS"),
                     new SqlParameter("@Billing_Expenses_ID", Convert.ToInt32( txtBillingExpensesId.Text.Trim())),
 		            //new SqlParameter("@Client_Name", txtClientName.Text.Trim())
 	            };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Billing_Expenses_ID"].ToString() != "")
                    {
                        user_exists_bool = true;
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckBillingNameExistOrNot", "alert('Data Not Present !');", true);
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
            Task<bool> ClientExist = CheckBillingNameExistOrNot();

            try
            {
                string spname = "CRUD_CMIS_Create_Billing_Expenses";
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

                new SqlParameter("@Billing_Expenses_ID" , txtBillingExpensesId.Text.Trim()),
                new SqlParameter("@Billing_Party_Name_Or_Expenses" , txtBillingPartyNameOrExpenses.Text.Trim()),
                new SqlParameter("@Amount" , txtAmount.Text.Trim()),
                new SqlParameter("@Date" , txtDate.Text.Trim()),
                new SqlParameter("@Notes" , txtNotes.Text.Trim()),
                new SqlParameter("@CreatedBy" , "CreatedBy"),                
                new SqlParameter("@ModifiedBy" , "ModifiedBy"),                

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
                string spname = "CRUD_CMIS_Create_Billing_Expenses";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
		        new SqlParameter("@Billing_Expenses_ID" , txtBillingExpensesId.Text.Trim())
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
            string spname = "CRUD_CMIS_Create_Billing_Expenses";
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", "GET_ALL")
        };
            DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

            if (dt.Rows.Count > 0)
            {
                // dt = city.GetAllCity();//your datatable
                //string attachment = "attachment; filename=ClientFollowUp.xls";
                //Response.ClearContent();
                //Response.AddHeader("content-disposition", attachment);
                //Response.ContentType = "application/vnd.ms-excel";
                //string tab = "";
                //foreach (DataColumn dc in dt.Columns)
                //{
                //    Response.Write(tab + dc.ColumnName);
                //    tab = "\t";
                //}
                //Response.Write("\n");
                //int i;
                //foreach (DataRow dr in dt.Rows)
                //{
                //    tab = "";
                //    for (i = 0; i < dt.Columns.Count; i++)
                //    {
                //        Response.Write(tab + dr[i].ToString());
                //        tab = "\t";
                //    }
                //    Response.Write("\n");
                //}
                //Response.End();

                using (XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "Billing_Expenses");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=Billing_ExpensesList.xlsx");
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
            txtBillingExpensesId.Text= string.Empty;
            txtBillingPartyNameOrExpenses.Text = string.Empty;
            txtAmount.Text = string.Empty;
            txtDate.Text = string.Empty;
            txtNotes.Text = string.Empty;
        }
    }
}