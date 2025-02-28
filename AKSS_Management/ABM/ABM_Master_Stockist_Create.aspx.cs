﻿using System;
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

namespace AKSS_Management.ABM
{
    public partial class ABM_Master_Stockist_Create : System.Web.UI.Page
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

                if (Request.QueryString["Stockist_Id"] != null)
                {
                    TxtStockistId.Text = Request.QueryString["Stockist_Id"].ToString();
                    TxtStockistId_TextChanged(sender, e);
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
                string spname = "CRUD_ABM_StockistMaster_test";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Stockist_Id"].ToString() != "")
                    {
                        TxtStockistId.Text = dt.Rows[0]["Stockist_Id"].ToString();
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
                string spname = "CRUD_ABM_StockistMaster_test";
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

        protected async void TxtStockistId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_StockistMaster_test";
                BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Stockist_Id", Convert.ToInt32( TxtStockistId.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Stockist_Id"].ToString() != "")
                    {
                        TxtStockistId.Text = dt.Rows[0]["Stockist_Id"].ToString() != null ? dt.Rows[0]["Stockist_Id"].ToString() : "";
                        DdlDivisionName.SelectedValue = dt.Rows[0]["Division_Name"].ToString() != null ? dt.Rows[0]["Division_Name"].ToString() : "" ;
                        TxtSML_No.Text = dt.Rows[0]["SML_No"].ToString() != null ? dt.Rows[0]["SML_No"].ToString() : ""; 
                        DdlSML_Saturation.SelectedValue = dt.Rows[0]["SML_Saturation"].ToString() != null ? dt.Rows[0]["SML_Saturation"].ToString() : "";
                        TxtSTOCKIST_Name.Text = dt.Rows[0]["STOCKIST_Name"].ToString() != null ? dt.Rows[0]["STOCKIST_Name"].ToString() : "";
                        DdlQualification.SelectedValue = dt.Rows[0]["Qualification"].ToString() != null ? dt.Rows[0]["Qualification"].ToString() : "";
                        TxtOwner_Contact_Person.Text = dt.Rows[0]["Owner_Contact_Person"].ToString() != null ? dt.Rows[0]["Owner_Contact_Person"].ToString() : "";
                        DdlClass.SelectedValue = dt.Rows[0]["Class"].ToString() != null ? dt.Rows[0]["Class"].ToString() : "";
                        DdlCity.SelectedValue = dt.Rows[0]["City"].ToString() != null ? dt.Rows[0]["City"].ToString() : "";
                        TxtAddress1.Text = dt.Rows[0]["Address1"].ToString() != null ? dt.Rows[0]["Address1"].ToString() : "";
                        TxtAddress2.Text = dt.Rows[0]["Address2"].ToString() != null ? dt.Rows[0]["Address2"].ToString() : "";
                        TxtAddress3.Text = dt.Rows[0]["Address3"].ToString() != null ? dt.Rows[0]["Address3"].ToString() : "";
                        DdlArea.SelectedValue = dt.Rows[0]["Area"].ToString() != null ? dt.Rows[0]["Area"].ToString() : "";
                        TxtPinCode.Text = dt.Rows[0]["PinCode"].ToString() != null ? dt.Rows[0]["PinCode"].ToString() : "";
                        //TxtDate_Of_Birth.Text = dt.Rows[0]["Date_Of_Birth"].ToString() != null ? dt.Rows[0]["Date_Of_Birth"].ToString() : "";

                        if (dt.Rows[0]["Date_Of_Birth"].ToString() != null)
                        {
                            string str_date = dt.Rows[0]["Date_Of_Birth"].ToString();
                            DateTime dateTime = DateTime.Parse(str_date);

                            string shortDate = dateTime.ToString("yyyy-MM-dd"); // Default culture short date format

                            TxtDate_Of_Birth.Text = shortDate;
                        }
                        else
                        {
                            TxtDate_Of_Birth.Text = string.Empty;
                        }


                        TxtMobileNumber.Text = dt.Rows[0]["Mobile_No"].ToString() != null ? dt.Rows[0]["Mobile_No"].ToString() : "";
                        TxtContact_Person.Text = dt.Rows[0]["Contact_Person"].ToString() != null ? dt.Rows[0]["Contact_Person"].ToString() : "";
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "TxtStockistId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void TxtSTOCKIST_Name_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_StockistMaster_test";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_STOCKIST_Name"),
                    new SqlParameter("@STOCKIST_Name",  TxtSTOCKIST_Name.Text.Trim())
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Stockist_Id"].ToString() != "")
                    {
                        TxtSTOCKIST_Name.Text = dt.Rows[0]["STOCKIST_Name"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "TxtSTOCKIST_Name_TextChanged", "alert('Same Stockist Name Is Already Exists !');", true);
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

        public async Task<bool> CheckStockistExistOrNot()
        {
            try
            {
                bool user_exists_bool = false;
                string spname = "CRUD_ABM_StockistMaster_test";
                SqlParameter[] parameters = {
                     new SqlParameter("@CRUD_Action", "CHECK_Stockist_Id_EXISTS"),
                     new SqlParameter("@Stockist_Id", Convert.ToInt32( TxtStockistId.Text.Trim())),
 		            
 	            };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Stockist_Id"].ToString() != "")
                    {
                        user_exists_bool = true;
                    }
                }
                else
                {
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckStockistExistOrNot", "alert('Data Not Present !');", true);
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
            Task<bool> ClientExist = CheckStockistExistOrNot();

            try
            {
                string spname = "CRUD_ABM_StockistMaster_test";
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
                    CRUD_Action = "UPDATE";
                    ModifiedBy = ""; // session username
                }

                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", CRUD_Action),

                new SqlParameter("@Stockist_Id" , Convert.ToInt32( TxtStockistId.Text.Trim())),
                new SqlParameter("@Division_Name" , DdlDivisionName.SelectedValue.Trim()),
                new SqlParameter("@SML_No" , Convert.ToInt32( TxtSML_No.Text.Trim())),
                new SqlParameter("@SML_Saturation" , DdlSML_Saturation.SelectedValue.Trim()),
                new SqlParameter("@STOCKIST_Name" , TxtSTOCKIST_Name.Text.Trim()),
                new SqlParameter("@Qualification" , DdlQualification.SelectedValue.Trim()),
                new SqlParameter("@Owner_Contact_Person" , TxtOwner_Contact_Person.Text.Trim()),
                new SqlParameter("@Class" , DdlClass.SelectedValue.Trim()),
                new SqlParameter("@City" , DdlCity.SelectedValue.Trim()),
                new SqlParameter("@Address1" ,  TxtAddress1.Text.Trim()),
                new SqlParameter("@Address2" ,  TxtAddress2.Text.Trim()),
                new SqlParameter("@Address3" ,  TxtAddress3.Text.Trim()),
                new SqlParameter("@Area" ,DdlArea.SelectedValue.Trim()),
                new SqlParameter("@PinCode" ,  Convert.ToInt32( TxtPinCode.Text.Trim())),
                new SqlParameter("@Date_Of_Birth" , TxtDate_Of_Birth.Text.Trim()),
                new SqlParameter("@Mobile_No" , Convert.ToInt64( TxtMobileNumber.Text.Trim())),
                new SqlParameter("@Contact_Person" , TxtContact_Person.Text.Trim()),
                new SqlParameter("@CreatedBy" ,CreatedBy),
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
                string spname = "CRUD_ABM_StockistMaster_test";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                new SqlParameter("@Stockist_Id", Convert.ToInt32(TxtStockistId.Text.Trim()))       
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
            string spname = "CRUD_ABM_StockistMaster_test";
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", "GET_ALL")
            };

            DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

            if (dt.Rows.Count > 0)
            {                 
                using (XLWorkbook wb = new XLWorkbook())
                {
                    wb.Worksheets.Add(dt, "StockistMasterList");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=StockistMaster.xlsx");
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
            TxtStockistId.Text = string.Empty;
            DdlDivisionName.SelectedIndex = 0;
            TxtSML_No.Text = string.Empty;
            DdlSML_Saturation.SelectedIndex = 0;
            TxtSTOCKIST_Name.Text = string.Empty;
            DdlQualification.SelectedIndex = 0;
            TxtOwner_Contact_Person.Text = string.Empty;
            DdlClass.SelectedIndex = 0;
            DdlCity.SelectedIndex = 0;
            TxtAddress1.Text = string.Empty;
            TxtAddress2.Text = string.Empty;
            TxtAddress3.Text = string.Empty;
            DdlArea.SelectedIndex = 0;
            TxtPinCode.Text = string.Empty;
            TxtDate_Of_Birth.Text = string.Empty;
            TxtMobileNumber.Text = string.Empty;
            TxtContact_Person.Text = string.Empty;
        }

    }
}