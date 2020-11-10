<%@ Page Title="Hub" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hub.aspx.cs" Inherits="CaseCompetitionApp.Hub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <H2 class="center gold">
        Competition Hub
    </H2>
    <h3 class="center">
        Access to all team and case information
    </h3>
    <hr class="style-four">

    <%--Competitor view btn info--%>
     <asp:LoginView runat="server">     
         <RoleGroups>       
          <asp:RoleGroup Roles="competitor">  
                <ContentTemplate>
                    
                    <script>
                        function Time(endTime) {

                            return parseInt((endTime - (new Date().getTime())) / 1000);
                            var offset_GMT = new Date().getTimezoneOffset(); // dec utc0
                            var dec = endTime - (new Date().getTime() + offset_GMT * 60 * 1000) / 1000;//sec
                            console.log(dec);
                            return parseInt(dec);

                        }
                        Time(1604976963);

                        var _t;
                        var _h = 4;
                        var _m = 0;
                        var _s = 0;
                        var _v = formatTime("End in " + _h + ':' + _m + ':' + _s);
                        function doTime(time) {

                            var _i = Time(time);

                            _h = parseInt(_i / 3600);
                            _m = parseInt((_i - 3600 * _h) / 60);
                            _s = _i - 3600 * _h - 60 * _m;
                            var _b = _i <= 0;
                            // var _b = ((_h == 0) && (_m == 0) && (_s == 0));
                            if (_b) {
                                _v = "It's time to go!";
                                clearTimeout(_t);
                            }
                            else {
                                _v = formatTime("End in " + (_h) + ':' + (_m) + ':' + _s);
                                _t = setTimeout('doTime(' + time + ')', 1000);
                            }
                            document.all.oTime.innerHTML = _v;
                        }
                        function formatTime(_time) {
                            return _time.replace(/\b(\w)\b/g, '0$1');
                        }
                        function start_time(time) {
                            document.all.oTime.innerHTML = _v;
                            _t = setTimeout('doTime(' + time + ')', 1000);
                            document.getElementById("hide").style.display = 'none';
                        }

</script>
<span id='oTime' style="color:darkgoldenrod;font-size:20px"></span>
<div id="hide"; style="display:block;"> <input style="background-color:yellow; width: 74px; height: 39px; font-size: 20px" type="button" name="button2" value="Timer" onclick='start_time(new Date("2020-11-10 15:00:00").getTime())' > </div>
                    
                    <div class="row center">
         
                         <div class="col-md-12 left">
                             <h4>
                                To Access Team Material and Submission Folder
                             </h4>                        
                             <p class="left">
                                 1.) At the start of your session refer to team registered <br /> email and follow dropbox link                                                                 
                             </p>
                             <p class="left">
                                 2.) This folder contains competition files, and will act as your submission folder
                             </p>
                             <p class="left">
                                 3.) At the end of the alloted time please drag and drop your team's presentation to the same folder
                             </p>
                         </div> 
                     </div>
                        <div class="col-md-12">
                             <hr style="border: .25px solid rgb(0,0,0)" />
                      </div>
                </ContentTemplate>        
         </asp:RoleGroup>   
         </RoleGroups>
     </asp:LoginView>


  
    <div class="center">
    <%--Admin View--%>
    <asp:LoginView runat="server">     
         <RoleGroups>       
         <asp:RoleGroup Roles="admin">           
                 <ContentTemplate>
                         <div class ="row">
                         <br />
                     </div>
                    <div class="row">
                      <div class="col-md-4">
                        <asp:Button ID="BTNCompetitionInfo" runat="server" Text="Modify Competition Info"  OnClick="BTNModifyCompetitionInfo" Class="btn btn-default wide grey"/>
                      </div>
                     <div class="col-md-4">
                        <asp:Button ID="BTNAnnounce" runat="server" Text="Modify Announcements"  OnClick="BTNAnnounce_Click" Class="btn btn-default wide grey"/>
                     </div>
                     <div class="col-md-4">
                         <a class="btn btn-default wide grey"  href="../AdminEventInfo">Update Event Info &raquo;</a>    
                     </div>
                 </div> 

                     <div class ="row">
                         <br />
                         <br />
                       
                     </div>
                     
                <%--second row--%>   
                <div class="row">
                    <div class="col-md-4">
                         <a class="btn btn-default wide grey"  href="../CompetitorInfo">Team Info &raquo;</a>    
                    </div>
                    <div class="col-md-4">
                         <a class="btn btn-default wide grey"  href="../AdminArchive">Archive Competition &raquo;</a>    
                    </div>
                    <div class="col-md-4">
                         <a class="btn btn-default wide grey"  href="../Account/RegisterAdmin">Register Admin &raquo;</a>    
                    </div>
                </div>

               <div class="row">
                         <br />
                         <br />
                       
                     </div>

                 </ContentTemplate>        
          </asp:RoleGroup>   
         </RoleGroups>
    </asp:LoginView>

        <%--judge view--%>
      <asp:LoginView runat="server">    
         <RoleGroups>       
         <asp:RoleGroup Roles="judge">           
                 
                 <ContentTemplate>   
                     <div class="row">
                     <asp:Button ID="BTNJudgeModify" runat="server" Text="Modify Information"  OnClick="BTNJudgeModify_Click" Class="btn btn-default wide grey"/>
      
                    </div>

                 </ContentTemplate>        

         </asp:RoleGroup>   
         </RoleGroups>
       </asp:LoginView>
      
        <%--Competitor view--%>
      <asp:LoginView runat="server">    
         <RoleGroups>       
         <asp:RoleGroup Roles="competitor">           
                 <ContentTemplate>           

                    <div class="col-md-12 center">
                      <asp:Button ID="BTNTeamMGMT" runat="server" Text="Team Managment"  OnClick="BTNTeamMGMT_Click" Class="btn btn-default wide grey"/>
                        </div>                                      
            
                 </ContentTemplate>        

         </asp:RoleGroup>   
         </RoleGroups>
      </asp:LoginView>
    </div>
   
</asp:Content>
