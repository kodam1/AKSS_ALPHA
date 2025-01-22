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
    public partial class pages_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {               
                string spname = "CRUD_UserMaster";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_LOGIN_CREDIENTIALS"),
                    new SqlParameter("@UserName", TxtUsername.Text.Trim()),
                    new SqlParameter("@PasswordHash", CommonUtility.Encode(TxtPassword.Text.Trim()))
                 };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["UserId"].ToString() != "")
                    {
                        // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "L1", "alert('Login Successfull !!');", true);
                        // Page.ClientScript.RegisterStartupScript(this.GetType(), "L1", "alert('Login Successfull !!');", true);
                        //  ClientScript.RegisterClientScriptBlock(this.GetType(), "a1", "alert('Login Successfull !!');",true);

                        Session["UserId"] = !string.IsNullOrEmpty(dt.Rows[0]["UserId"].ToString()) ? dt.Rows[0]["UserId"].ToString() : string.Empty;
                        Session["UserName"] = !string.IsNullOrEmpty(dt.Rows[0]["UserName"].ToString()) ? dt.Rows[0]["UserName"].ToString() : string.Empty;
                        Session["Email"] = !string.IsNullOrEmpty(dt.Rows[0]["Email"].ToString()) ? dt.Rows[0]["Email"].ToString() : string.Empty;
                        Session["PasswordHash"] = !string.IsNullOrEmpty(dt.Rows[0]["PasswordHash"].ToString()) ? dt.Rows[0]["PasswordHash"].ToString() : string.Empty;
                        Session["FullName"] = !string.IsNullOrEmpty(dt.Rows[0]["FullName"].ToString()) ? dt.Rows[0]["FullName"].ToString() : string.Empty;
                        Session["Role"] = !string.IsNullOrEmpty(dt.Rows[0]["Role"].ToString()) ? dt.Rows[0]["Role"].ToString() : string.Empty;
                        Session["PhoneNumber"] = !string.IsNullOrEmpty(dt.Rows[0]["PhoneNumber"].ToString()) ? dt.Rows[0]["PhoneNumber"].ToString() : string.Empty;
                        Session["IsActive"] = !string.IsNullOrEmpty(dt.Rows[0]["IsActive"].ToString()) ? dt.Rows[0]["IsActive"].ToString() : string.Empty;

                        string PasswordHash = Session["PasswordHash"].ToString();
                        Session["Decode_PasswordHash"] = CommonUtility.Decode(PasswordHash);

                        if (dt.Rows[0]["Role"].ToString() != "" && dt.Rows[0]["Role"].ToString() == "Admin")
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Login Successfull !!');window.location.href='/Default.aspx';", true);
                        }
                        else if (dt.Rows[0]["Role"].ToString() != "" && dt.Rows[0]["Role"].ToString() == "ABM")
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Login Successfull !!');window.location.href='/DefaultABM.aspx';", true);
                        }
                        else if (dt.Rows[0]["Role"].ToString() != "" && dt.Rows[0]["Role"].ToString() == "User")
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Login Successfull !!');window.location.href='/DefaultCMIS.aspx';", true);
                        }                                 
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Login Successfull !!');window.location.href='/Default.aspx';", true);
                        }

                        //Response.Redirect("/Default.aspx");
                    }
                }
                else
                {
                     ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "L2", "alert('Wrong Username Or Password !\\nKindly Try Again !!');", true);                    
                }               
            }
            catch
            {
                throw;
            }
        }

    }
}