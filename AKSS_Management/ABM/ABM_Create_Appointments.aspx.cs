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
using DocumentFormat.OpenXml.Wordprocessing;
//using Telerik.Web.UI;

namespace AKSS_Management.ABM
{
    public partial class ABM_Create_Appointments : System.Web.UI.Page
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

                if (Request.QueryString["Id"] != null)
                {
                    BindAllListControl();
                    txtAppointmentId.Text = Request.QueryString["Id"].ToString();
                   // txtAppointmentId_TextChanged(sender, e);
                }
                else
                {
                    BindOnFirstPageLoad();
                }
            }
        }
        public void BindAllListControl()
        {
            BindDoctor();
            BindChemist();
            BindStockist();
        }
        public void BindOnFirstPageLoad()
        {
            BtnSave.Text = "Submit";
            GetMaxId();
            BindDoctor();
            BindChemist();
            BindStockist();
            txtDate.Text = System.DateTime.Now.ToString();
        }
        public async void GetMaxId()
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GetMaxId"),
                };
                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
                    {
                        txtAppointmentId.Text = dt.Rows[0]["Id"].ToString();
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
        public async void BindDoctor()
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "BIND_DOCTOR_NAME"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    DdlDoctor.DataSource = dt;
                    DdlDoctor.DataBind();

                    DdlDoctor.ClearSelection();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_GV", "alert('Doctor Data Not Present !');", true);
                    DdlDoctor.DataSource = null;
                    DdlDoctor.DataBind();
                }
            }
            catch
            {
                throw;
            }
        }
        public async void BindChemist()
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "BIND_CHEMIST_NAME"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    DdlChemist.DataSource = dt;
                    DdlChemist.DataBind();

                    DdlChemist.ClearSelection();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_GV", "alert('Chemist Data Not Present !');", true);
                    DdlChemist.DataSource = null;
                    DdlChemist.DataBind();
                }
            }
            catch
            {
                throw;
            }
        }
        public async void BindStockist()
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "BIND_STOCKIST_NAME"),
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    DdlStockist.DataSource = dt;
                    DdlStockist.DataBind();

                    DdlStockist.ClearSelection();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_GV", "alert('Stockist Data Not Present !');", true);
                    DdlStockist.DataSource = null;
                    DdlStockist.DataBind();
                }
            }
            catch
            {
                throw;
            }
        }      
        public void UnselectDdlDoctor()
        {
            for (int i = 0; i < DdlDoctor.Items.Count; i++)
            {               
                 DdlDoctor.Items[i].Selected = false;               
            }
        }
        public void UnselectDdlStockist()
        {
            for (int i = 0; i < DdlStockist.Items.Count ; i++)
            {
                DdlStockist.Items[i].Selected = false;
            }
        }
        public  void UnselectDdlChemist()
        {
            for (int i = 0; i < DdlChemist.Items.Count; i++)
            {
                DdlChemist.Items[i].Selected = false;
            }
        }
        public void SetSelectedItemInListBoxControl(ListBox listBox, String str_text)
        {
            string[] str_items = str_text.Split(',');

            for (int i = 0; i < str_items.Length; i++)
            {
                for (int j = 0; j < listBox.Items.Count; j++)
                {
                    if (str_items[i].ToString().Trim() == listBox.Items[j].Text.ToString().Trim())
                    {
                        listBox.Items[j].Selected = true;
                    }
                }
            }
        }
      
        protected void A_BtnSearchAppointmentId_serverclick(object sender,EventArgs e)
        {
            txtAppointmentId_TextChanged(sender, e);
        }
        protected async void txtAppointmentId_TextChanged(object sender, EventArgs e)
        {
            try
            {               
                string spname = "CRUD_ABM_Appointments";
                BtnSave.Text = "Modify";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "GET_BY_ID"),
                    new SqlParameter("@Id", Convert.ToInt32( txtAppointmentId.Text.Trim()))
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
                    {
                        //clear all then bind again
                        //txtAppointmentId.Text = string.Empty;
                        //txtDate.Text = string.Empty;                       
                        //DdlDoctor.ClearSelection();
                        //DdlChemist.ClearSelection();
                        //DdlStockist.ClearSelection();
                        //txtAreaLocation.Text = string.Empty;
                        //txtNotes.Text = string.Empty;

                        UnselectDdlDoctor();
                        UnselectDdlChemist();
                        UnselectDdlStockist();

                        // txtUserId.Text = dt.Rows[0]["UserId"].ToString();
                        txtAppointmentId.Text = dt.Rows[0]["Id"].ToString();
                        txtDate.Text = dt.Rows[0]["Date"].ToString();

                        //set values/texts for listbox/DDl = Doctor
                        hfDdlDoctorSelectedTexts.Value = dt.Rows[0]["DoctorName"].ToString();

                        string str_hfDdlDoctorSelectedTexts = hfDdlDoctorSelectedTexts.Value;

                        SetSelectedItemInListBoxControl(DdlDoctor, str_hfDdlDoctorSelectedTexts);

                        //for (int i = 0; i < DdlDoctor.Items.Count; i++)
                        //{
                        //    if (str_hfDdlDoctorSelectedTexts.Contains(DdlDoctor.Items[i].ToString()))
                        //    {
                        //        DdlDoctor.Items[i].Selected = true;
                        //    }

                        //}

                        //foreach (System.Web.UI.WebControls.ListItem item in DdlDoctor.Items)
                        //{                           
                        //    if (str_hfDdlDoctorSelectedTexts.Contains(item.Text))
                        //    {
                        //        item.Selected = true;
                        //    }
                        //}

                        //set values/texts for listbox/DDl = ChemistName
                        hfDdlChemistSelectedTexts.Value = dt.Rows[0]["ChemistName"].ToString();

                        string str_hfDdlChemistSelectedTexts = hfDdlChemistSelectedTexts.Value;

                        SetSelectedItemInListBoxControl(DdlChemist, str_hfDdlChemistSelectedTexts);

                        //for (int i = 0; i < DdlChemist.Items.Count ; i++)
                        //{
                        //    if (str_hfDdlChemistSelectedTexts.Contains(DdlChemist.Items[i].ToString()))
                        //    {
                        //        DdlChemist.Items[i].Selected = true;
                        //    }
                        //}

                        //foreach (System.Web.UI.WebControls.ListItem item in DdlChemist.Items)
                        //{
                        //    if (str_hfDdlChemistSelectedTexts.Contains(item.Text))
                        //    {
                        //        item.Selected = true;
                        //    }
                        //}

                        //set values/texts for listbox/DDl = StockistName
                        hfDdlStockistSelectedTexts.Value = dt.Rows[0]["StockistName"].ToString();

                        string str_hfDdlStockistSelectedTexts = hfDdlStockistSelectedTexts.Value;

                        SetSelectedItemInListBoxControl(DdlStockist, str_hfDdlStockistSelectedTexts);

                        //for (int i = 0; i < DdlStockist.Items.Count; i++)
                        //{
                        //    if (str_hfDdlStockistSelectedTexts.Contains(DdlStockist.Items[i].ToString()))
                        //    {
                        //        DdlStockist.Items[i].Selected = true;
                        //    }
                        //}

                        //foreach (System.Web.UI.WebControls.ListItem item in DdlStockist.Items)
                        //{
                        //    if (str_hfDdlStockistSelectedTexts.Contains(item.Text))
                        //    {
                        //        item.Selected = true;
                        //    }
                        //}

                        // DdlDoctor.SelectedValue = dt.Rows[0]["DoctorName"].ToString();
                        //DdlChemist.SelectedValue = dt.Rows[0]["ChemistName"].ToString();
                        //DdlStockist.SelectedValue = dt.Rows[0]["StockistName"].ToString();
                        txtAreaLocation.Text = dt.Rows[0]["Area_Location"].ToString();
                        txtNotes.Text = dt.Rows[0]["Note"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["CreatedBy"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["CreateDate_Time"].ToString();
                        //CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedBy"].ToString();
                       // CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["ModifiedDate_Time"].ToString();
                       // CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["Workstation"].ToString();

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
                    BtnReset_Click(sender, e);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtAppointmentId_TextChanged", "alert('Data Not Present !');", true);
                }
            }
            catch
            {
                throw;
            }
        }
        protected async void txtDate_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                    new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_Appointments"),
                    new SqlParameter("@Date",  txtDate.Text.Trim())
                };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
                    {
                        txtDate.Text = dt.Rows[0]["Date"].ToString();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtDate_TextChanged", "alert('Same Client Name Is Already Exists !');", true);
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
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                     new SqlParameter("@CRUD_Action", "CHECK_ID_EXISTS"),
                     new SqlParameter("@Id", Convert.ToInt32( txtAppointmentId.Text.Trim())),
 		            //new SqlParameter("@Client_Name", txtClientName.Text.Trim())
 	            };

                DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Id"].ToString() != "")
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
        public string GetDdlControl(ListBox ddl)
        {
            string Str_Ddltxt = String.Empty;
            int i = 0;

            foreach (System.Web.UI.WebControls.ListItem item in ddl.Items)
            {                               
                if(i == 1)
                {
                    if (item.Selected)
                    {
                        Str_Ddltxt = Str_Ddltxt + "," + item.Text.Trim();
                    }
                }
                if (i == 0)
                {
                    if (item.Selected)
                    {
                        i = 1;

                        Str_Ddltxt = item.Text.Trim();

                        //string selectedValue = item.Value; // Selected value
                        //string selectedText = item.Text;  // Selected text

                        // Example: Print selected items
                        //Response.Write($"Selected Value: {selectedValue}, Selected Text: {selectedText}<br />");
                    }
                }
            }

            return Str_Ddltxt;

        }
        protected async void BtnSave_Click(object sender, EventArgs e)
        {
            Task<bool> ClientExist = CheckClientExistOrNot();

            try
            {
                string spname = "CRUD_ABM_Appointments";
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

                //string str_DdlDoctor = GetDdlControl(DdlDoctor);
                //string str_DdlChemist = GetDdlControl(DdlChemist);
                //string str_DdlStockist = GetDdlControl(DdlStockist);

                string str_DdlDoctor = hfDdlDoctorSelectedTexts.Value.Trim();
                string str_DdlChemist = hfDdlChemistSelectedTexts.Value.Trim();
                string str_DdlStockist = hfDdlStockistSelectedTexts.Value.Trim();

                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", CRUD_Action),

                new SqlParameter("@Id" , Convert.ToInt32(txtAppointmentId.Text.Trim())),
                new SqlParameter("@Date" , txtDate.Text.Trim()),
                new SqlParameter("@DoctorName" ,str_DdlDoctor ),
                new SqlParameter("@ChemistName" ,str_DdlChemist ),
                new SqlParameter("@StockistName" ,str_DdlStockist ),
                new SqlParameter("@Area_Location" , txtAreaLocation.Text.Trim()),
                new SqlParameter("@Note" , txtNotes.Text.Trim()),
                new SqlParameter("@CreatedBy" ,CreatedBy ), 
                //new SqlParameter("@CreateDate_Time" , "CreateDate_Time"),
                new SqlParameter("@ModifiedBy" , ModifiedBy),
               // new SqlParameter("@ModifiedDate_Time" , "ModifiedDate_Time"),
                //new SqlParameter("@Workstation" , "Workstation")

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
                string spname = "CRUD_ABM_Appointments";
                SqlParameter[] parameters = {
                new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),                
		        new SqlParameter("@Id" , Convert.ToInt32(txtAppointmentId.Text.Trim()))
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
        public void ClearAll()
        {           
            txtAppointmentId.Text = string.Empty;
            txtDate.Text = string.Empty;

            DdlDoctor.DataSource = null;
            DdlDoctor.DataBind();

            DdlDoctor.ClearSelection();

            DdlChemist.DataSource = null;
            DdlChemist.DataBind();

            DdlChemist.ClearSelection();

            DdlStockist.DataSource = null;
            DdlStockist.DataBind();

            DdlStockist.ClearSelection();

            txtAreaLocation.Text = string.Empty;
            txtNotes.Text = string.Empty;
        }

        //protected void RadComboBox1_DataBound(object sender, EventArgs e)
        //{
        //    //set the initial footer label
        //    ((Literal)RadDdlDoctor.Footer.FindControl("RadComboItemsCount")).Text = Convert.ToString(RadComboBox1.Items.Count);
        //}
        //protected void RadComboBox1_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        //{
        //    //get all customers whose name starts with e.Text
        //    string sql = "SELECT * from Customers WHERE ContactName LIKE '" + e.Text + "%'";

        //    SessionDataSource1.SelectCommand = sql;

        //    RadDdlDoctor.DataBind();
        //}

    }
}