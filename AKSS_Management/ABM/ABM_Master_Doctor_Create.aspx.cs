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
using System.Globalization;

namespace AKSS_Management.ABM
{
    public partial class ABM_Master_Doctor_Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["UserName"].ToString()))
                {
                    ViewState["Session_UserName"] = Session["UserName"].ToString();
                }
                else
                {
                    Response.Redirect("/pages_login.aspx");
                }

                if (Request.QueryString["Dr_Id"] != null)
                {                    
                    TxtDoctorId.Text = Request.QueryString["Dr_Id"].ToString();
                    TxtDoctorId_TextChanged(sender, e);
                }
                else
                {
                    BindOnFirstPageLoad();
                }

            }
        }
       
        public void BindOnFirstPageLoad()
        {
            BtnSave.Text = "Submit";
            GetMaxId();
            Bind_GV();
        }
       
        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_ABM_DoctorMaster_test";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Dr_Id"].ToString() != "")
                    {
                        TxtDoctorId.Text = dt.Rows[0]["Dr_Id"].ToString();
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
                string spname = "CRUD_ABM_DoctorMaster_test";
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

        protected async void TxtDoctorId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_DoctorMaster_test";
                BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Dr_Id", Convert.ToInt32(TxtDoctorId.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Dr_Id"].ToString() != "")
                    {
                        
                        TxtDoctorId.Text = !string.IsNullOrEmpty(dt.Rows[0]["Dr_Id"].ToString()) ? dt.Rows[0]["Dr_Id"].ToString() : string.Empty; ;
                        DdlDivisionName.SelectedValue = !string.IsNullOrEmpty(dt.Rows[0]["Division_Name"].ToString()) ? dt.Rows[0]["Division_Name"].ToString() : string.Empty; ;
                        TxtDML_No.Text = !string.IsNullOrEmpty(dt.Rows[0]["DML_No"].ToString()) ? dt.Rows[0]["DML_No"].ToString() : string.Empty; ;
                        DdlDML_Saturation.SelectedValue = !string.IsNullOrEmpty(dt.Rows[0]["DML_Saturation"].ToString()) ? dt.Rows[0]["DML_Saturation"].ToString() : string.Empty; ;
                        TxtDOCTOR_Name.Text = !string.IsNullOrEmpty(dt.Rows[0]["DOCTOR_Name"].ToString()) ? dt.Rows[0]["DOCTOR_Name"].ToString() : string.Empty; ;
                        DdlQualification.SelectedValue = !string.IsNullOrEmpty(dt.Rows[0]["Qualification"].ToString()) ? dt.Rows[0]["Qualification"].ToString() : string.Empty; ;
                        DdlSpeciality.SelectedValue = !string.IsNullOrEmpty(dt.Rows[0]["Speciality"].ToString()) ? dt.Rows[0]["Speciality"].ToString() : string.Empty; ;
                        DdlClass.SelectedValue = !string.IsNullOrEmpty(dt.Rows[0]["Class"].ToString()) ? dt.Rows[0]["Class"].ToString() : string.Empty; ;
                        DdlCity.SelectedValue = !string.IsNullOrEmpty(dt.Rows[0]["City"].ToString()) ? dt.Rows[0]["City"].ToString() : string.Empty; ;
                        TxtAddress1.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address1"].ToString()) ? dt.Rows[0]["Address1"].ToString() : string.Empty; ;
                        TxtAddress2.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address2"].ToString()) ? dt.Rows[0]["Address2"].ToString() : string.Empty; ;
                        TxtAddress3.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address3"].ToString()) ? dt.Rows[0]["Address3"].ToString() : string.Empty; ;
                        DdlArea.SelectedValue = !string.IsNullOrEmpty(dt.Rows[0]["Area"].ToString()) ? dt.Rows[0]["Area"].ToString() : string.Empty; ;
                        TxtPinCode.Text = !string.IsNullOrEmpty(dt.Rows[0]["PinCode"].ToString()) ? dt.Rows[0]["PinCode"].ToString() : string.Empty; ;

                        // database like 1993-12-30
                        // get 30-12-1993 12:00:00 AM
                        //DateTime datetime = DateTime.ParseExact(dt.Rows[0]["Date_Of_Birth"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);

                        string str_date = !string.IsNullOrEmpty(dt.Rows[0]["Date_Of_Birth"].ToString()) ? dt.Rows[0]["Date_Of_Birth"].ToString() : string.Empty; ;
                        // Parse the string into a DateTime object
                        DateTime dateTime = DateTime.Parse(str_date);

                        // Convert to short date string
                        string shortDate = dateTime.ToString("yyyy-MM-dd"); // Default culture short date format
                       
                        TxtDate_Of_Birth.Text = shortDate;

                        /* Example is here
                        // Original string
                        string input1 = "30-12-1993 12:00:00 AM";

                        // Parse the string into a DateTime object
                         DateTime dateTime1 = DateTime.Parse(input1);

                        // Convert to dd-MM-yyyy format
                        string formattedDate1 = dateTime1.ToString("dd-MM-yyyy");
                       
                        */


                        TxtMobileNumber.Text = !string.IsNullOrEmpty(dt.Rows[0]["Mobile_No"].ToString()) ? dt.Rows[0]["Mobile_No"].ToString() : string.Empty; ;
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "TxtDoctorId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void TxtDOCTOR_Name_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_DoctorMaster_test";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_DOCTOR_NAME"),
                    new SqlParameter("@Doctor_Name",  TxtDOCTOR_Name.Text.Trim())
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Dr_Id"].ToString() != "")
                    {
                        TxtDOCTOR_Name.Text = dt.Rows[0]["DOCTOR_Name"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "TxtDOCTOR_Name_TextChanged", "alert('Same Doctor Name Is Already Exists !');", true);
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

        public async Task<bool> CheckClientExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_ABM_DoctorMaster_test";
                SqlParameter[] parameters = {
                     new SqlParameter("@CRUD_Action", "CHECK_Dr_Id_EXISTS"),
                     new SqlParameter("@Dr_Id", Convert.ToInt32( TxtDoctorId.Text.Trim())),
 		            //new SqlParameter("@Client_Name", txtClientName.Text.Trim())
 	            };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Dr_Id"].ToString() != "")
                    {
                        user_exists_bool = true;
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckClientExistOrNot", "alert('Data Not Present !');", true);
                    user_exists_bool = false;
                }
                return user_exists_bool;
            }
            catch
            {
                throw;
            }
        }
        
        protected async void BtnSave_Click(object sender, EventArgs e)
        {
            Task<bool> ClientExist = CheckClientExistOrNot();

            try
            {
                string spname = "CRUD_ABM_DoctorMaster_test";
                string CRUD_Action = string.Empty;
                string CreatedBy = ViewState["Session_UserName"].ToString();//Session["UserName"].ToString()
                string ModifiedBy = ViewState["Session_UserName"].ToString();

                if (await ClientExist != true)
                {
                    CRUD_Action = "CREATE";
                    CreatedBy = ""; // session username
                }
                else
                {
                    BtnSave.Text = "Modify";
                    CRUD_Action = "UPDATE";
                    ModifiedBy = ""; // session username
                }

                    SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", CRUD_Action),

                    new SqlParameter("@Dr_Id" ,  Convert.ToInt32( TxtDoctorId.Text.Trim())),
                    new SqlParameter("@Division_Name" , DdlDivisionName.SelectedValue.Trim()),
                    new SqlParameter("@DML_No" , Convert.ToInt32(TxtDML_No.Text.Trim())),
                    new SqlParameter("@DML_Saturation" ,  DdlDML_Saturation.SelectedValue.Trim()),
                    new SqlParameter("@DOCTOR_Name" , TxtDOCTOR_Name.Text.Trim()),
                    new SqlParameter("@Qualification" , DdlQualification.SelectedValue.Trim()),
                    new SqlParameter("@Speciality" , DdlSpeciality.SelectedValue.Trim()),
                    new SqlParameter("@Class" , DdlClass.SelectedValue.Trim()),
                    new SqlParameter("@City" , DdlCity.SelectedValue.Trim()),
                    new SqlParameter("@Address1" , TxtAddress1.Text.Trim()),
                    new SqlParameter("@Address2" , TxtAddress2.Text.Trim()),
                    new SqlParameter("@Address3" ,  TxtAddress3.Text.Trim()),
                    new SqlParameter("@Area" , DdlArea.SelectedValue.Trim()),
                    new SqlParameter("@PinCode" ,  Convert.ToInt32( TxtPinCode.Text.Trim())),
                    new SqlParameter("@Date_Of_Birth" , TxtDate_Of_Birth.Text.Trim()),
                    new SqlParameter("@Mobile_No" , Convert.ToInt64( TxtMobileNumber.Text.Trim())),
                    new SqlParameter("@CreatedBy" , CreatedBy),
                   // new SqlParameter("@CreateDate_Time" , "CreateDate_Time"),
                    new SqlParameter("@ModifiedBy" , ModifiedBy),
                   // new SqlParameter("@ModifiedDate_Time" , "ModifiedDate_Time")

                    };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    if (await ClientExist != true)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert('Saved Succefully !');", true);
                        ClearAll();
                        BindOnFirstPageLoad();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u1", "alert('Updated Succefully !');", true);
                        ClearAll();
                        BindOnFirstPageLoad();
                    }
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
                string spname = "CRUD_ABM_DoctorMaster_test";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
		        new SqlParameter("@Dr_Id" , Convert.ToInt32( TxtDoctorId.Text.Trim()))

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

        protected async void BtnExportToExcel_Click(object sender, EventArgs e)
        {
            string spname = "CRUD_ABM_DoctorMaster_test";
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", "BIND_ExportToExcel")
        };
            DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

            if (dt.Rows.Count > 0)
            {               
                using (XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "DoctorMasterList");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=DoctorMaster.xlsx");
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

        public void ClearAll()
        {           
            TxtDoctorId.Text = string.Empty;
            DdlDivisionName.SelectedIndex = 0;
            TxtDML_No.Text = string.Empty;
            DdlDML_Saturation.SelectedIndex = 0;
            TxtDOCTOR_Name.Text = string.Empty;
            DdlQualification.SelectedIndex = 0;
            DdlSpeciality.SelectedIndex = 0;
            DdlClass.SelectedIndex = 0;
            DdlCity.SelectedIndex = 0;
            TxtAddress1.Text = string.Empty;
            TxtAddress2.Text = string.Empty;
            TxtAddress3.Text = string.Empty;
            DdlArea.SelectedIndex = 0;
            TxtPinCode.Text = string.Empty;
            TxtDate_Of_Birth.Text = string.Empty;
            TxtMobileNumber.Text = string.Empty;
        }

    }
}