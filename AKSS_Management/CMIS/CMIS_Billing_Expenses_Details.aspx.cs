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
    public partial class CMIS_Billing_Expenses_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Billing_Expenses_ID"] != null)
                {
                    LblBillingExpensesID_Data.Text = Request.QueryString["Billing_Expenses_ID"].ToString();
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
            // BtnSave.Text = "Submit";                      
        }

        protected async void txtBillingExpensesId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Billing_Expenses";                
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Billing_Expenses_ID", Convert.ToInt32( LblBillingExpensesID_Data.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Billing_Expenses_ID"].ToString() != "")
                    {
                        //  txtBillingExpensesId.Text = dt.Rows[0]["Billing_Expenses_ID"].ToString();
                        LblBillingPartyNameOrExpenses_Data.Text = dt.Rows[0]["Billing_Party_Name_Or_Expenses"].ToString();
                        LblAmount_Data.Text = dt.Rows[0]["Amount"].ToString();
                        LblDate_Data.Text = dt.Rows[0]["Date"].ToString();
                        LblNotes_Data.Text = dt.Rows[0]["Notes"].ToString();
                    }
                }
                else
                {                    
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtBillingExpensesId_TextChanged", "alert('Data Not Present !');", true);
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
                string spname = "CRUD_CMIS_Create_Billing_Expenses";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                new SqlParameter("@Billing_Expenses_ID" ,Convert.ToInt32( LblBillingExpensesID_Data.Text.Trim()))
                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('Record Deleted Succefully !');", true);
                    //BindOnFirstPageLoad();
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "q1", "alert('Go Back To Billing/Expenses List !');", true);

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Record Deleted Succefully !');window.location.href='/CMIS/CMIS_Billing_Expenses_List.aspx';", true);
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
                if (LblBillingExpensesID_Data.Text != null)
                {
                    Response.Redirect("/CMIS/CMIS_Create_Billing_Expenses.aspx?Billing_Expenses_ID=" + LblBillingExpensesID_Data.Text.Trim(), false);
                }
            }
            catch
            {
                throw;
            }
        }

        public void ClearAll()
        {
            LblBillingExpensesID_Data.Text = string.Empty;
            LblBillingPartyNameOrExpenses_Data.Text = string.Empty;
            LblAmount_Data.Text = string.Empty;
            LblDate_Data.Text = string.Empty;
            LblNotes_Data.Text = string.Empty;
        }

    }
}