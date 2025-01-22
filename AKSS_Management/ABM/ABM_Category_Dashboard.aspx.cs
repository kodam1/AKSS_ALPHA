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

namespace AKSS_Management.ABM
{
    public partial class ABM_Category_Dashboard : System.Web.UI.Page
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
                string spname = "ABM_Category_Dashboard";
                SqlParameter[] parameters = {
                    new SqlParameter("@FLAG", "GET_ALL"),
                };
                DataSet ds = await CommonUtility.ExecuteStoredProcedureDataSetAsync(spname, parameters);

                if (ds.Tables.Count > 0)
                {
                    //  1.Appointments_Id
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        LblAppointments_Id.Text = ds.Tables[0].Rows[0]["Id"].ToString();
                    }
                    //  2.Dr_Id
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        lblDoctorMaster.Text = ds.Tables[1].Rows[0]["Dr_Id"].ToString();
                    }
                    //  3.Chemist_Id
                    if (ds.Tables[2].Rows.Count > 0)
                    {
                        lblChemistMaster.Text = ds.Tables[2].Rows[0]["Chemist_Id"].ToString();
                    }
                    //  4.Stockist_Id
                    if (ds.Tables[3].Rows.Count > 0)
                    {
                        lblStockistMaster.Text = ds.Tables[3].Rows[0]["Stockist_Id"].ToString();
                    }
                    //  5.Bills_Expenses
                    //if (ds.Tables[4].Rows.Count > 0)
                    //{
                    //    lblBilling_Expenses.Text = ds.Tables[4].Rows[0]["Bills_Expenses"].ToString(); 
                    //}
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