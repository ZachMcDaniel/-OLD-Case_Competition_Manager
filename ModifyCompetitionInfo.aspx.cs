using System;
using System.Collections.Generic;
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
                gvMember.Visible = false;
                gvJudge.Visible = false;
            }
        }


        protected void BTNClickTeamInfo(object sender, EventArgs e)
        {
            gvCompete.Visible = true;
            gvMember.Visible = false;
            gvJudge.Visible = false;
            //"add the other gv ids as false under this btn"
            BTNTeamInfo.Style.Add("background-color", "rgba(255, 223, 0, 0.75)");
            BTNTeamInfo.Style.Add("font-weight", "bold");
            BTNMemberInfo.Style.Remove("background-color");
            BTNMemberInfo.Style.Remove("font-weight");
            BTNJudgeInfo.Style.Remove("background-color");
            BTNJudgeInfo.Style.Remove("font-weight");

        }
        protected void BTNClickMemberInfo(object sender, EventArgs e)
        {
            gvCompete.Visible = false;
            gvMember.Visible = true;
            gvJudge.Visible = false;
            //"add the other gv ids as false under this btn"
            BTNMemberInfo.Style.Add("background-color", "rgba(255, 223, 0, 0.75)");
            BTNMemberInfo.Style.Add("font-weight", "bold");
            BTNTeamInfo.Style.Remove("background-color");
            BTNTeamInfo.Style.Remove("font-weight");
            BTNJudgeInfo.Style.Remove("background-color");
            BTNJudgeInfo.Style.Remove("font-weight");

        }

        protected void BTNClickJudgeInfo(object sender, EventArgs e)
        {
            gvCompete.Visible = false;
            gvMember.Visible = false;
            gvJudge.Visible = true;
            //"add the other gv ids as false under this btn"
            BTNJudgeInfo.Style.Add("background-color", "rgba(255, 223, 0, 0.75)");
            BTNJudgeInfo.Style.Add("font-weight", "bold");
            BTNTeamInfo.Style.Remove("background-color");
            BTNTeamInfo.Style.Remove("font-weight");
            BTNMemberInfo.Style.Remove("background-color");
            BTNMemberInfo.Style.Remove("font-weight");

        }
    }
}