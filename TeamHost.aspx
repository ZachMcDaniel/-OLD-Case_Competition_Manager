<%@ Page Title="Team Host" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamHost.aspx.cs" Inherits="CaseCompetitionApp.TeamHost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="center gold">Team Host</h2>
    <h3 class ="center">Meet Your Team Host for the Competition</h3>
    <hr class="style-four">




    <%--Return to hub--%>
     <div class="stickyrightdiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink">Return to Hub</asp:HyperLink>
    </div>

</asp:Content>
