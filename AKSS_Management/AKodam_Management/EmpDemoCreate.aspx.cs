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

namespace AKSS_Management.AKodam_Management
{
    public partial class EmpDemoCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["EmpId"] != null)
                {                   
                    txtEmpId.Text = Request.QueryString["EmpId"].ToString();
                    txtEmpId_TextChanged(sender, e);
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
            GetMaxId();           
        }

        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_EmpDemo";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["id"].ToString() != "")
                    {
                        txtEmpId.Text = dt.Rows[0]["id"].ToString();
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

        protected async void txtEmpId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_EmpDemo";
                BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@id", Convert.ToInt32( txtEmpId.Text.Trim()))
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["id"].ToString() != "")
                    {
                        // txtUserId.Text = dt.Rows[0]["UserId"].ToString();
                        txtEmpName.Text = dt.Rows[0]["name"].ToString();
                        DdlRole.SelectedValue = dt.Rows[0]["role"].ToString();                        
                        txtSalary.Text = dt.Rows[0]["salary"].ToString();                        
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtEmpId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtEmpName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_EmpDemo";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_EMP_NAME"),
                    new SqlParameter("@name",  txtEmpName.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["id"].ToString() != "")
                    {
                        txtEmpName.Text = dt.Rows[0]["name"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtEmpName_TextChanged", "alert('Same Client Name Is Already Exists !');", true);
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

        public async Task<bool> CheckEmpExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_EmpDemo";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_EMP_EXISTS"),
                    new SqlParameter("@id", Convert.ToInt32( txtEmpId.Text.Trim())),
                    //new SqlParameter("@Client_Name", txtClientName.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["id"].ToString() != "")
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
            Task<bool> ClientExist = CheckEmpExistOrNot();

            try
            {
                string spname = "CRUD_EmpDemo";
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
                    new SqlParameter("@id" , Convert.ToInt32(txtEmpId.Text.Trim())),
                    new SqlParameter("@name", txtEmpName.Text.Trim()),
                    new SqlParameter("@role", DdlRole.SelectedValue.Trim()),
                    new SqlParameter("@salary", txtSalary.Text.Trim())                     
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
                string spname = "CRUD_EmpDemo";
                SqlParameter[] parameters = {

                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                new SqlParameter("@id", Convert.ToInt32(txtEmpId.Text.Trim())),
                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert('Record Deleted Succefully !');", true);
                    ClearAll();
                    BindOnFirstPageLoad();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert('Data Not Saved !');", true);
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

        public void ClearAll()
        {
            txtEmpId.Text = string.Empty;
            txtEmpName.Text = string.Empty;           
            DdlRole.SelectedIndex = 0;
            txtSalary.Text = string.Empty;
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }

    }
}