using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaseCompetitionApp
{
    public partial class Archive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Btn_Archive(object sender, EventArgs e)
        {
            TextBox txtCompetition = (TextBox)adminArchives.FindControl("txtCompetition");
            TextBox txtDate = (TextBox)adminArchives.FindControl("txtDate");
            Label lblEmpty = (Label)adminArchives.FindControl("lblEmpty");


            

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

        
    }
}