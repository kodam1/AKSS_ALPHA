using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKSS_Management.AKodam_Management
{
    public partial class AKSS_Code : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOnFirstPageLoad();               
            }
        }

        public void BindOnFirstPageLoad()
        {
            BtnDBA_Save.Text = "Submit";
            
        }
      
        //##########    DEVELOPER   ################
        protected async void BtnDeveloperSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string spname = "AKSS_CODE";

                SqlParameter[] parameters = {
                    new SqlParameter("@TableName", TxtDeveloperTableName.Text.Trim()),
                    new SqlParameter("@SQL_Developer", "DEVELOPER"),
                    new SqlParameter("@SQL_Developer_DdlDeveloperPageFunction", DdlDeveloperPageFunction.SelectedValue.Trim()),
                    new SqlParameter("@SQL_Developer_DdlDeveloperGVFunctionality", DdlDeveloperGVFunctionality.SelectedValue.Trim()),
                    //@TableName NVARCHAR(MAX) = NULL,
                    //@SQL_Flag NVARCHAR(MAX) = NULL,
                    //@SQL_SubFlag NVARCHAR(MAX) = NULL,
                    //@SQL_Developer NVARCHAR(MAX) = NULL,
                    //@SQL_DBA NVARCHAR(MAX) = NULL,
                    //@SQL_Designer NVARCHAR(MAX) = NULL,
                    //@SQL_Developer_DdlDeveloperPageFunction NVARCHAR(MAX) = NULL,
                    //@SQL_Developer_DdlDeveloperGVFunctionality NVARCHAR(MAX) = NULL,
                    //@SQL_Developer_DdlDeveloperCSharpLogic NVARCHAR(MAX) = NULL,
                    //@SQL_Developer_DdlDeveloperStringFunction NVARCHAR(MAX) = NULL,
                    //@SQL_Developer_DdlDeveloperMathFunciton NVARCHAR(MAX) = NULL,
                    //@SQL_Developer_DdlDeveloperDateFunciton NVARCHAR(MAX) = NULL
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
                string result = "";

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Result"].ToString() != "")
                    {                        
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            result += dt.Rows[i]["Result"].ToString();
                        }
                        
                        //TxtareaDeveloper.InnerText = dt.Rows[0]["Result"].ToString();
                        //TxtareaDeveloper.InnerHtml = dt.Rows[0]["Result"].ToString();
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "a1", "alert('Data Fetch Successfully !');", true);
                    }
                    TxtDeveloperResult.Text = result; //dt.Rows[0]["Result"].ToString();
                    PResult.InnerText = result; //dt.Rows[0]["Result"].ToString();

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "a2", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected void BtnDeveloperReset_Click(object sender, EventArgs e)
        {
            ClearAll();
        }
        
        //##########    DBA   ################
        protected async void BtnDBA_Save_Click(object sender, EventArgs e)
        {

            try
            {
                string spname = "AKSS_CODE";

                SqlParameter[] parameters = {                    
                    //new SqlParameter("@CRUD_Action", "SP"),
                    new SqlParameter("@TableName", TxtDBATableName.Text.Trim()),
                    new SqlParameter("@SQL_DBA", "DBA"),
                    //new SqlParameter("@SQL_Flag", Convert.ToInt32( txtUserId.Text.Trim())),
                    //new SqlParameter("@SQL_SubFlag", Convert.ToInt32( txtUserId.Text.Trim())),
                    //new SqlParameter("@SQL_Developer", Convert.ToInt32( txtUserId.Text.Trim())),
                    //new SqlParameter("@SQL_DBA", Convert.ToInt32( txtUserId.Text.Trim())),
                    //new SqlParameter("@SQL_Designer", Convert.ToInt32( txtUserId.Text.Trim())),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                //if (dt.Rows.Count > 0)
                //{
                //    if (dt.Rows[0]["Result"].ToString() != "")
                //    {
                //        TxtResult.Text = dt.Rows[0]["Result"].ToString();
                //        PResult.InnerText = dt.Rows[0]["Result"].ToString();
                //        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "a1", "alert('Data Fetch Successfully !');", true);
                //    }
                //}
                string result = "";

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Result"].ToString() != "")
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            result += dt.Rows[i]["Result"].ToString();
                        }

                        //TxtareaDeveloper.InnerText = dt.Rows[0]["Result"].ToString();
                        //TxtareaDeveloper.InnerHtml = dt.Rows[0]["Result"].ToString();
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "a1", "alert('Data Fetch Successfully !');", true);
                    }
                    TxtDBAResult.Text = result; //dt.Rows[0]["Result"].ToString();
                    PResult.InnerText = result; //dt.Rows[0]["Result"].ToString();

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "a2", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected void BtnDBA_Reset_Click(object sender, EventArgs e)
        {
            ClearAll();
        }

        public void ClearAll()
        {
            TxtDBATableName.Text = string.Empty;
            TxtDBAResult.Text = string.Empty;

            DdlDBACategory.SelectedIndex = 0;
            DdlDBACategory.SelectedIndex = 0;

            //Developer Tabl Controls
            TxtDeveloperTableName.Text = string.Empty;
            TxtDeveloperResult.Text = string.Empty;
            //TxtareaDeveloper.InnerText = string.Empty;

            DdlDeveloperPageFunction.SelectedIndex = 0;
            DdlDeveloperGVFunctionality.SelectedIndex = 0;
            DdlDeveloperCSharpLogic.SelectedIndex = 0;
            DdlDeveloperStringFunction.SelectedIndex = 0;
            DdlDeveloperMathFunciton.SelectedIndex = 0;
            DdlDeveloperDateFunciton.SelectedIndex = 0;


        }

    }
}