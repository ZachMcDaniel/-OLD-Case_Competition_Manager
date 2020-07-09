using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaseCompetitionApp
{
    public partial class TeamMGMT : System.Web.UI.Page
    {

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    //if this is the first time loading the page, bind the grid
        //    if (!IsPostBack)
        //        BindData();
        //    else
        //        //dynamic controls should be created on every postback.               
        //        CreateDynamicControls();
        //}
        //private void BindData()
        //{
        //    //Bind the grid view
        //    gvTeam.DataSource = RetrieveProducts();
        //    gvTeam.DataBind();
        //}


        //private DataSet RetrieveProducts()
        //{
        //    var userID = User.Identity.GetUserId();

        //    string user = Convert.ToString(userID);

        //    //fetch the connection string from web.config
        //    string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        //    //SQL statement to fetch entries from products
        //    string sql = @"select FirstName, LastName, Email, FoodAllergy, ShirtSize, PhoneNumber, CASE WHEN Vegan = 1 THEN 'Yes' ELSE 'No' END AS Vegan From [Members] where TeamID = (select TeamID FROM TEAM where TeamName = (select Username FROM AspNetUsers where Id = @ID))";

        //    DataSet dsTeam = new DataSet();
        //    //Open SQL Connection
        //    using (SqlConnection conn = new SqlConnection(connString))
        //    {
        //        conn.Open();
        //        //Initialize command object
        //        using (SqlCommand cmd = new SqlCommand(sql, conn))
        //        {
        //            cmd.Parameters.AddWithValue("@ID", user);
        //            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //            //Fill the result set
        //            adapter.Fill(dsTeam);
        //        }
        //    }
        //    return dsTeam;
        //}

        //private void CreateDynamicControls()
        //{
        //    //as mentioned above dynamic controls needs to be created on postback
        //    GridViewRow selRow = null;

        //    //iterate through all rows and find of the row that is in edit mode
        //    // that it our current row
        //    foreach (GridViewRow row in gvTeam.Rows)
        //    {
        //        if (row.RowState == DataControlRowState.Edit)
        //        {
        //            selRow = row;
        //            break;
        //        }
        //    }
        //    if (selRow == null)
        //        return;

        //    //fetch product categories from database
        //    DataTable dtCategories = RetrieveCategories();

        //    //get reference to placholder in the selected row           
        //    PlaceHolder pl = (PlaceHolder)selRow.FindControl("plVegan");
        //    if (pl.Controls.Count > 0)
        //        return;

        //    //get the reference to the hidden field where we are storing the previous product
        //    //category selection
        //    HiddenField hflProductCategoryID = (HiddenField)selRow.FindControl("hflVegan");

        //    bool isSelected = false;
        //    //iterate through all the rows and add them as radiobuttons to the placeholder
        //    foreach (DataRow dr in dtCategories.Rows)
        //    {
        //        isSelected = false;
        //        if (hflProductCategoryID.Value == dr["Vegan"].ToString())
        //            isSelected = true;
        //        pl.Controls.Add(CreateRadioButton(dr, isSelected));
        //    }
        //}

        //private RadioButton CreateRadioButton(DataRow dr, bool isSelected)
        //{
        //    //Create a new web radio button control
        //    RadioButton radioButton = new RadioButton();

        //    //set the text to product category name           
        //    radioButton.Text = dr["CategoryName"].ToString();

        //    //appending a line break so that each control will be rendered in new line           
        //    radioButton.Text += "<br>";

        //    //shorcut (hotkey) is set to the first character of the name
        //    radioButton.AccessKey = radioButton.Text.Substring(0, 1);

        //    //id of the control is set to the product category id
        //    radioButton.ID = dr["ProductCategoryID"].ToString() + "_" + "category";

        //    //all radio buttons in the row are set to the same group to make them
        //    //mutually aggressive
        //    radioButton.GroupName = "grpCategories";

        //    //when user changes the selection, we would post back to the server to reload
        //    //subcategories dropdown based on category selected
        //    radioButton.AutoPostBack = true;
        //    radioButton.CheckedChanged += new EventHandler(radioButton_CheckedChanged);

        //    //set the current selection
        //    radioButton.Checked = isSelected;

        //    return radioButton;
        //}

        //protected void gvTeam_RowEditing(object sender,
        //                                GridViewEditEventArgs e)
        //{
        //    gvTeam.EditIndex = e.NewEditIndex;
        //    BindData();
        //}
        //protected void gvTeam_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        //check if is in edit mode
        //        if ((e.Row.RowState & DataControlRowState.Edit) > 0)
        //        {
        //            DataRowView drv = e.Row.DataItem as DataRowView;

        //            //fetch product categories from database
        //            DataTable dtCategories = RetrieveCategories();
        //            bool isSelected = false;
        //            //get reference to the placeholder control
        //            PlaceHolder pl = (PlaceHolder)e.Row.FindControl("plCategories");

        //            //iterate through all the rows and add them as radiobuttons to the placeholder
        //            foreach (DataRow dr in dtCategories.Rows)
        //            {
        //                isSelected = false;
        //                if (drv["ProductCategoryID"].ToString() == dr["ProductCategoryID"].ToString())
        //                    isSelected = true;
        //                pl.Controls.Add(CreateRadioButton(dr, isSelected));
        //            }

        //            //get reference to the subcategories dropdown
        //            DropDownList ddlSubCategories = (DropDownList)e.Row.FindControl("ddlSubCategories");

        //            //Bind subcategories data to dropdownlist
        //            ddlSubCategories.DataTextField = "SubCategoryName";
        //            ddlSubCategories.DataValueField = "ProductSubcategoryID";
        //            ddlSubCategories.DataSource = RetrieveSubCategories(drv["ProductCategoryID"].ToString());
        //            ddlSubCategories.DataBind();

        //            //get the selected value of the dropdown to the productsubcategoryid of the current row
        //            ddlSubCategories.SelectedValue = drv["ProductSubCategoryID"].ToString();
        //        }
        //    }
        //}
        //private DataTable RetrieveSubCategories(string categoryID)
        //{
        //    //fetch the connection string from web.config
        //    string connString = ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
        //    //SQL statement to fetch prodyct subcategories
        //    string sql = @"Select ProductSubcategoryID, Name as SubCategoryName
        //from Production.ProductSubcategory where ProductCategoryID = " + categoryID;
        //    DataTable dtSubCategories = new DataTable();
        //    //Open SQL Connection
        //    using (SqlConnection conn = new SqlConnection(connString))
        //    {
        //        conn.Open();
        //        //Initialize command object
        //        using (SqlCommand cmd = new SqlCommand(sql, conn))
        //        {
        //            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //            //Fill the result set
        //            adapter.Fill(dtSubCategories);
        //        }
        //    }
        //    return dtSubCategories;

        //}

        //private DataTable RetrieveCategories()
        //{
        //    //fetch the connection string from web.config
        //    string connString = ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
        //    //SQL statement to fetch product categories
        //    string sql = @"SELECT PC.ProductCategoryID, PC.Name as CategoryName  FROM Production.ProductCategory PC";
        //    DataTable dtCategories = new DataTable();
        //    //Open SQL Connection
        //    using (SqlConnection conn = new SqlConnection(connString))
        //    {
        //        conn.Open();
        //        //Initialize command object
        //        using (SqlCommand cmd = new SqlCommand(sql, conn))
        //        {
        //            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //            //Fill the result set
        //            adapter.Fill(dtCategories);
        //        }
        //    }
        //    return dtCategories;
        //}

        //protected void radioButton_CheckedChanged(object sender, EventArgs e)
        //{
        //    //get the reference to the gridreview on which the radibutton is clicked
        //    GridViewRow gvrow = (GridViewRow)((RadioButton)sender).NamingContainer;

        //    //iterate through all the controls in the row and get the product subcategory id
        //    // of the current roe
        //    string productCategoryID = RetrieveSelectedCategoryID(gvrow);

        //    //store the current selection in hidden field which will be used
        //    // in CreateDynamicControls function to select the right radiobutton
        //    HiddenField hflProductCategoryID = (HiddenField)gvrow.FindControl("hflProductCategoryID");
        //    hflProductCategoryID.Value = productCategoryID;

        //    //get reference to the subcategories dropdown list of the current row
        //    DropDownList ddlSubCategories = (DropDownList)gvrow.FindControl("ddlSubCategories");

        //    //clear the previous selection
        //    ddlSubCategories.Items.Clear();
        //    ddlSubCategories.SelectedValue = null;

        //    //rebind the list with subcategories (filtered by category selected by user)
        //    ddlSubCategories.DataTextField = "SubCategoryName";
        //    ddlSubCategories.DataValueField = "ProductSubcategoryID";
        //    ddlSubCategories.DataSource = RetrieveSubCategories(productCategoryID);
        //    ddlSubCategories.DataBind();
        //}

        //private string RetrieveSelectedCategoryID(GridViewRow row)
        //{
        //    //get the reference to the placeholder control which holds all the categories raditobuttons
        //    PlaceHolder ph = (PlaceHolder)row.FindControl("plCategories");
        //    string id = "-1";

        //    //iterate through all the controls to find the selected radiobutton
        //    foreach (Control ctrl in ph.Controls)
        //    {
        //        if (ctrl is RadioButton)
        //        {
        //            if (((RadioButton)ctrl).Checked)
        //            {
        //                //the ID of radio button is set in the {ID_category} pattern
        //                //get the ID from the string and return it
        //                id = (ctrl as RadioButton).ID;
        //                return id.Substring(0, id.IndexOf("_"));
        //            }
        //        }
        //    }
        //    return id;
        //}

        //protected void gvTeam_RowUpdating(Object sender,
        //                                GridViewUpdateEventArgs e)
        //{
        //    // Get the product id of the selected product   
        //    string productID = gvTeam.DataKeys[e.RowIndex].Value.ToString();

        //    // Get the GridViewRow object that represents the row being edited
        //    // from the Rows collection of the GridView control.           
        //    GridViewRow row = gvTeam.Rows[e.RowIndex];

        //    // Get the controls that contain the updated values. In this
        //    // example, the updated values are contained in the TextBox
        //    // controls declared in the edit item templates of each TemplateField
        //    // column fields in the GridView control.
        //    TextBox txtProductNumber = (TextBox)row.FindControl("txtProductNumber");
        //    TextBox txtProductName = (TextBox)row.FindControl("txtProductName");
        //    DropDownList ddlSubCategories = (DropDownList)row.FindControl("ddlSubCategories");
        //    TextBox txtListPrice = (TextBox)row.FindControl("txtListPrice");
        //    //update the product
        //    UpdateProduct(productID, txtProductName.Text,
        //                                ddlSubCategories.SelectedValue,
        //                                txtListPrice.Text);
        //    gvTeam.EditIndex = -1;
        //    BindData();
        //}

        //private void UpdateProduct(string productID,
        //                string productName, string subCategoryID, string listPrice)
        //{
        //    //fetch the connection string from web.config
        //    string connString =
        //           ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
        //    //SQL statement to update a product
        //    string sql = String.Format(@"Update Production.Product set Name='{0}'                                   
        //        ,ProductSubcategoryID={1}
        //        ,ListPrice ={2}
        //        where ProductID = {3}",
        //                                    productName,
        //                                    subCategoryID,
        //                                    listPrice, productID);
        //    using (SqlConnection conn = new SqlConnection(connString))
        //    {
        //        conn.Open();
        //        //Initialize command object
        //        using (SqlCommand cmd = new SqlCommand(sql, conn))
        //        {
        //            cmd.ExecuteNonQuery();
        //        }
        //    }
        //}


        protected void Page_Load(object sender, EventArgs e)
        {
            var userID = User.Identity.GetUserId();

            string user = Convert.ToString(userID);

            if (!IsPostBack)
            {
                clearfields();
                SqlDataSource1.SelectParameters["ID"].DefaultValue = user;
                NewMember.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var userID = User.Identity.GetUserId();

                string user = Convert.ToString(userID);

                string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                SqlCommand sqlcomm = new SqlCommand();
                string insertSql = "INSERT INTO [MEMBERS](TeamID, FirstName, LastName, PhoneNumber, Email, ShirtSize, Vegan) OUTPUT INSERTED.MemberID VALUES ((select TeamID FROM TEAM where TeamName = (select Username FROM AspNetUsers where Id = @TeamId)), @FirstName,@LastName,@PhoneNumber, @Email, @ShirtSize, @Vegan);";
                SqlCommand cmd = new SqlCommand(insertSql, con);

                cmd.Parameters.AddWithValue("@TeamID", user);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLName.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@ShirtSize", txtShirt.Text);
                cmd.Parameters.AddWithValue("@Vegan", rbtnVegan.SelectedValue);

                var MemberID = (int)cmd.ExecuteScalar();

                Response.Redirect("TeamMGMT.aspx");
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearfields();
        }

        protected void clearfields()
        {
            txtFirstName.Text = "";
            txtLName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtShirt.Text = "";
            txtfood.Text = "";
            rbtnVegan.ClearSelection();
        }

        protected void BtnAddMember_Click(object sender, EventArgs e)
        {
            NewMember.Visible = true;
        }


    }
}