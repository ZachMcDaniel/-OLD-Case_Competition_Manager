using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CaseCompetitionApp
{
    public partial class EventInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            LblBox1.Text = Application["Box1"].ToString();
            LblBox2.Text = Application["Box2"].ToString();
            LblBox3.Text = Application["Box3"].ToString();
        

            string CS = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT EventID, EventName, EventDate, EventStartTime, EventEndTime, EventLocation, EventDescription, EventSpeaker FROM EventInfo", con);
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    GridView1.Visible = true;
                }

            }

        }
    }
}