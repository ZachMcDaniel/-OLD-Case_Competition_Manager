<%@ Page Title="Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="CaseCompetitionApp.Results" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       
        <div class=" center col-md-4">
            <h2 class="center">1st Place</h2>
            <p class="center">
                Sons of Analysts
            </p>
            <p>                
               <%--<asp:Image ID="Image1" runat="server" />--%>
            </p>
        </div>
        <div class="center col-md-4">
            <h2 class="center">2nd Place</h2>
            <p class="center">
                AKA Consulting
            </p>
            <p>                
               <%-- <asp:Image ID="Image2" runat="server" />  --%>        
            </p>
        </div>
        <div class="center col-md-4">
            <h2 class="center">3rd Place</h2>
            <p class="center">
                The Zip Codes
            </p>
            <p>                
                <%--<asp:Image ID="Image3" runat="server" /> --%>         
            </p>
           
        </div>
    </div>

    <div class="center">
        <h3>
            Thank you to all competitors for the hard work at this year's competition!
        </h3>
    </div>
</asp:Content>
