using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaseCompetitionApp
{
    public partial class AdminAnnounce : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clearfields();
            }
        }

        protected void btnNewsClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Timestamp = DateTime.Now.ToString();

                string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                SqlCommand sqlcomm = new SqlCommand();
                string insertSql = "INSERT INTO [News](Feed, NewsTime) OUTPUT INSERTED.NewsId VALUES (@Feed, @TimeStamp);";
                SqlCommand cmd = new SqlCommand(insertSql, con);

                cmd.Parameters.AddWithValue("@Feed", txtNews.Text);
                cmd.Parameters.AddWithValue("@TimeStamp", Timestamp);

                var NewsId = (int)cmd.ExecuteScalar();

                Response.Redirect("AdminAnnounce.aspx");
            }

        }

            protected void btnClear_Click(object sender, EventArgs e)
            {
                clearfields();
            }

            protected void clearfields()
            {
            txtNews.Text = "";
            }

        protected void btnDrop_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string deleteSql = "DELETE FROM News;";
            SqlCommand cmd = new SqlCommand(deleteSql, con);

            cmd.ExecuteScalar();

            Response.Redirect("AdminAnnounce.aspx");
        }

        //void AuthorsGridView_RowUpdating(Object sender, GridViewUpdateEventArgs e)
        //{

        //    // The GridView control does not automatically extract updated values 
        //    // from TemplateField column fields. These values must be added manually 
        //    // to the NewValues dictionary.

        //    // Get the GridViewRow object that represents the row being edited
        //    // from the Rows collection of the GridView control.
        //    int index = GVNews.EditIndex;
        //    GridViewRow row = GVNews.Rows[index];

        //    // Get the controls that contain the updated values. In this
        //    // example, the updated values are contained in the TextBox 
        //    // controls declared in the edit item templates of each TemplateField 
        //    // column fields in the GridView control.
        //    TextBox Feed = (TextBox)row.FindControl("txtFeed");

        //    // Add the updated values to the NewValues dictionary. Use the
        //    // parameter names declared in the parameterized update query 
        //    // string for the key names.
        //    e.NewValues["Feed"] = Feed.Text;
        //}
    }
}