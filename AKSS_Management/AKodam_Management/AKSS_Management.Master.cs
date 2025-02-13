using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKSS_Management.AKodam_Management
{
    public partial class AKSS_Management : System.Web.UI.MasterPage
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
                    Response.Redirect("/pages-login.aspx");
                }

                BindOnFirstPageLoad();
            }
        }

        public void BindOnFirstPageLoad()
        {
            Bind_Data();
        }

        public void Bind_Data()
        {

            h6_Profile_FullName.InnerText = Session["FullName"].ToString();
            span_Profile_Role.InnerText = Session["Role"].ToString();
            span_Profile_UserName.InnerText = Session["UserName"].ToString();
        }
    }
}