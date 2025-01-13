using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKSS_Management.AKodam_Management
{
    public partial class AKSS_Component_Reusable_Confirm_Popup_Modal : System.Web.UI.Page
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
                   // BindOnFirstPageLoad();
                }

            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('BtnSave_Click Click !');", true);
        }

        protected void BtnPrint_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('BtnPrint_Click Click !');", true);
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('BtnUpdate_Click Click !');", true);
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('BtnDelete_Click Click !');", true);
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('BtnReset_Click Click !');", true);
        }

        protected void BtnExportToExcel_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('BtnExportToExcel_Click Click !');", true);
        }

        protected void GvBtn_Edit_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('GvBtn_Edit_Click Click !');", true);
        }

        protected void A_GvBtn_Create_Appointment_serverclick(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert('A_GvBtn_Create_Appointment_serverclick Click !');", true);
        }



    }
}