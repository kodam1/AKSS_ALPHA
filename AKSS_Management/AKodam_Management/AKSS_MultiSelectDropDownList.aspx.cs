using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKSS_Management.AKodam_Management
{
    public partial class AKSS_MultiSelectDropDownList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //***********set items************
                //hfSelectedTexts.Value= "Nikunj Satasiya,Ronak Rabadiya, Hiren Dobariya,Kishan Patel";

                //string selectedValues = hfSelectedTexts.Value;

                //foreach (ListItem item in ddlItems.Items)
                //{
                //    //if (selectedValues.Contains(item.Value))
                //    //{
                //    //    item.Selected = true;
                //    //}

                //    if (selectedValues.Contains(item.Text))
                //    {
                //        item.Selected = true;
                //    }

                //}

                ddlItems.ClearSelection();

            }
        }

        //protected void Submit(object sender, EventArgs e)
        //{
        //    //string message = "";
        //    //foreach (ListItem item in ddlItems.Items)
        //    //{
        //    //    if (item.Selected)
        //    //    {
        //    //        message += item.Text + " " + item.Value + "\\n";
        //    //    }
        //    //}
        //    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);

        //    // List to store all selected item texts

        //    List<string> selectedTexts = new List<string>();

        //    // Iterate through the items in the DropDownList
        //    foreach (ListItem item in ddlItems.Items)
        //    {
        //        if (item.Selected) // Check if the item is selected
        //        {
        //            selectedTexts.Add(item.Text); // Add the selected text to the list
        //        }
        //    }

        //    // Example: Display the selected texts (comma-separated)
        //    string result = string.Join(", ", selectedTexts);
        //   // Response.Write($"Selected Items: {result}");

        //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + result + "');", true);

        //}

        protected void btnGetSelected_Click(object sender, EventArgs e)
        {
            //***********get items************
            // Get the selected texts from the hidden field
            string selectedTexts = hfSelectedTexts.Value;

            // Example: Display selected texts
            //Response.Write($"Selected Items: {selectedTexts}");

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + selectedTexts + "');", true);

        }

        protected void AddCustomItem_Click(object sender, EventArgs e)
        {
            // Example: Add a custom item to the ListBox
            string customText = txtCustomItem.Text.Trim(); // Text from a TextBox
            string customValue = Guid.NewGuid().ToString(); // Use a unique value

            if (!string.IsNullOrEmpty(customText))
            {
                ddlItems.Items.Add(new ListItem(customText, customValue));
            }
        }

        /*
         
        <asp:ListBox ID="lstItems" runat="server" SelectionMode="Multiple" CssClass="multi-select"></asp:ListBox>

<!-- Input for adding a custom item -->
<asp:TextBox ID="txtCustomItem" runat="server" Placeholder="Enter custom item"></asp:TextBox>
<asp:Button ID="btnAddCustom" runat="server" Text="Add Item" OnClick="AddCustomItem_Click" />

        for dropdown item
        protected void AddCustomItem_Click(object sender, EventArgs e)
{
    string customText = txtCustomItem.Text.Trim();
    string customValue = Guid.NewGuid().ToString();

    if (!string.IsNullOrEmpty(customText))
    {
        ddlItems.Items.Add(new ListItem(customText, customValue));

        // Optionally store the custom item in ViewState or a database
    }

    // Trigger the Select2 update on the client
    ScriptManager.RegisterStartupScript(this, GetType(), "refreshSelect2", "$('#ddlItems').trigger('change');", true);
}


         */

    }
}