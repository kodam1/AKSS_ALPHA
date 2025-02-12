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

using System.Text;
using System.Net;
using System.Net.Mail;
using DocumentFormat.OpenXml.Math;
using DocumentFormat.OpenXml.Bibliography;
using System.EnterpriseServices;
using DocumentFormat.OpenXml.Wordprocessing;
using System.Xml.Linq;

namespace AKSS_Management.AKodam_Management
{
    public partial class AKSS_Send_bulk_email : System.Web.UI.Page
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
            BtnSave.Text = "Send Bulk Email";
            GetMaxId();
            Bind_GV();
        }

        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_AKSS_Client_Bulk_Email_Send";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ID"].ToString() != "")
                    {
                        txtID.Text = dt.Rows[0]["ID"].ToString();
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
                string spname = "CRUD_AKSS_Client_Bulk_Email_Send";
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
                string spname = "CRUD_AKSS_Client_Bulk_Email_Send";
                BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@ID", Convert.ToInt32( txtID.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ID"].ToString() != "")
                    {

                        // txtUserId.Text = dt.Rows[0]["UserId"].ToString();
                        txtID.Text = dt.Rows[0]["ID"].ToString();
                        txtFrom.Text = dt.Rows[0]["From"].ToString();
                        txtTo.Text = dt.Rows[0]["To"].ToString();
                        txtCc.Text = dt.Rows[0]["Cc"].ToString();
                        txtBcc.Text = dt.Rows[0]["Bcc"].ToString();
                        txtSubject.Text = dt.Rows[0]["Subject"].ToString();
                        lblUploadFile.Text = dt.Rows[0]["Upload_File_Name"].ToString();
                        //TxtMail_Body.Text = dt.Rows[0]["Mail_Body"].ToString();
                        TxtTinymceEditor.InnerText = dt.Rows[0]["Mail_Body"].ToString();

                        // txtSubject.Text = dt.Rows[0]["Status"].ToString();
                        // txt.Text = dt.Rows[0]["CreatedBy"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["CreateDate_Time"].ToString();
                        //  CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedBy"].ToString();
                        //  CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedDate_Time"].ToString();

                        //if (Convert.ToBoolean(dt.Rows[0]["IsActive"]) == true)
                        //{
                        //    ChkActive.Checked = true;
                        //}
                        //else
                        //{
                        //    ChkActive.Checked = false;
                        //}

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

        protected async void BtnSave_Click(object sender, EventArgs e)
        {
          //  Task<bool> ClientExist = CheckClientExistOrNot();

            try
            {
                string spname = "CRUD_AKSS_Client_Bulk_Email_Send";
                string CRUD_Action = string.Empty;
                string CreatedBy = string.Empty;
                string ModifiedBy = ViewState["Session_UserName"].ToString(); //string.Empty;

                //if (await ClientExist != true)
                //{
                CRUD_Action = "CREATE";
                    CreatedBy = ViewState["Session_UserName"].ToString(); // session username
                //}
                //else
                //{
                //    CRUD_Action = "UPDATE";
                //    ModifiedBy = ""; // session username
                //}

                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", CRUD_Action),

               // new SqlParameter("@ID" , "ID"),
                new SqlParameter("@From" , txtFrom.Text.Trim()),
                new SqlParameter("@To" , txtTo.Text.Trim()),
                new SqlParameter("@Cc" , txtCc.Text.Trim()),
                new SqlParameter("@Bcc" , txtBcc.Text.Trim()),
                new SqlParameter("@Subject" , txtSubject.Text.Trim()),
                new SqlParameter("@Upload_File_Name" , UfUploadFile.FileName.Trim()),
                new SqlParameter("@Mail_Body" , TxtTinymceEditor.InnerText.Trim()), //TxtMail_Body.Text),

                new SqlParameter("@Status" , "Status"),

                new SqlParameter("@CreatedBy" , CreatedBy),
                //new SqlParameter("@CreateDate_Time" , CreateDate_Time),
                //new SqlParameter("@ModifiedBy" , ModifiedBy),
                //new SqlParameter("@ModifiedDate_Time" , "ModifiedDate_Time")

                };

                // insert sp 

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    send_bulk_email();

                    //if (await ClientExist != true)
                    //{
                    //                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert('Saved Succefully !');", true);

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert('Email Send Succefully !');", true);

                    ClearAll();
                        BindOnFirstPageLoad();
                    //}
                    //else
                    //{
                    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u1", "alert('Updated Succefully !');", true);
                    //    ClearAll();
                    //    BindOnFirstPageLoad();
                    //}
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
                string spname = "CRUD_AKSS_Client_Bulk_Email_Send";
                SqlParameter[] parameters = {

                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),                
		        new SqlParameter("@ID" , Convert.ToInt32(txtID .Text.Trim()))

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

            int index = gv.SelectedRow.RowIndex;
            string id = gv.SelectedRow.Cells[0].Text;
            string name = gv.SelectedRow.Cells[1].Text;
            string role = gv.SelectedRow.Cells[2].Text;
            string salary = gv.SelectedRow.Cells[3].Text;
            string message = "Row Index: " + index + "\\n id: " + id + "\\n name: " + name + "\\n role: " + role + "\\n salary" + salary;
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);

            txtID.Text = id;
            txtID_TextChanged(sender, e);


        }

        protected async void BtnExportToExcel_Click(object sender, EventArgs e)
        {
            string spname = "CRUD_AKSS_Client_Bulk_Email_Send";
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
                    wb.Worksheets.Add(dt, "ClientEmail");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=ClientEmailList.xlsx");
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

        //public override void VerifyRenderingInServerForm(Control control)
        //{
        //    //required to avoid the runtime error "
        //    //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        //}

        public void ClearAll()
        {

            txtID.Text = string.Empty;
            txtFrom.Text = string.Empty;
            txtTo.Text = string.Empty;
            txtCc.Text = string.Empty;
            txtBcc.Text = string.Empty;
            txtSubject.Text = string.Empty;
            //UfUploadFile.FileName = String.Empty;
            lblUploadFile.Text = string.Empty;
            //TxtMail_Body.Text = string.Empty;
            TxtTinymceEditor.InnerText = string.Empty;

            //txtNewFollowUpReason.Text = string.Empty;
            //txtNotes.Text = string.Empty;
            //ChkActive.Checked = false;

        }

        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");  
        }

        public void send_bulk_email()
        {

            LblTotalcount.Text = string.Empty;

            string str_To = txtTo.Text.Trim();
            string str_Cc = txtCc.Text.Trim();
            string str_Bcc = txtBcc.Text.Trim();

            string[] arr_To = str_To.Split(new char[] { ',' });
            string[] arr_Cc = str_Cc.Split(new char[] { ',' });
            string[] arr_Bcc = str_Bcc.Split(new char[] { ',' });

            string from = txtFrom.Text.Trim();  //"YouEmailID@gmail.com";
            string subject = txtSubject.Text.Trim();
            string mailbody = TxtTinymceEditor.InnerText.Replace("\r\n", "\n").Trim();

            int i;

            for ( i = 0; i < arr_To.Length; i++)
            {
                Email_With_CCandBCC(from, arr_To[i].Trim(), str_Cc, str_Bcc, subject, mailbody);
            }

            LblTotalcount.Text = "Email Send : "+ i.ToString(); 

            //toEmail = txttomail.Text;
            //EmailSubj = Convert.ToString(txtsub.Text);
            //EmailMsg = Convert.ToString(txtsub.Text);
            //ccId = Convert.ToString(txtcc.Text);
            //bccId = Convert.ToString(txtBCC.Text);
            //ing parameter to Email Method  

        }

        public void Email_With_CCandBCC(String FromEmail, String ToEmail, string cc, string bcc, 
            String Subj, string Message)
        {
            //Reading sender Email credential from web.config file  

            string HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
            string FromEmailid = ConfigurationManager.AppSettings["smtpUserName"].ToString();
            string Password = ConfigurationManager.AppSettings["smtpPassword"].ToString();
            FromEmailid = FromEmail;

            //MailMessage mailMessage = new MailMessage("from_email@gmail.com", "To_Email@gmail.com");
            //// Specify the email body
            //mailMessage.Body = emailbody;
            //// Specify the email Subject
            //mailMessage.Subject = "Exception";

            //// Specify the SMTP server name and post number
            //SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            //// Specify your gmail address and password
            //smtpClient.Credentials = new System.Net.NetworkCredential()
            //{
            //    UserName = "from_email@gmail.com",
            //    Password = "your_password"
            //};
            //// Gmail works on SSL, so set this property to true
            //smtpClient.EnableSsl = true;
            //// Finall send the email message using Send() method
            //smtpClient.Send(mailMessage);

            MailMessage message = new MailMessage(ToEmail, FromEmail, Subj, Message);

            if (UfUploadFile.HasFile)
            {
                HttpFileCollection fc = Request.Files;

                for (int i = 0; i <= fc.Count - 1; i++)
                {
                    HttpPostedFile pf = fc[i];
                    Attachment attach = new Attachment(pf.InputStream, pf.FileName);
                    message.Attachments.Add(attach);
                }
            }

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.UseDefaultCredentials = false;
            client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential("akshaykodam1994@gmail.com", "Iluparents@123");

            client.Send(message);

           // LblTotalcount.Text = "Message was sent successfully";

            //creating the object of MailMessage  
            //MailMessage mailMessage = new MailMessage();
            //mailMessage.From = new MailAddress(FromEmailid); //From Email Id  
            //mailMessage.Subject = Subj; //Subject of Email  
            //mailMessage.Body = Message; //body or message of Email  
            //mailMessage.IsBodyHtml = true;

            //mailMessage.To.Add(new MailAddress(ToEmail)); //receiver's TO Email Id  

            //mailMessage.CC.Add(new MailAddress(cc)); //Adding CC email Id  
            //mailMessage.Bcc.Add(new MailAddress(bcc));  //Adding BCC email Id  
            //SmtpClient smtp = new SmtpClient();  // creating object of smptpclient  
            //smtp.Host = HostAdd;              //host of emailaddress for example smtp.gmail.com etc  

            ////network and security related credentials  

            //smtp.EnableSsl = true;
            //NetworkCredential NetworkCred = new NetworkCredential();
            //NetworkCred.UserName = FromEmailid; //"akshaykodam11@gmail.com";   //mailMessage.From.Address;
            //NetworkCred.Password = Password;  //"Iluakshay@123";//Password;
            //smtp.UseDefaultCredentials = true;
            //smtp.Credentials = NetworkCred;
            //smtp.Port = 587;
            //smtp.Send(mailMessage); //sending Email  


        }

        public void demo()
        {
            string fromMail = "thedotnetchannelsender22@gmail.com";
            string fromPassword = "lgioehkvchemfkrw";

            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromMail);
            message.Subject = "Test Subject";
            message.To.Add(new MailAddress("thedotnetchannelreceiver22@gmail.com"));
            message.Body = "<html><body> Test Body </body></html>";
            message.IsBodyHtml = true;

            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(fromMail, fromPassword),
                EnableSsl = true,
            };

            smtpClient.Send(message);
        }


        //public void Send_Bulk_Email()
        //{
        //    try
        //    {
        //        LblTotalcount.Text = string.Empty;
                
        //        string str_To = txtTo.Text.Trim();
        //        string str_Cc = txtTo.Text.Trim();
        //        string str_Bcc = txtTo.Text.Trim();                

        //        string[] arr_To = str_To.Split(new char[] { ',' });
        //        string[] arr_Cc = str_Cc.Split(new char[] { ',' });
        //        string[] arr_Bcc = str_Bcc.Split(new char[] { ',' });

        //        string from = txtFrom.Text.Trim();  //"YouEmailID@gmail.com";
        //        string subject = txtSubject.Text.Trim();
        //        string mailbody = TxtTinymceEditor.InnerText.Replace("\r\n", "\n").Trim(); 


        //        for (int i = 0; i < arr_To.Length; i++)                
        //        {
        //            //string strCustomerID = grow.Cells[0].Text.Trim();
        //            //string strContactName = grow.Cells[1].Text.Trim();
        //            //string strAddress = grow.Cells[2].Text.Trim();
        //            //string strPhone = grow.Cells[3].Text.Trim();
        //            //string strEmail = grow.Cells[4].Text.Trim();

        //            //string filename = Server.MapPath("~/Event.html");
        //            //string mailbody = System.IO.File.ReadAllText(filename);
        //            //mailbody = mailbody.Replace("##NAME##", strContactName);



        //            string to = arr_To[i].Trim();

        //            MailMessage message = new MailMessage(from, to)
        //            {
        //                CC = str_Cc, //"akshay.kodam@zohomail.in",
        //                Bcc = str_Bcc,
        //                Subject = subject,  //"Auto Response Email";
        //                Body = mailbody,
        //                BodyEncoding = Encoding.UTF8,
        //                IsBodyHtml = true
        //            };

        //            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        //            System.Net.NetworkCredential basicCredential = new
        //            System.Net.NetworkCredential("akshay.kodam@zohomail.in", "Iluakshay@123");
        //            client.EnableSsl = true;
        //            client.UseDefaultCredentials = true;
        //            client.Credentials = basicCredential;
        //            try
        //            {
        //                client.Send(message);
        //               // ShowMessage("Email Sending successfully...!" + strContactName + "  ");
        //            }
        //            catch (Exception ex)
        //            {
        //                ShowMessage(ex.Message);
        //            }
        //        }
        //    }  
        //    catch (Exception ex)  
        //    {
        //        ShowMessage(ex.Message);
        //    }
        //    finally
        //    {
        //       // conn.Close();
        //    }
        //}

    }
}