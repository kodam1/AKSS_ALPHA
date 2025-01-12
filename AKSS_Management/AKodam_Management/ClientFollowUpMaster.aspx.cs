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
    public partial class ClientFollowUpMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ClientId"] != null)
                {
                    // int ClientId = Convert.ToInt32(Request.QueryString["ClientId"].ToString());
                    txtClientId.Text = Request.QueryString["ClientId"].ToString();
                    txtClientId_TextChanged(sender, e);
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
            Bind_gvClientFollowUpMaster();
        }

        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_AKM_Mst_Client_Follow_Up";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ClientID"].ToString() != "")
                    {
                        txtClientId.Text = dt.Rows[0]["ClientID"].ToString();
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

        public async void Bind_gvClientFollowUpMaster()
        {
            try
            {
                string spname = "CRUD_AKM_Mst_Client_Follow_Up";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_ALL"),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    gvClientFollowUpMaster.DataSource = dt;
                    gvClientFollowUpMaster.DataBind();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_gvClientFollowUpMaster", "alert('Data Not Present !');", true);
                    gvClientFollowUpMaster.DataSource = null;
                    gvClientFollowUpMaster.DataBind();
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtClientId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_AKM_Mst_Client_Follow_Up";
                BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@ClientID", Convert.ToInt32( txtClientId.Text.Trim()))
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ClientID"].ToString() != "")
                    {
                        // txtUserId.Text = dt.Rows[0]["UserId"].ToString();
                        txtClientName.Text = dt.Rows[0]["Client_Name"].ToString();
                        txtAge.Text = dt.Rows[0]["Client_Age"].ToString();
                        DdlGender.SelectedValue = dt.Rows[0]["Client_Gender"].ToString();
                        txtDOB.Text = dt.Rows[0]["Client_DOB"].ToString();
                        txtDescription.Text = dt.Rows[0]["Client_Description"].ToString();
                        txtCategory.Text = dt.Rows[0]["Category"].ToString();
                        DdlCountry.SelectedValue = dt.Rows[0]["Country"].ToString();
                        DdlState.SelectedValue = dt.Rows[0]["State"].ToString();
                        DdlCity.SelectedValue = dt.Rows[0]["City"].ToString();
                        txtAddress1.Text = dt.Rows[0]["Address1"].ToString();
                        txtAddress2.Text = dt.Rows[0]["Address2"].ToString();
                        txtOpenHours.Text = dt.Rows[0]["Open_Hours"].ToString();
                        txtWebsite.Text = dt.Rows[0]["Website"].ToString();
                        txtDirection.Text = dt.Rows[0]["Direction"].ToString();
                        txtRating.Text = dt.Rows[0]["Ratting"].ToString();
                        txtMobileNumber.Text = dt.Rows[0]["Mobile_No"].ToString();
                        txtTelephoneNumber.Text = dt.Rows[0]["Telephone_No"].ToString();
                        txtEmailId.Text = dt.Rows[0]["Email_Id"].ToString();
                        txtTwitter.Text = dt.Rows[0]["Twitter_Profile"].ToString();
                        txtFacebook.Text = dt.Rows[0]["Facebook_Profile"].ToString();
                        txtInstagram.Text = dt.Rows[0]["Instagram_Profile"].ToString();
                        txtLinkedin.Text = dt.Rows[0]["Linkedin_Profile"].ToString();
                        DdlCallReceived.SelectedValue = dt.Rows[0]["Call_Received"].ToString(); 
                        DdlWhatsApp.SelectedValue = dt.Rows[0]["Whatsapp_Message"].ToString();
                        txtFollowUpDateTime.Text = dt.Rows[0]["Follow_Up_Date_Time"].ToString();
                        txtFollowUpReason.Text = dt.Rows[0]["Follow_Up_Reason"].ToString();
                        txtNewFollowUpDateTime.Text = dt.Rows[0]["New_Follow_Up_Date_Time"].ToString();
                        txtNewFollowUpReason.Text = dt.Rows[0]["New_Follow_Up_Reason"].ToString();
                        txtNotes.Text = dt.Rows[0]["Notes"].ToString();
                                                
                        if (Convert.ToBoolean(dt.Rows[0]["IsActive"]) == true)
                        {
                            ChkActive.Checked = true;
                        }
                        else
                        {
                            ChkActive.Checked = false;
                        }
                        
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtClientName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_AKM_Mst_Client_Follow_Up";                
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_CLIENT_NAME"),
                    new SqlParameter("@Client_Name",  txtClientName.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ClientID"].ToString() != "")
                    {                        
                        txtClientName.Text = dt.Rows[0]["Client_Name"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientName_TextChanged", "alert('Same Client Name Is Already Exists !');", true);
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
        
        public async Task<bool> CheckClientExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_AKM_Mst_Client_Follow_Up";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_CLIENT_EXISTS"),
                    new SqlParameter("@ClientID", Convert.ToInt32( txtClientId.Text.Trim())),
                    //new SqlParameter("@Client_Name", txtClientName.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ClientID"].ToString() != "")
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
            Task<bool> ClientExist = CheckClientExistOrNot();

            try
            {
                string spname = "CRUD_AKM_Mst_Client_Follow_Up";
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
                    new SqlParameter("@ClientID" , Convert.ToInt32(txtClientId.Text.Trim())),
                    new SqlParameter("@Client_Name", txtClientName.Text.Trim()),
                    new SqlParameter("@Client_Age", txtAge.Text.Trim()),
                    new SqlParameter("@Client_Gender", DdlGender.SelectedValue.Trim()),
                    new SqlParameter("@Client_DOB", txtDOB.Text.Trim()),
                    new SqlParameter("@Client_Description", txtDescription.Text.Trim()),
                    new SqlParameter("@Category", txtCategory.Text.Trim()),
                    new SqlParameter("@Country", DdlCountry.SelectedValue.Trim()),
                    new SqlParameter("@State", DdlState.SelectedValue.Trim()),
                    new SqlParameter("@City", DdlCity.SelectedValue.Trim()),
                    new SqlParameter("@Address1", txtAddress1.Text.Trim()),
                    new SqlParameter("@Address2", txtAddress2.Text.Trim()),
                    new SqlParameter("@Open_Hours", txtOpenHours.Text.Trim()),
                    new SqlParameter("@Website", txtWebsite.Text.Trim()),
                    new SqlParameter("@Direction", txtDirection.Text.Trim()),
                    new SqlParameter("@Ratting", txtRating.Text.Trim()),
                    new SqlParameter("@Mobile_No", txtMobileNumber.Text.Trim()),
                    new SqlParameter("@Telephone_No", txtTelephoneNumber.Text.Trim()),
                    new SqlParameter("@Email_Id", txtEmailId.Text.Trim()),
                    new SqlParameter("@Twitter_Profile", txtTwitter.Text.Trim()),
                    new SqlParameter("@Facebook_Profile", txtFacebook.Text.Trim()),
                    new SqlParameter("@Instagram_Profile", txtInstagram.Text.Trim()),
                    new SqlParameter("@Linkedin_Profile", txtLinkedin.Text.Trim()),
                    new SqlParameter("@Call_Received", DdlCallReceived.SelectedValue.Trim()),
                    new SqlParameter("@Whatsapp_Message", DdlWhatsApp.SelectedValue.Trim()),
                    new SqlParameter("@Follow_Up_Date_Time", txtFollowUpDateTime.Text.Trim()),
                    new SqlParameter("@Follow_Up_Reason", txtFollowUpReason.Text.Trim()),
                    new SqlParameter("@New_Follow_Up_Date_Time", txtNewFollowUpDateTime.Text.Trim()),
                    new SqlParameter("@New_Follow_Up_Reason", txtNewFollowUpReason.Text.Trim()),
                    new SqlParameter("Notes", txtNotes.Text.Trim()),
                    new SqlParameter("@IsActive", ChkActive.Checked == true ? true : false),
                   // new SqlParameter("CreatedBy", ""),
                   // new SqlParameter("CreateDate_Time", ""),
                   // new SqlParameter("ModifiedBy", ""),
                   // new SqlParameter("ModifiedDate_Time", "")
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
                string spname = "CRUD_AKM_Mst_Client_Follow_Up";
                SqlParameter[] parameters = {

                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),

                new SqlParameter("@ClientID", Convert.ToInt32(txtClientId.Text.Trim())),

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

        protected async void BtnExportToExcel_Click(object sender, EventArgs e)
        {
            string spname = "CRUD_AKM_Mst_Client_Follow_Up";
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

                using ( XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "ClientFollowUp");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=ClientFollowUpList.xlsx");
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
            txtClientId.Text = string.Empty;
            txtClientName.Text = string.Empty;
            txtAge.Text = string.Empty;
            DdlGender.SelectedIndex = 0;
            txtDOB.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtCategory.Text = string.Empty;
            DdlCountry.SelectedIndex = 0;
            DdlState.SelectedIndex = 0;
            DdlCity.SelectedIndex = 0;
            txtAddress1.Text = string.Empty;
            txtAddress2.Text = string.Empty;
            txtOpenHours.Text = string.Empty;
            txtWebsite.Text = string.Empty;
            txtDirection.Text = string.Empty;
            txtRating.Text = string.Empty;
            txtMobileNumber.Text = string.Empty;
            txtTelephoneNumber.Text = string.Empty;
            txtEmailId.Text = string.Empty;
            txtTwitter.Text = string.Empty;
            txtFacebook.Text = string.Empty;
            txtInstagram.Text = string.Empty;
            txtLinkedin.Text = string.Empty;
            DdlCallReceived.SelectedIndex = 0;
            DdlWhatsApp.SelectedIndex = 0;
            txtFollowUpDateTime.Text = string.Empty;
            txtFollowUpReason.Text = string.Empty;
            txtNewFollowUpDateTime.Text = string.Empty;
            txtNewFollowUpReason.Text = string.Empty;
            txtNotes.Text = string.Empty;
            ChkActive.Checked = false;
        }
    }
}