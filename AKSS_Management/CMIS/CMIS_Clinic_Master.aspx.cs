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

namespace AKSS_Management.CMIS
{
    public partial class CMIS_Clinic_Master : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Clinic_ID"] != null)
                {
                    //txtClinicId.Text = Request.QueryString["Clinic_ID"].ToString();
                    txtClinicId.Text = "1";
                    txtClinicId_TextChanged(sender, e);
                }
                else
                {

                    txtClinicId.Text = "1";
                    txtClinicId_TextChanged(sender, e);
                    //BindOnFirstPageLoad();
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
                string spname = "CRUD_CMIS_Mst_Clinic";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Clinic_ID"].ToString() != "")
                    {
                        txtClinicId.Text = dt.Rows[0]["Clinic_ID"].ToString();
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
                string spname = "CRUD_CMIS_Mst_Clinic";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "Bind_gv"),
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

        protected async void txtClinicId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Mst_Clinic";
                BtnSave.Text = "Modify";

                int? ClinicId;
                if (txtClinicId.Text.Trim() != string.Empty)
                {
                    ClinicId = Convert.ToInt32(txtClinicId.Text.Trim());
               
                    SqlParameter[] parameters = {
                        new SqlParameter("@CRUD_Action", "GET_BY_ID"),                  
                        new SqlParameter("@Clinic_ID", ClinicId)
                    };

                    DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                    if (dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Clinic_ID"].ToString() != "")
                        {                        
                            txtClinicId.Text = dt.Rows[0]["Clinic_ID"].ToString();
                            txtClinicName.Text = dt.Rows[0]["Clinic_Name"].ToString();
                            txtClinicEmail.Text = dt.Rows[0]["Clinic_Email"].ToString();
                            txtDoctorName.Text = dt.Rows[0]["Doctor_Name"].ToString();
                            txtDoctorDegree.Text = dt.Rows[0]["Doctor_Degree"].ToString();
                            txtDoctorSpecialization.Text = dt.Rows[0]["Doctor_Specialization"].ToString();
                            txtCountryCode.Text = dt.Rows[0]["Country_Code"].ToString();
                            txtContactNumber.Text = dt.Rows[0]["Contact_Number"].ToString();
                            txtClinicTelephoneNumber.Text = dt.Rows[0]["Clinic_Telephone_Number"].ToString();
                            txtOldCasePrice.Text = dt.Rows[0]["Old_Case_Price"].ToString();
                            txtNewCasePrice.Text = dt.Rows[0]["New_Case_Price"].ToString();
                            txtClinicAddress.Text = dt.Rows[0]["Clinic_Address"].ToString();
                            txtWorkingHours.Text = dt.Rows[0]["Working_Hours"].ToString();
                            txtSpecialNotes.Text = dt.Rows[0]["Special_Notes"].ToString();
                            //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["CreatedBy"].ToString();
                            //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["CreateDate_Time"].ToString();
                            //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedBy"].ToString();
                            //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedDate_Time"].ToString();
                         
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClinicId_TextChanged", "alert('Data Not Present !');", true);
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtClinicName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_Mst_Clinic";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_Clinic_Name"),
                    new SqlParameter("@Clinic_Name",  txtClinicName.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Clinic_ID"].ToString() != "")
                    {
                        txtClinicName.Text = dt.Rows[0]["Clinic_Name"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClinicName_TextChanged", "alert('Same Client Name Is Already Exists !');", true);
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClinicId_TextChanged", "alert('Data Not Present !');", true);
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
                string spname = "CRUD_CMIS_Mst_Clinic";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "CHECK_ID_EXISTS"),
                new SqlParameter("@Clinic_ID", Convert.ToInt32( txtClinicId.Text.Trim())), 		        
 	            };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Clinic_ID"].ToString() != "")
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
                string spname = "CRUD_CMIS_Mst_Clinic";
                string CRUD_Action = string.Empty;
                string CreatedBy = string.Empty;
                string ModifiedBy = string.Empty;

                if (await ClientExist != true)
                {
                    CRUD_Action = "CREATE";
                    CreatedBy = ""; // session username
                }
                else
                {
                    CRUD_Action = "UPDATE";
                    ModifiedBy = ""; // session username
                }

                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", CRUD_Action),

                new SqlParameter("@Clinic_ID" , txtClinicId.Text.Trim()),
                new SqlParameter("@Clinic_Name" ,txtClinicName.Text.Trim()),
                new SqlParameter("@Clinic_Email" , txtClinicEmail.Text.Trim()),
                new SqlParameter("@Doctor_Name" , txtDoctorName.Text.Trim()),
                new SqlParameter("@Doctor_Degree" , txtDoctorDegree.Text.Trim()),
                new SqlParameter("@Doctor_Specialization" , txtDoctorSpecialization.Text.Trim()),
                new SqlParameter("@Country_Code" , txtCountryCode.Text.Trim()),
                new SqlParameter("@Contact_Number" , txtContactNumber.Text.Trim()),
                new SqlParameter("@Clinic_Telephone_Number" , txtClinicTelephoneNumber.Text.Trim()),
                new SqlParameter("@Old_Case_Price" , txtOldCasePrice.Text.Trim()),
                new SqlParameter("@New_Case_Price" , txtNewCasePrice.Text.Trim()),
                new SqlParameter("@Clinic_Address" , txtClinicAddress.Text.Trim()),
                new SqlParameter("@Working_Hours" , txtWorkingHours.Text.Trim()),
                new SqlParameter("@Special_Notes" , txtSpecialNotes.Text.Trim()),
                new SqlParameter("@CreatedBy" , "CreatedBy"),
                //new SqlParameter("@CreateDate_Time" , "CreateDate_Time"),
                new SqlParameter("@ModifiedBy" , "ModifiedBy"),
                //new SqlParameter("@ModifiedDate_Time" , "ModifiedDate_Time")

                };

                int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                if (i > 0)
                {
                    if (await ClientExist != true)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert('Saved Succefully !');", true);
                        //ClearAll();
                        //BindOnFirstPageLoad();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u1", "alert('Updated Succefully !');", true);
                        //ClearAll();
                        //BindOnFirstPageLoad();
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
                string spname = "CRUD_CMIS_Mst_Clinic";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
		        new SqlParameter("@Clinic_ID" ,Convert.ToInt32(txtClinicId.Text.Trim()))
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
            string spname = "CRUD_CMIS_Mst_Clinic";
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", "GET_ALL")
            };

            DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

            if (dt.Rows.Count > 0)
            {                 
                using (XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "Clinic");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=ClinicMaster.xlsx");
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
            txtClinicId.Text = string.Empty;
            txtClinicName.Text = string.Empty;
            txtClinicEmail.Text = string.Empty;
            txtDoctorName.Text = string.Empty;
            txtDoctorDegree.Text = string.Empty;
            txtDoctorSpecialization.Text = string.Empty;
            txtCountryCode.Text = string.Empty;
            txtContactNumber.Text = string.Empty;
            txtClinicTelephoneNumber.Text = string.Empty;
            txtOldCasePrice.Text = string.Empty;
            txtNewCasePrice.Text = string.Empty;
            txtClinicAddress.Text = string.Empty;
            txtWorkingHours.Text = string.Empty;
            txtSpecialNotes.Text = string.Empty;
        }

    }
}