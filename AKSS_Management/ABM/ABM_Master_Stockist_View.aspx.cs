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
using DocumentFormat.OpenXml.Office2010.Excel;

namespace AKSS_Management.ABM
{
    public partial class ABM_Master_Stockist_View : System.Web.UI.Page
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
                    LblStockist_Id_Data.Text = Request.QueryString["Stockist_Id"].ToString();
                    LblStockist_Id_Data_TextChanged(sender, e);
                }
                else
                {
                    BindOnFirstPageLoad();
                }

            }
        }

        public void BindOnFirstPageLoad()
        {

        }

        protected async void LblStockist_Id_Data_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_StockistMaster_test";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Stockist_Id", Convert.ToInt32( LblStockist_Id_Data.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Stockist_Id"].ToString() != "")
                    {
                        LblStockist_Id_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Stockist_Id"].ToString()) ? dt.Rows[0]["Stockist_Id"].ToString() : "-";
                        LblDivision_Name_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Division_Name"].ToString()) ? dt.Rows[0]["Division_Name"].ToString() : "-";
                        LblSML_No_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["SML_No"].ToString()) ? dt.Rows[0]["SML_No"].ToString() : "-";
                        LblSML_Saturation_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["SML_Saturation"].ToString()) ? dt.Rows[0]["SML_Saturation"].ToString() : "-";
                        LblSTOCKIST_Name_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["STOCKIST_Name"].ToString()) ? dt.Rows[0]["STOCKIST_Name"].ToString() : "-";
                        LblQualification_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Qualification"].ToString()) ? dt.Rows[0]["Qualification"].ToString() : "-";
                        LblOwner_Contact_Person_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Owner_Contact_Person"].ToString()) ? dt.Rows[0]["Owner_Contact_Person"].ToString() : "-";
                        LblClass_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Class"].ToString()) ? dt.Rows[0]["Class"].ToString() : "-";
                        LblCity_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["City"].ToString()) ? dt.Rows[0]["City"].ToString() : "-";
                        LblAddress1_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address1"].ToString()) ? dt.Rows[0]["Address1"].ToString() : "-";
                        LblAddress2_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address2"].ToString()) ? dt.Rows[0]["Address2"].ToString() : "-";
                        LblAddress3_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Address3"].ToString()) ? dt.Rows[0]["Address3"].ToString() : "-";
                        LblArea_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Area"].ToString()) ? dt.Rows[0]["Area"].ToString() : "-";
                        LblPinCode_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["PinCode"].ToString()) ? dt.Rows[0]["PinCode"].ToString() : "-";
                        LblDate_Of_Birth_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Date_Of_Birth"].ToString()) ? dt.Rows[0]["Date_Of_Birth"].ToString() : "-";
                        LblMobile_No_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Mobile_No"].ToString()) ? dt.Rows[0]["Mobile_No"].ToString() : "-";
                        LblContact_Person_Data.Text = !string.IsNullOrEmpty(dt.Rows[0]["Contact_Person"].ToString()) ? dt.Rows[0]["Contact_Person"].ToString() : "-";
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "LblStockist_Id_Data_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }

        protected void Btn_Edit_serverclick(object sender, EventArgs e)
        {
            try
            {
                if (LblStockist_Id_Data.Text != null)
                {
                    Response.Redirect("/ABM/ABM_Master_Stockist_Create.aspx?Stockist_Id=" + LblStockist_Id_Data.Text.Trim(), false);
                }
            }
            catch
            {
                throw;
            }
        }

        protected async void Btn_Delete_serverclick(object sender, EventArgs e)
        {
            try
            {
                if (LblStockist_Id_Data.Text != null)
                {
                    try
                    {
                        string spname = "CRUD_ABM_StockistMaster_test";
                        SqlParameter[] parameters = {
                        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),
                        new SqlParameter("@Stockist_Id" , Convert.ToInt32(LblStockist_Id_Data.Text.Trim()))
                        };

                        int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

                        if (i > 0)
                        {

                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Record Deleted Succefully !');window.location.href='/ABM/ABM_Master_Stockist_List.aspx';", true);
                            ClearAll();
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
            catch
            {
                throw;
            }
        }

        public void ClearAll()
        {
            LblStockist_Id_Data.Text = string.Empty;
            LblDivision_Name_Data.Text = string.Empty;
            LblSML_No_Data.Text = string.Empty;
            LblSML_Saturation_Data.Text = string.Empty;
            LblSTOCKIST_Name_Data.Text = string.Empty;
            LblQualification_Data.Text = string.Empty;
            LblOwner_Contact_Person_Data.Text = string.Empty;
            LblClass_Data.Text = string.Empty;
            LblCity_Data.Text = string.Empty;
            LblAddress1_Data.Text = string.Empty;
            LblAddress2_Data.Text = string.Empty;
            LblAddress3_Data.Text = string.Empty;
            LblArea_Data.Text = string.Empty;
            LblPinCode_Data.Text = string.Empty;
            LblDate_Of_Birth_Data.Text = string.Empty;
            LblMobile_No_Data.Text = string.Empty;
            LblContact_Person_Data.Text = string.Empty;
        }
    }
}