using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Collections.Specialized.BitVector32;
using System.Configuration;
 

namespace AKSS_Management.AdminPanel
{
    public partial class UserMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOnFirstPageLoad();
                txtPassword.ToolTip = txtPassword.Text;
            }
        }

        public void BindOnFirstPageLoad()
        {
            BtnSave.Text = "Submit";
            GetMaxId();
            Bind_gvUserMaster();
        }

        public async void Bind_gvUserMaster()
        {
            try
            {
                string spname = "CRUD_UserMaster";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_ALL"),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    gvUserMaster.DataSource = dt;
                    gvUserMaster.DataBind();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_gvUserMaster", "alert('Data Not Present !');", true);
                    gvUserMaster.DataSource = null;
                    gvUserMaster.DataBind();
                }
            }
            catch
            {
                throw;
            }
        }
        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_UserMaster";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),                    
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["UserId"].ToString() != "")
                    {
                        txtUserId.Text = dt.Rows[0]["UserId"].ToString();
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

        protected async void txtUserId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_UserMaster";
                BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@UserId", Convert.ToInt32( txtUserId.Text.Trim()))
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["UserId"].ToString() != "")
                    {                       
                       // txtUserId.Text = dt.Rows[0]["UserId"].ToString();
                        txtUserName.Text = dt.Rows[0]["UserName"].ToString();
                        txtEmail.Text = dt.Rows[0]["Email"].ToString();
                        txtPassword.Text = CommonUtility.Decode(dt.Rows[0]["PasswordHash"].ToString());
                        txtPassword.ToolTip = CommonUtility.Decode(dt.Rows[0]["PasswordHash"].ToString());
                        txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                        ddlRole.SelectedValue = dt.Rows[0]["Role"].ToString();
                        txtPhoneNumber.Text = dt.Rows[0]["PhoneNumber"].ToString();
                        if (Convert.ToBoolean( dt.Rows[0]["UserId"]) == true)
                        {
                            chkIsActive.Checked = true;
                        }
                        else
                        {
                            chkIsActive.Checked = false;
                        }
                        //chkIsActive.Checked = dt.Rows[0]["UserId"].ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtUserId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> CheckUserExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_UserMaster";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_USER_EXISTS"),
                    new SqlParameter("@UserId", Convert.ToInt32( txtUserId.Text.Trim())),
                    new SqlParameter("@UserName", txtUserName.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["UserId"].ToString() != "")
                    {
                        // txtUserId.Text = dt.Rows[0]["UserId"].ToString();
                       // txtUserName.Text = dt.Rows[0]["UserName"].ToString();
                        //txtEmail.Text = dt.Rows[0]["Email"].ToString();
                        //txtPassword.Text = CommonUtility.Decode(dt.Rows[0]["PasswordHash"].ToString());
                        //txtPassword.ToolTip = CommonUtility.Decode(dt.Rows[0]["PasswordHash"].ToString());
                        //txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                        //ddlRole.SelectedValue = dt.Rows[0]["Role"].ToString();
                        //txtPhoneNumber.Text = dt.Rows[0]["PhoneNumber"].ToString();
                        //if (Convert.ToBoolean(dt.Rows[0]["UserId"]) == true)
                        //{
                        //    chkIsActive.Checked = true;
                        //}
                        //else
                        //{
                        //    chkIsActive.Checked = false;
                        //}
                        //chkIsActive.Checked = dt.Rows[0]["UserId"].ToString();

                        user_exists_bool = true;

                    }
                }
                else
                {                    
                   // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckUserExistOrNot", "alert('Data Not Present !');", true);
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

            //string plainTextPassword = //"mySecurePassword";
            //string encodedPassword = CommonUtility.Encode(plainTextPassword);
            //Console.WriteLine($"Encoded Password: {encodedPassword}");

            //string encodedPassword = "bXlTZWN1cmVQYXNzd29yZA=="; // Example Base64 encoded string
            //string decodedPassword = CommonUtility.Decode(encodedPassword);
            //Console.WriteLine($"Decoded Password: {decodedPassword}");

            Task<bool> UserExist = CheckUserExistOrNot();
            
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

                SqlParameter[] parameters = {
                      
                new SqlParameter("@CRUD_Action", CRUD_Action),
                        
                new SqlParameter("@UserId", Convert.ToInt32( txtUserId.Text.Trim())),
                new SqlParameter("@UserName",  txtUserName.Text.Trim() ),
                new SqlParameter("@Email", txtEmail.Text.Trim()),
                new SqlParameter("@PasswordHash", CommonUtility.Encode(txtPassword.Text.Trim())),
                new SqlParameter("@FullName", txtFullName.Text.Trim()),
                new SqlParameter("@Role", ddlRole.SelectedValue.Trim()),
                new SqlParameter("@PhoneNumber", txtPhoneNumber.Text.Trim()),
                new SqlParameter("@CreatedBy", CreatedBy),
                new SqlParameter("@ModifiedBy", ModifiedBy),
                new SqlParameter("@IsActive",  chkIsActive.Checked == true ? true : false)

                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);
                
                if (i > 0)
                {
                    if (await UserExist != true)
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
        
        protected void BtnReset_Click(object sender, EventArgs e)
        {

            ClearAll();
            BindOnFirstPageLoad();
        }

        public void ClearAll()
        {
            txtUserId.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtFullName.Text = string.Empty;
            ddlRole.SelectedIndex = 0;
            txtPhoneNumber.Text = string.Empty;                                    
            chkIsActive.Checked = false;
        }

        protected async void BtnDelete_Click(object sender, EventArgs e)
        {           
            try
            {
                string spname = "CRUD_UserMaster";
                SqlParameter[] parameters = {

                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),

                new SqlParameter("@UserId", Convert.ToInt32( txtUserId.Text.Trim())),
                
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

        protected async void BtnExportToExcel_Click(object sender, EventArgs e)
        {
            string spname = "CRUD_UserMaster";            
            SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_ALL")                    
                };
            DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

            if (dt.Rows.Count > 0)
            {
               // dt = city.GetAllCity();//your datatable
                string attachment = "attachment; filename=UserMaster.xls";
                Response.ClearContent();
                Response.AddHeader("content-disposition", attachment);
                Response.ContentType = "application/vnd.ms-excel";
                string tab = "";
                foreach (DataColumn dc in dt.Columns)
                {
                    Response.Write(tab + dc.ColumnName);
                    tab = "\t";
                }
                Response.Write("\n");
                int i;
                foreach (DataRow dr in dt.Rows)
                {
                    tab = "";
                    for (i = 0; i < dt.Columns.Count; i++)
                    {
                        Response.Write(tab + dr[i].ToString());
                        tab = "\t";
                    }
                    Response.Write("\n");
                }
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "UserMaster" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            gvUserMaster.GridLines = GridLines.Both;
            gvUserMaster.HeaderStyle.Font.Bold = true;
            gvUserMaster.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void btnSent_Click(object sender, EventArgs e)
        {
            // use the API URL here  
            string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=YourUserName:YourPassword&senderID=YourSenderID&    receipientno=1234567890&msgtxt=This is a test from mVaayoo API&state=4";
            // Create a request object  
            WebRequest request = HttpWebRequest.Create(strUrl);
            // Get the response back  
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream s = (Stream)response.GetResponseStream();
            StreamReader readStream = new StreamReader(s);
            string dataString = readStream.ReadToEnd();
            response.Close();
            s.Close();
            readStream.Close();
        }

    }
}