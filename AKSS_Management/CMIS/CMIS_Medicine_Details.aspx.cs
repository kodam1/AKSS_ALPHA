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
    public partial class CMIS_Medicine_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Medicine_ID"] != null)
                {                   
                    LblMedicineID_Data.Text = Request.QueryString["Medicine_ID"].ToString();
                    LblMedicineID_Data_TextChanged(sender, e);
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

        protected async void LblMedicineID_Data_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Medicine";               
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Medicine_ID", Convert.ToInt32( LblMedicineID_Data.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Medicine_ID"].ToString() != "")
                    {
                        LblMedicineID_Data.Text = dt.Rows[0]["Medicine_ID"].ToString();
                        LblTitle_Data.Text = dt.Rows[0]["Title"].ToString();
                        LblCategory_Data.Text = dt.Rows[0]["Category"].ToString();
                        LblDoseInterval_Data.Text = dt.Rows[0]["Dose_Interval"].ToString();

                        if (Convert.ToBoolean(dt.Rows[0]["Before_Meal"]) == true)
                        {
                            //LblBeforeMeal_Data.Text = "Take medicine before meal";
                            LblBeforeMeal_Data.Text = "before meal";
                        }
                        else
                        {
                            //LblBeforeMeal_Data.Text = "Take medicine after meal";
                            LblBeforeMeal_Data.Text = "after meal";
                        }

                        LblDescriptions_Data.Text = dt.Rows[0]["Descriptions"].ToString();

                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtMedicine_ID_TextChanged", "alert('Data Not Present !');", true);
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
                string spname = "CRUD_CMIS_Create_Medicine";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                new SqlParameter("@Medicine_ID" ,Convert.ToInt32( LblMedicineID_Data.Text.Trim()))
                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('Record Deleted Succefully !');", true);
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "q1", "alert('Go Back To Medicine List !');", true);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Record Deleted Succefully !');window.location.href='/CMIS/CMIS_Medicine_List.aspx';", true);
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
                if (LblMedicineID_Data.Text != null)
                {
                    Response.Redirect("/CMIS/CMIS_Create_Medicine.aspx?Medicine_ID=" + LblMedicineID_Data.Text.Trim(), false);
                }
            }
            catch
            {
                throw;
            }
        }

        public void ClearAll()
        {
            LblMedicineID_Data.Text = string.Empty;
            LblTitle_Data.Text = string.Empty;
            LblCategory_Data.Text = string.Empty;
            LblDoseInterval_Data.Text = string.Empty;
            LblMedicineID_Data.Text = string.Empty;
            LblDescriptions_Data.Text = string.Empty;

        }



    }
}