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
    public partial class ModifyCompetitionInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvCompete.Visible = false;
                gvdropbox.Visible = false;
                gvMember.Visible = false;
                gvJudge.Visible = false;
                gvHost.Visible = false;

                empty.Visible = false;
            }
        }


        protected void BTNClickTeamInfo(object sender, EventArgs e)
        {
            gvCompete.Visible = true;
            gvdropbox.Visible = true;
            gvMember.Visible = false;
            gvJudge.Visible = false;
            gvHost.Visible = false;
            //"add the other gv ids as false under this btn"
            BTNTeamInfo.Style.Add("background-color", "rgba(255, 223, 0, 0.75)");
            BTNTeamInfo.Style.Add("font-weight", "bold");
            BTNMemberInfo.Style.Remove("background-color");
            BTNMemberInfo.Style.Remove("font-weight");
            BTNJudgeInfo.Style.Remove("background-color");
            BTNJudgeInfo.Style.Remove("font-weight");
            BTNHost.Style.Remove("background-color");
            BTNHost.Style.Remove("font-weight");

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            SqlCommand sqlcomm = new SqlCommand();

            string check = "SELECT [TeamID] FROM [TEAM] where CompetitionId IS NULL;";
            SqlCommand command = new SqlCommand(check, con);

            SqlDataReader reader = command.ExecuteReader();
            if (!reader.Read())
            {
                empty.Visible = true;
            }

            else
            {
                empty.Visible = false;
            }
        }
        protected void BTNClickMemberInfo(object sender, EventArgs e)
        {
            gvCompete.Visible = false;
            gvdropbox.Visible = false;
            gvMember.Visible = true;
            gvJudge.Visible = false;
            gvHost.Visible = false;
            //"add the other gv ids as false under this btn"
            BTNMemberInfo.Style.Add("background-color", "rgba(255, 223, 0, 0.75)");
            BTNMemberInfo.Style.Add("font-weight", "bold");
            BTNTeamInfo.Style.Remove("background-color");
            BTNTeamInfo.Style.Remove("font-weight");
            BTNJudgeInfo.Style.Remove("background-color");
            BTNJudgeInfo.Style.Remove("font-weight");
            BTNHost.Style.Remove("background-color");
            BTNHost.Style.Remove("font-weight");

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            SqlCommand sqlcomm = new SqlCommand();

            string check = "SELECT MemberID FROM [Members] join TEAM on Members.TeamID = TEAM.TeamID where CompetitionId IS NULL;";
            SqlCommand command = new SqlCommand(check, con);

            SqlDataReader reader = command.ExecuteReader();
            if (!reader.Read())
            {
                empty.Visible = true;
            }

            else
            {
                empty.Visible = false;
            }
        }

        protected void BTNClickJudgeInfo(object sender, EventArgs e)
        {
            gvCompete.Visible = false;
            gvdropbox.Visible = false;
            gvMember.Visible = false;
            gvJudge.Visible = true;
            gvHost.Visible = false;
            //"add the other gv ids as false under this btn"
            BTNJudgeInfo.Style.Add("background-color", "rgba(255, 223, 0, 0.75)");
            BTNJudgeInfo.Style.Add("font-weight", "bold");
            BTNTeamInfo.Style.Remove("background-color");
            BTNTeamInfo.Style.Remove("font-weight");
            BTNMemberInfo.Style.Remove("background-color");
            BTNMemberInfo.Style.Remove("font-weight");
            BTNHost.Style.Remove("background-color");
            BTNHost.Style.Remove("font-weight");

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            SqlCommand sqlcomm = new SqlCommand();

            string check = "SELECT [JudgeID] FROM [Judges] WHERE CompetitionID IS NULL;";
            SqlCommand command = new SqlCommand(check, con);

            SqlDataReader reader = command.ExecuteReader();
            if (!reader.Read())
            {
                empty.Visible = true;
            }

            else
            {
                empty.Visible = false;
            }
        }
        protected void BTNClickHostInfo(object sender, EventArgs e)
        {
            gvCompete.Visible = false;
            gvdropbox.Visible = false;
            gvMember.Visible = false;
            gvJudge.Visible = false;
            gvHost.Visible = true;
            //"add the other gv ids as false under this btn"
            BTNHost.Style.Add("background-color", "rgba(255, 223, 0, 0.75)");
            BTNHost.Style.Add("font-weight", "bold");
            BTNJudgeInfo.Style.Remove("background-color");
            BTNJudgeInfo.Style.Remove("font-weight");
            BTNTeamInfo.Style.Remove("background-color");
            BTNTeamInfo.Style.Remove("font-weight");
            BTNMemberInfo.Style.Remove("background-color");
            BTNMemberInfo.Style.Remove("font-weight");

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            SqlCommand sqlcomm = new SqlCommand();

            string check = "SELECT [HostID] FROM [Team_host] WHERE CompetitionID IS NULL;";
            SqlCommand command = new SqlCommand(check, con);

            SqlDataReader reader = command.ExecuteReader();
            if (!reader.Read())
            {
                empty.Visible = true;
            }

            else
            {
                empty.Visible = false;
            }
        }
        protected void UnarchiveLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminArchive.aspx");
        }
    }
}