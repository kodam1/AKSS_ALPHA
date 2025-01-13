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
    public partial class CMIS_Patient_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
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
                string spname = "CRUD_CMIS_CREATE_PATIENT";
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
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);
                //Label LblId = (Label)gv.Rows[e.rowIndex].FindControl("LblId");

                if (id != null)
                {
                    Response.Redirect("/CMIS/CMIS_Create_Patient.aspx?ID=" + id,false);
                }

                // Delete the row from the database
                // Your deletion logic here

                //lblMessage.Text = "Row deleted successfully!";
                //BindGridView(); // Refresh GridView after deletion
            }
            else if (e.CommandName == "A_GvBtn_Edit" || e.CommandName == "GvBtn_Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);                
                if (id != null)
                {
                    Response.Redirect("/CMIS/CMIS_Create_Patient.aspx?ID=" + id, false);
                }                
            }
            else if (e.CommandName == "A_GvBtn_Delete" || e.CommandName == "GvBtn_Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);                
                if (id != null)
                {
                    //Response.Redirect("/CMIS/CMIS_Create_Patient.aspx?ID=" + id);
                    try
                    {
                        string spname = "CRUD_CMIS_CREATE_PATIENT";
                        SqlParameter[] parameters = {
                        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                        new SqlParameter("@ID" , Convert.ToInt32(id))
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
            else if (e.CommandName == "A_GvBtn_Create_Appointment" || e.CommandName == "GvBtn_Create_Appointment")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int? id = Convert.ToInt32(gv.DataKeys[rowIndex].Value);
               
                if (id != null)
                {
                    Response.Redirect("/CMIS/CMIS_Appointment.aspx?ID=" + id, false);
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow selectedRow = GridView1.SelectedRow;
            //if (selectedRow != null)
            //{
            //    lblMessage.Text = "Selected Employee: " + selectedRow.Cells[0].Text + ", " + selectedRow.Cells[1].Text;
            //}

            //GridViewRow row = gv.SelectedRow;
            //HiddenField field = GridView1.Rows[e.RowIndex].FindControl("HiddenField1") as HiddenField;
            HiddenField HfId = (HiddenField)gv.Rows[gv.SelectedIndex].FindControl("HfId");

            if (HfId.Value != null)
            {
                Response.Redirect("/CMIS/CMIS_Create_Patient.aspx?ID=" + HfId.Value);
            }

            ////Label id = (Label)gv..FindControl("LblId");
            //Label id = (Label)gv.Rows[e.RowIndex].FindControl("LblId");

            //string id = gv.SelectedRow.Cells[1].Text;
            //string name = gv.SelectedRow.Cells[1].Text;
            //string role = gv.SelectedRow.Cells[2].Text;
            //string salary = gv.SelectedRow.Cells[3].Text;
            //string message = "Row Index: " + index + "\\n id: " + id + "\\n name: " + name + "\\n role: " + role + "\\n salary" + salary;
            // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);

            //if (HfId.Value != null)
            //{
            //    Response.Redirect("/CMIS/CMIS_Create_Patient.aspx?ID=" + id);
            //}


        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }





    }
}