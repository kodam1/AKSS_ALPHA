using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKSS_Management.CMIS
{
    public partial class CMIS_Appointment : System.Web.UI.Page
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
                    //BindOnFirstPageLoad();
                }

            }
        }
    }
}