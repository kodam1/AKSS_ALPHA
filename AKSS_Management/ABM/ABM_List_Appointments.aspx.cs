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
    public partial class ABM_List_Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    ViewState["Session_UserName"] = Session["UserName"].ToString();
                }
                else
                {
                    Response.Redirect("pages_login.aspx");
                }

                if (Request.QueryString["Id"] != null)
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
            //BtnSave.Text = "Submit";
            //GetMaxId();
            Bind_GV();
        }
        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ClientID"].ToString() != "")
                    {
                        // txtClientId.Text = dt.Rows[0]["ClientID"].ToString();
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
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_ALL"),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    gv.DataSource = dt;
                    gv.DataBind();
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
        protected async void BtnExportToExcel_Click(object sender, EventArgs e)
        {
            string spname = "CRUD_ABM_Appointments";
            SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "BIND_EXPORT_TO_EXCEL_DATA")
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

                using (XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "Appointments");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=AppointmentsList.xlsx");
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
        protected async void Txt_GV_Custom_Search_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "Txt_GV_Custom_Search"),
                    new SqlParameter("@Txt_GV_Custom_Search",  Txt_GV_Custom_Search.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
                    {
                        gv.DataSource = dt;
                        gv.DataBind();

                        gv.UseAccessibleHeader = true;
                        gv.HeaderRow.TableSection = TableRowSection.TableHeader;

                        //txtClientName.Text = dt.Rows[0]["Client_Name"].ToString();
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientName_TextChanged", "alert('Same Client Name Is Already Exists !');", true);
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
                    Response.Redirect("/ABM/ABM_View_Appointments.aspx?Id=" + id, false);
                }
            }
            else if (e.CommandName == "A_GvBtn_Edit" || e.CommandName == "GvBtn_Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);
                if (id != null)
                {
                    Response.Redirect("/ABM/ABM_Create_Appointments.aspx?Id=" + id, false);
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
                        string spname = "CRUD_ABM_Appointments";
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

    }
}