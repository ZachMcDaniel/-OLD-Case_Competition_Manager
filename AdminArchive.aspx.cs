using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaseCompetitionApp
{
    public partial class AdminArchive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    gvCompete.DataKeys.Value;
        //    SqlCompetition.SelectParameters["ID"].DefaultValue = 
        //
        }

        protected void Btn_Archive(object sender, EventArgs e)
        {
           

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            SqlCommand sqlcomm = new SqlCommand();

            string check = "SELECT TeamID FROM TEAM WHERE CompetitionID IS NULL;";
            SqlCommand command = new SqlCommand(check, con);

            SqlDataReader reader = command.ExecuteReader();
            if (!reader.Read())
            {
                lblEmpty.Text = "No new competitions to archive";
            }
            else
            {

                string insertSql = "INSERT INTO [Competition](CompetitionName, CompetitionDate) OUTPUT INSERTED.CompetitionID VALUES (@CompetitionName, @CompetitionDate);";
                SqlCommand cmd = new SqlCommand(insertSql, con);

                cmd.Parameters.AddWithValue("@CompetitionName", txtCompetition.Text);
                cmd.Parameters.AddWithValue("@CompetitionDate", txtDate.Text);

                var CompetitionID = (int)cmd.ExecuteScalar();

                string insertID = "UPDATE TEAM SET CompetitionID = @CompetitionID WHERE CompetitionID IS NULL;";
                SqlCommand comd = new SqlCommand(insertID, con);

                comd.Parameters.AddWithValue("@CompetitionID", CompetitionID);

                comd.ExecuteScalar();

                string insertjudgeID = "UPDATE Judges SET CompetitionID = @CompetitionID WHERE CompetitionID IS NULL;";
                SqlCommand cmnd = new SqlCommand(insertjudgeID, con);

                cmnd.Parameters.AddWithValue("@CompetitionID", CompetitionID);

                cmnd.ExecuteScalar();

                Response.Redirect("Archive.aspx");
            }


        }


        //protected void linkUnarchive_Click(object sender, EventArgs e)
        //{
        //    LinkButton btn = (LinkButton)sender;

        //    //Get the row that contains this button
        //    GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        //    HiddenField hdnDataId = (HiddenField)gvr.FindControl("CompetitionId");
        //    int index = Convert.ToInt32(gvr.RowIndex);

        //    GridViewRow selectedRow = gvCompete.Rows[index];

        //    Label1.Text = Convert.ToString(selectedRow.DataItem.T
        //}



        //protected void gvCompete_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    // If multiple ButtonField column fields are used, use the
        //    // CommandName property to determine which button was clicked.
        //    if (e.CommandName == "Select")
        //    {
        //        // Convert the row index stored in the CommandArgument
        //        // property to an Integer.
        //        int index = Convert.ToInt32(e.CommandArgument);

        //        // Get the last name of the selected author from the appropriate
        //        // cell in the GridView control.
        //        GridViewRow selectedRow = gvCompete.Rows[index];

        //        Label1.Text = Convert.ToString(selectedRow.Cells[1].Text);
        //    }
        //}
    }
}