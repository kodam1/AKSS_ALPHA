using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKSS_Management
{
    public partial class E_D : System.Web.UI.Page
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
            

        }
      

        protected void BtnEncrypt_Click(object sender, EventArgs e)
        {
            TxtEncrypt.Text = CommonUtility.Encode(TxtDecrypt.Text.Trim());
        }
        protected void BtnDecrypt_Click(object sender, EventArgs e)
        {
            TxtDecrypt.Text = CommonUtility.Decode(TxtEncrypt.Text.Trim());
        }


    }
}