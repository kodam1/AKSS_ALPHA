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
    public partial class CMIS_Create_Patient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {                   
                    txtPatientId.Text = Request.QueryString["ID"].ToString();
                    txtPatientId_TextChanged(sender, e);
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
            Lblh5_Title.Text = "Create Patient";
            GetMaxId();
            //Bind_gvClientFollowUpMaster();
        }

        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_CMIS_CREATE_PATIENT";
                SqlParameter[] parameters = {
                  new SqlParameter("@CRUD_Action", "GetMaxId"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ID"].ToString() != "")
                    {
                        txtPatientId.Text = dt.Rows[0]["ID"].ToString();
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

        protected async void txtPatientId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_CREATE_PATIENT";
                BtnSave.Text = "Modify";
                Lblh5_Title.Text = "Modify Patient";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@ID", Convert.ToInt32( txtPatientId.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ID"].ToString() != "")
                    {                        
                        //txtPatientId.Text = dt.Rows[0]["ID"].ToString();
                        txtFirstName.Text = dt.Rows[0]["First_Name"].ToString();
                        txtMiddleName.Text = dt.Rows[0]["Middle_Name"].ToString();
                        txtLastName.Text = dt.Rows[0]["Last_Name"].ToString();
                        txtCountryCode.Text = dt.Rows[0]["Country_Code"].ToString();
                        txtContactNumber.Text = dt.Rows[0]["Contact_Number"].ToString();
                        txtEmail.Text = dt.Rows[0]["Email"].ToString();
                        DdlGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                        txtAge.Text = dt.Rows[0]["Age"].ToString();
                        DdlBloodGroup.SelectedValue = dt.Rows[0]["Blood_Group"].ToString();
                        txtWeight.Text = dt.Rows[0]["Weight"].ToString();
                        txtHeight.Text = dt.Rows[0]["Height"].ToString();
                        txtBP.Text = dt.Rows[0]["BP"].ToString();
                        txtSymptoms.Text = dt.Rows[0]["Symptoms"].ToString();
                        txtAddress.Text = dt.Rows[0]["Address"].ToString();
                        txtNotes.Text = dt.Rows[0]["Notes"].ToString();
                        //txt.CONTROLLER_PROPERTY = dt.Rows[0]["CreatedBy"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["CreateDate_Time"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedBy"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedDate_Time"].ToString();

                        //if (Convert.ToBoolean(dt.Rows[0]["IsActive"]) == true)
                        //{
                        //    ChkActive.Checked = true;
                        //}
                        //else
                        //{
                        //    ChkActive.Checked = false;
                        //}

                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtPatientId_TextChanged", "alert('Data fetch successfully !');", true);

                    }
                }
                else
                {
                    BtnReset_Click(sender, e);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtPatientId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void txtClientName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_CREATE_PATIENT";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_FIRST_NAME"),
                    new SqlParameter("@Client_Name",  txtFirstName.Text.Trim())
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ID"].ToString() != "")
                    {
                        txtFirstName.Text = dt.Rows[0]["First_Name"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientName_TextChanged", "alert('Same Client Name Is Already Exists !');", true);
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

        public async Task<bool> CheckIDExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_CMIS_CREATE_PATIENT";
                SqlParameter[] parameters = {
                     new SqlParameter("@CRUD_Action", "CHECK_ID_EXISTS"),
                     new SqlParameter("@ID", Convert.ToInt32( txtPatientId.Text.Trim())), 		            
 	            };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ID"].ToString() != "")
                    {
                        user_exists_bool = true;
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckIDExistOrNot", "alert('Data Not Present !');", true);
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
            Task<bool> ClientExist = CheckIDExistOrNot();

            try
            {
                string spname = "CRUD_CMIS_CREATE_PATIENT";
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

                new SqlParameter("@ID" , txtPatientId.Text.Trim()),
                new SqlParameter("@First_Name" , txtFirstName.Text.Trim()),
                new SqlParameter("@Middle_Name" , txtMiddleName.Text.Trim()),
                new SqlParameter("@Last_Name" , txtLastName.Text.Trim()),
                new SqlParameter("@Country_Code" , txtCountryCode.Text.Trim()),
                new SqlParameter("@Contact_Number" , txtContactNumber.Text.Trim()),
                new SqlParameter("@Email" , txtEmail.Text.Trim()),
                new SqlParameter("@Gender" , DdlGender.SelectedValue.Trim()),
                new SqlParameter("@Age" , txtAge.Text.Trim()),
                new SqlParameter("@Blood_Group" , DdlBloodGroup.SelectedValue.Trim()),
                new SqlParameter("@Weight" , txtWeight.Text.Trim()),
                new SqlParameter("@Height" , txtHeight.Text.Trim()),
                new SqlParameter("@BP" , txtBP.Text.Trim()),
                new SqlParameter("@Symptoms" ,txtSymptoms.Text.Trim()),
                new SqlParameter("@Address" , txtAddress.Text.Trim()),
                new SqlParameter("@Notes" , txtNotes.Text.Trim()),
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

        public void ClearAll()
        {           
            txtPatientId.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtMiddleName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtCountryCode.Text = string.Empty;
            txtContactNumber.Text = string.Empty;
            txtEmail.Text = string.Empty;
            DdlGender.SelectedIndex = 0;
            txtAge.Text = string.Empty;
            DdlBloodGroup.SelectedIndex = 0;
            txtWeight.Text = string.Empty;
            txtHeight.Text = string.Empty;
            txtBP.Text = string.Empty;
            txtSymptoms.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtNotes.Text = string.Empty;
        }

        protected async void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_CMIS_CREATE_PATIENT";
                SqlParameter[] parameters = {

                    new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),

                    //new SqlParameter("@ClientID", Convert.ToInt32(txtClientId.Text.Trim())),

		            new SqlParameter("@ID" , "ID")

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
            string spname = "CRUD_CMIS_CREATE_PATIENT";
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
                    wb.Worksheets.Add(dt, "PatientList");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=Patient.xlsx");
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

    }
}