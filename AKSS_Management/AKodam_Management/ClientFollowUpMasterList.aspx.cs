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
    public partial class ClientFollowUpMasterList : System.Web.UI.Page
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
            Bind_gvClientFollowUpMaster();
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

                using (XLWorkbook wb = new XLWorkbook())
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

        protected void gvClientFollowUpMaster_RowCreated(object sender, GridViewRowEventArgs e)
        {
            // Example: Modify row attributes during row creation
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='lightgray';";
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            }
        }

        protected void gvClientFollowUpMaster_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               // e.Row.Attributes.Add("onmouseover", this.originalstyle = this.style.backgroundColor; this.style.backgroundColor = '#0071b6'; this.style.color = 'White'");  
               //e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;this.style.color=this.originalstyle;");
               // e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvClientFollowUpMaster, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvClientFollowUpMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(gvClientFollowUpMaster.DataKeys[rowIndex].Value);

                // Delete the row from the database
                // Your deletion logic here

                lblMessage.Text = "Row deleted successfully!";
                Bind_gvClientFollowUpMaster(); // Refresh GridView after deletion
            }
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? ClientId = Convert.ToInt32(gvClientFollowUpMaster.DataKeys[rowIndex].Value);

                if (ClientId != null)
                {
                    Response.Redirect("/AKodam_Management/ClientFollowUpMaster.aspx?ClientId=" + ClientId);
                }

                //// Delete the row from the database
                //// Your deletion logic here

                //lblMessage.Text = "Row deleted successfully!";
                //Bind_gvClientFollowUpMaster(); // Refresh GridView after deletion
            }
        }
        protected void gvClientFollowUpMaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Accessing BoundField Column.
            string ClientId = gvClientFollowUpMaster.SelectedRow.Cells[0].Text;

            //Accessing TemplateField Column controls.
            // string country = (gvClientFollowUpMaster.SelectedRow.FindControl("lblCountry") as Label).Text;

            // lblValues.Text = "<b>Name:</b> " + name + " <b>Country:</b> " + country;

           

            //GridViewRow selectedRow = gvClientFollowUpMaster.SelectedRow;
            //if (selectedRow != null)
            //{

            //    lblMessage.Text = "Selected Employee: " + selectedRow.Cells[0].Text + ", " + selectedRow.Cells[1].Text;
            //}
        }

        protected void gvClientFollowUpMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClientFollowUpMaster.PageIndex = e.NewPageIndex;
            Bind_gvClientFollowUpMaster();
        }

    }
}