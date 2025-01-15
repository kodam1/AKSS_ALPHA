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
using DocumentFormat.OpenXml.Office2010.Excel;

namespace AKSS_Management.CMIS
{
    public partial class CMIS_Medicine_List : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Medicine_ID"] != null)
                {
                    //txtPatientId.Text = Request.QueryString["ID"].ToString();
                    //txtPatientId_TextChanged(sender, e);
                }
                else
                {
                    BindOnFirstPageLoad();
                }

            }
        }

        public void BindOnFirstPageLoad()
        {
            Bind_GV();
        }

        public async void Bind_GV()
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Medicine";
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

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            // Example: Modify row attributes during row creation
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                //e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='lightgray';";
                //e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
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
                    Response.Redirect("/CMIS/CMIS_Medicine_Details.aspx?Medicine_ID=" + id, false);
                }
            }
            else if (e.CommandName == "A_GvBtn_Edit" || e.CommandName == "GvBtn_Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);
                if (id != null)
                {
                    Response.Redirect("/CMIS/CMIS_Create_Medicine.aspx?Medicine_ID=" + id, false);
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
                        string spname = "CRUD_CMIS_Create_Medicine";
                        SqlParameter[] parameters = {
                        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                        new SqlParameter("@Medicine_ID" , Convert.ToInt32(id))
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField HfId = (HiddenField)gv.Rows[gv.SelectedIndex].FindControl("HfId");

            if (HfId.Value != null)
            {
                Response.Redirect("/CMIS/CMIS_Create_Medicine.aspx?Medicine_ID=" + HfId.Value);
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }

        protected async void Txt_GV_Custom_Search_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Create_Medicine";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "Txt_GV_Custom_Search"),
                    new SqlParameter("@Txt_GV_Custom_Search",  Txt_GV_Custom_Search.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Medicine_ID"].ToString() != "")
                    {
                        gv.DataSource = dt;
                        gv.DataBind();

                        gv.UseAccessibleHeader = true;
                        gv.HeaderRow.TableSection = TableRowSection.TableHeader;
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

    }
}