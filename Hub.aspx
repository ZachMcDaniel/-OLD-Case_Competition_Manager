<%@ Page Title="The Hub" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hub.aspx.cs" Inherits="CaseCompetitionApp.Hub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <H2 class="center gold">
        Competition Hub
    </H2>
    <h3 class="center">
        Access to all team and case information
    </h3>
    <br />
      <asp:LoginView runat="server">     
         <RoleGroups>       
             <asp:RoleGroup Roles="competitor">  
            <ContentTemplate>
       <div class="row">
    <div class="center">
                         <div class="col-md-3">
                             <h4>
                                To Access Team Material and Submission Folder
                             </h4>                        
                             <p>
                                 1.) At the start of your session refer to team registered <br /> email and follow dropbox link                                                                 
                             </p>
                             <p>
                                 2.) This folder contains competition files, and will act as your submission folder
                             </p>
                             <p>
                                 3.) At the end of the alloted time please drag and drop your team's presentation to the same folder
                             </p>
                         </div>
                            </div> 
                     </div>
     </ContentTemplate>        
             </asp:RoleGroup>   
         </RoleGroups></asp:LoginView>

     <div class="col-md-12">
        <hr style="border: .25px solid rgb(0,0,0)" />
   </div>
  
    <div class="center">
    <asp:LoginView runat="server">     
         <RoleGroups>       
             <asp:RoleGroup Roles="admin">           
                 <ContentTemplate>
                      <div class="col-md-3">
                     <asp:Button ID="BTNCompetitionInfo" runat="server" Text="Modify Competition Info"  OnClick="BTNModifyCompetitionInfo" Class="btn btn-default wide grey"/>
                         </div>
                     <div class="col-md-3">
                     <asp:Button ID="BTNAnnounce" runat="server" Text="Modify Announcements"  OnClick="BTNAnnounce_Click" Class="btn btn-default wide grey"/>
                         </div>
                     <div class="col-md-3">
                     <asp:Button ID="BTNDownCaseFile" runat="server" Text="Download Submissions"  OnClick="BTNDownCaseFile_Click" Class="btn btn-default wide grey"/>
                         </div>
                    
                 </ContentTemplate>        
             </asp:RoleGroup>   
         </RoleGroups></asp:LoginView>

      <asp:LoginView runat="server">    
         <RoleGroups>       
             <asp:RoleGroup Roles="judge">           
                 
                 <ContentTemplate>   
                     <div class="col-md-12">
                     <asp:Button ID="BTNFileReview" runat="server" Text="File Review"  OnClick="BTNFileReview_Click" Class="btn btn-default wide grey"/>
                         </div>
                 </ContentTemplate>        

             </asp:RoleGroup>   
         </RoleGroups></asp:LoginView>
      
    <asp:LoginView runat="server">    
         <RoleGroups>       
             <asp:RoleGroup Roles="competitor">           
                 
                 <ContentTemplate> 
                    
                      <asp:Button ID="BTNTeamMGMT" runat="server" Text="Team Managment"  OnClick="BTNTeamMGMT_Click" Class="btn btn-default wide grey"/>
                        </div>
                      <div class="center">
                  
                      <div class="col-md-12">
                     <%-- <div class="col-md-4">
                      <asp:Button ID="BTNDeliverables" runat="server" Text="Download Case Files"  OnClick="BTNDeliverables_Click" Class="btn btn-default wide grey "/>
                          </div>
                      <div class="col-md-4">
                      <asp:Button ID="BTNSubmissions" runat="server" Text="Upload Submissions"  OnClick="BTNSubmissions_Click" Class="btn btn-default wide grey"/>
                          </div>--%>
                          </div>
                 </ContentTemplate>        

             </asp:RoleGroup>   
         </RoleGroups></asp:LoginView>
    </div>
   
</asp:Content>
