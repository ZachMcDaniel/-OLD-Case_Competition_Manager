<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hub.aspx.cs" Inherits="CaseCompetitionApp.Hub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <H1 class="center gold">
        Competition Hub
    </H1>
    <h3 class="center">
        Access to all team and case information for competitors
    </h3>
    <br />
   
    <asp:LoginView runat="server">     
         <RoleGroups>       
             <asp:RoleGroup Roles="admin">           
                 <ContentTemplate>           
                     <asp:Button ID="BTNDeliv" runat="server" Text="Deliverable Upload"  OnClick="BTNDeliv_Click" Class="btn btn-default wide"/>
                     <asp:Button ID="BTNAnnounce" runat="server" Text="Announcements"  OnClick="BTNAnnounce_Click" Class="btn btn-default wide"/>
                     <asp:Button ID="BTNDownCaseFile" runat="server" Text="Download Case Files"  OnClick="BTNDownCaseFile_Click" Class="btn btn-default wide"/>
                 </ContentTemplate>        
             </asp:RoleGroup>   
         </RoleGroups></asp:LoginView>

      <asp:LoginView runat="server">    
         <RoleGroups>       
             <asp:RoleGroup Roles="judge">           
                 
                 <ContentTemplate>           
                     <asp:Button ID="BTNFileReview" runat="server" Text="File Review"  OnClick="BTNFileReview_Click" Class="btn btn-default wide"/>
                 </ContentTemplate>        

             </asp:RoleGroup>   
         </RoleGroups></asp:LoginView>
      
    <asp:LoginView runat="server">    
         <RoleGroups>       
             <asp:RoleGroup Roles="competitor">           
                 
                 <ContentTemplate>           
                      <asp:Button ID="BTNTeamMGMT" runat="server" Text="Team Managment"  OnClick="BTNTeamMGMT_Click" Class="btn btn-default wide"/>
                      <asp:Button ID="BTNDeliverables" runat="server" Text="Deliverables"  OnClick="BTNDeliverables_Click" Class="btn btn-default wide "/>
                      <asp:Button ID="BTNSubmissions" runat="server" Text="Submissions"  OnClick="BTNSubmissions_Click" Class="btn btn-default wide"/>
                 </ContentTemplate>        

             </asp:RoleGroup>   
         </RoleGroups></asp:LoginView>
</asp:Content>
