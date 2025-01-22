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

namespace AKSS_Management
{
    public partial class pages_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ClientId"] != null)
                {
                    // int ClientId = Convert.ToInt32(Request.QueryString["ClientId"].ToString());                   
                }               
            }
        }
       
        public async Task<bool> CheckUserName_Email_IsAreadyExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_UserMaster";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_USERNAME_AND_EMAIL_EXISTS"),
                    new SqlParameter("@UserName", TxtUsername.Text.Trim()),
 		            new SqlParameter("@Email", TxtEmail.Text.Trim())
 	            };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["UserId"].ToString() != "")
                    {
                        user_exists_bool = true;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckUserName_Email_IsAreadyExistOrNot", "alert('Same UserName And Email Is Already Exists ! \\nKindly Try Again With Different Username And Email ID!');", true);
                        ClearAll();
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

        protected async void BtnOnlySave_Click(object sender, EventArgs e)
        {
            Task<bool> UserExist = CheckUserName_Email_IsAreadyExistOrNot();

            try
            {
                string spname = "CRUD_UserMaster";
                string CRUD_Action = string.Empty;
                string CreatedBy = string.Empty;
                string ModifiedBy = string.Empty;


                if (await UserExist != true)
                {
                    CRUD_Action = "CREATE";
                    CreatedBy = ""; // session username
                }
                else
                {                   
                    CRUD_Action = "UPDATE";
                    ModifiedBy = ""; // session username
                }

                CRUD_Action = "CREATE";
                CreatedBy = ""; // session username

                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", CRUD_Action),               
                new SqlParameter("@UserName" , TxtUsername.Text.Trim()),
                new SqlParameter("@Email" , TxtEmail.Text.Trim()),
                new SqlParameter("@PasswordHash" , CommonUtility.Encode(TxtPassword.Text.Trim())),
                new SqlParameter("@FullName" ,  TxtFullName.Text.Trim()),
                new SqlParameter("@Role" ,  "User"),
                new SqlParameter("@IsActive",   true)

                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert('Registered Succefully !');", true);
                    //Response.Redirect("/pages-login.aspx");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Registered Succefully !');window.location.href='/pages-login.aspx';", true);
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

        public void ClearAll()
        {
            TxtFullName.Text = string.Empty;
            TxtUsername.Text = string.Empty;
            TxtEmail.Text = string.Empty;
            TxtPassword.Text = string.Empty;                   
        }


    }
}