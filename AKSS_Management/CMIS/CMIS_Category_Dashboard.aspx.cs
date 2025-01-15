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
    public partial class CMIS_Category_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ClientId"] != null)
                {
                    // int ClientId = Convert.ToInt32(Request.QueryString["ClientId"].ToString());
                    //txtClientId.Text = Request.QueryString["ClientId"].ToString();
                    //txtClientId_TextChanged(sender, e);
                }
                else
                {
                    BindOnFirstPageLoad();
                }

            }
        }

        public void BindOnFirstPageLoad()
        {                      
            Bind_Data();
        }

        public async void Bind_Data()
        {
            try
            {
                string spname = "CMIS_Category_Dashboard";
                SqlParameter[] parameters = {
                    new SqlParameter("@FLAG", "GET_ALL"),
                };
                DataSet ds = await CommonUtility.ExecuteStoredProcedureDataSetAsync(spname, parameters);

                if (ds.Tables.Count > 0)
                {
                    //  1.Income
                    if (ds.Tables[0].Rows.Count > 0)
                    { 
                        lblIncome.Text = ds.Tables[0].Rows[0]["Income"].ToString(); //ds.Tables["Income"].Rows[0].ToString();
                    }
                    //  2.Revenue
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        lblRevenue.Text = ds.Tables[1].Rows[0]["Revenue"].ToString(); //ds.Tables["Income"].Rows[0].ToString();
                    }
                    //  3.Appointments
                    if (ds.Tables[2].Rows.Count > 0)
                    {
                        lblAppointments.Text = ds.Tables[2].Rows[0]["Appointments"].ToString(); //ds.Tables["Income"].Rows[0].ToString();
                    }
                    //  4.NewPatients
                    if (ds.Tables[3].Rows.Count > 0)
                    {
                        lblNewPatients.Text = ds.Tables[3].Rows[0]["NewPatients"].ToString(); //ds.Tables["Income"].Rows[0].ToString();
                    }
                    //  5.Bills_Expenses
                    if (ds.Tables[4].Rows.Count > 0)
                    {
                        lblBilling_Expenses.Text = ds.Tables[4].Rows[0]["Bills_Expenses"].ToString(); //ds.Tables["Income"].Rows[0].ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_Data", "alert('Data Not Present !');", true);
                    lblIncome.Text = string.Empty;
                    lblRevenue.Text = string.Empty;
                    lblAppointments.Text = string.Empty;
                    lblNewPatients.Text = string.Empty;
                    lblBilling_Expenses.Text = string.Empty;
                }
            }
            catch
            {
                throw;
            }
        }




    }
}