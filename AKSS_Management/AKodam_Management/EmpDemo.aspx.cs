
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
    public partial class EmpDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ClientId"] != null)
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
            Bind_GV();
        }

        public async void Bind_GV()
        {
            try
            {
                string spname = "CRUD_EmpDemo";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "GET_ALL"),
            };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    GridView1.UseAccessibleHeader = true;
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_GV", "alert('Data Not Present !');", true);
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
            }
            catch
            {
                throw;
            }
        }

        //protected void GridView1_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
        //        e.Row.Attributes["style"] = "cursor:pointer";
        //    }
        //}

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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow selectedRow = GridView1.SelectedRow;
            //if (selectedRow != null)
            //{
            //    lblMessage.Text = "Selected Employee: " + selectedRow.Cells[0].Text + ", " + selectedRow.Cells[1].Text;
            //}

            int index = GridView1.SelectedRow.RowIndex;
            string id = GridView1.SelectedRow.Cells[0].Text;
            string name = GridView1.SelectedRow.Cells[1].Text;
            string role = GridView1.SelectedRow.Cells[2].Text;
            string salary = GridView1.SelectedRow.Cells[3].Text;
            string message = "Row Index: " + index + "\\n id: " + id + "\\n name: " + name + "\\n role: " + role + "\\n salary" +salary ;
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }
         
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind_GV();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                // Delete the row from the database
                // Your deletion logic here

                //lblMessage.Text = "Row deleted successfully!";
                //BindGridView(); // Refresh GridView after deletion
            }
        }


    }
}