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
    public partial class AKSS_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    ViewState["Session_UserName"] = Session["UserName"].ToString();

                    if (Session["Role"] != null)
                    {
                        ViewState["Role"] = Session["Role"].ToString();

                        if (ViewState["Role"].ToString() == "Admin")
                        {
                            txtID.ReadOnly = false;
                            BtnExportToExcel.Visible = true;

                            PnlGV.Visible = true;


                        }
                    }                   
                }
                else
                {
                    Response.Redirect("pages_login.aspx");
                }

                if (Request.QueryString["Id"] != null)
                {
                    // int ClientId = Convert.ToInt32(Request.QueryString["ClientId"].ToString());
                    txtID.Text = Request.QueryString["Id"].ToString();
                    txtID_TextChanged(sender, e);
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
            Bind_GV();
        }

        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_AKSS_Profile";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
                    {
                        txtID.Text = dt.Rows[0]["Id"].ToString();
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
       
        public async void Bind_GV()
        {
            try
            {
                string spname = "CRUD_AKSS_Profile";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_ALL"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    gv.DataSource = dt;
                    gv.DataBind();

                    gv.UseAccessibleHeader = true;
                    gv.HeaderRow.TableSection = TableRowSection.TableHeader;

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_GV", "alert('Data Not Present !');", true);
                    gv.DataSource = null;
                    gv.DataBind();
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtID_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_AKSS_Profile";
                BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Id", Convert.ToInt32( txtID.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
                    {                        
                        txtID.Text = dt.Rows[0]["Id"].ToString();
                        txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                        txtDesignation.Text = dt.Rows[0]["Designation"].ToString();
                        TxtTinymceEditor.InnerText = dt.Rows[0]["Profile_Data"].ToString();

                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["CreatedDate"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["CreatedBy"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedDate"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedBy"].ToString();
                      //  CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["IsActive"].ToString();

                        if (Convert.ToBoolean(dt.Rows[0]["IsActive"]) == true)
                        {
                            chkIsActive.Checked = true;
                        }
                        else
                        {
                            chkIsActive.Checked = false;
                        }

                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtID_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtFullName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_AKSS_Profile";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_FullName"),
                    new SqlParameter("@FullName",  txtFullName.Text.Trim())
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
                    {
                        txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtFullName_TextChanged", "alert('Same Full Name Is Already Exists !');", true);
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtID_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> CheckIDExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_AKSS_Profile";
                SqlParameter[] parameters = {
                     new SqlParameter("@CRUD_Action", "CHECK_Id_EXISTS"),
                     new SqlParameter("@Id", Convert.ToInt32( txtID.Text.Trim())),
 		            //new SqlParameter("@Client_Name", txtFullName.Text.Trim())
 	            };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
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
            Task<bool> ClientExist = CheckIDExistOrNot();

            try
            {
                string spname = "CRUD_AKSS_Profile";
                string CRUD_Action = string.Empty;
                string CreatedBy = string.Empty;
                string ModifiedBy = string.Empty;

                if (await ClientExist != true)
                {
                    CRUD_Action = "CREATE";
                    CreatedBy = ViewState["Session_UserName"].ToString(); // session username
                }
                else
                {
                    CRUD_Action = "UPDATE";
                    ModifiedBy = ViewState["Session_UserName"].ToString(); // session username
                }

                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", CRUD_Action),

                new SqlParameter("@Id" , Convert.ToInt32( txtID.Text.Trim())),
                new SqlParameter("@FullName" , txtFullName.Text.Trim()),
                new SqlParameter("@Designation" , txtDesignation.Text.Trim()),
                new SqlParameter("@Profile_Data" , TxtTinymceEditor.InnerText.Trim()),
               // new SqlParameter("@CreatedDate" , "CreatedDate"),
                new SqlParameter("@CreatedBy" , CreatedBy),
               // new SqlParameter("@ModifiedDate" , "ModifiedDate"),
                new SqlParameter("@ModifiedBy" , ModifiedBy),
                new SqlParameter("@IsActive" , chkIsActive.Checked ? true : false)

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
                string spname = "CRUD_AKSS_Profile";
                SqlParameter[] parameters = {

                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                 
		        new SqlParameter("@Id" ,Convert.ToInt32(txtID.Text.Trim()))

                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('Record Deleted Succefully !');", true);
                    ClearAll();
                    BindOnFirstPageLoad();
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

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            ClearAll();
            BindOnFirstPageLoad();
        }

        protected async void BtnExportToExcel_Click(object sender, EventArgs e)
        {
            string spname = "CRUD_AKSS_Profile";
            SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "GET_ALL")
            };

            DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

            if (dt.Rows.Count > 0)
            {                
                using (XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "Profile");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=ProfileList.xlsx");
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


        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            // Example: Modify row attributes during row creation
            if (e.Row.RowType == DataControlRowType.DataRow)
            {              
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected async void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select" || e.CommandName == "GvBtn_View")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);

                if (id != null)
                {

                    txtID.Text = id.ToString();
                    txtID_TextChanged(sender, e);

                    // Response.Redirect("/ABM/ABM_Master_Chemist_View.aspx?Chemist_Id=" + id, false);
                }
            }
            else if (e.CommandName == "A_GvBtn_Edit" || e.CommandName == "GvBtn_Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);
                if (id != null)
                {
                    txtID.Text = id.ToString();
                    txtID_TextChanged(sender, e);

                    //Response.Redirect("/ABM/ABM_Master_Chemist_Create.aspx?Chemist_Id=" + id, false);
                }
            }
            else if (e.CommandName == "A_GvBtn_Delete" || e.CommandName == "GvBtn_Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);
                if (id != null)
                {
                    try
                    {
                        string spname = "CRUD_AKSS_Profile";
                        SqlParameter[] parameters = {
                        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                        new SqlParameter("@Id" , Convert.ToInt32(id))
                        };

                        int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                        if (i > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('Record Deleted Succefully !');", true);
                            BindOnFirstPageLoad();
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
            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }

        public void ClearAll()
        {
            txtID.Text = string.Empty;
            txtFullName.Text = string.Empty;
            txtDesignation.Text = string.Empty;
            TxtTinymceEditor.InnerText = string.Empty;
            chkIsActive.Checked = false;

        }

    }
}