<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CaseCompetitionApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 class="center black" >CyHawk Case Competition</h1>
        
        <asp:Image ID="Image1" runat="server" />
    </div>

    <br />
    <div>
        <h2 class="center">The CyHawk Case Competition is an annual event hosted by the University of Iowa and Iowa State University.</h2>
    </div>
    <br />

    <div class="row">
        <div class="col-md-4">
            <h2 class="center">CyHawk History</h2>
            <p class="center">
                (ENTER TEXT HERE)
            </p>
           
        </div>
        <div class="col-md-4">
            <h2 class="center">Meet the Judges</h2>
            <p class="center">
                List of This Year's Judges and Their Companies
            </p>
            <p>
                 <p>                <a class="btn btn-default gold"  href="../JudgeInfo">View Judges &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2 class="center">Meet the Competitors</h2>
            <p class="center">
                List of This Year's Teams
            </p>
            <p>                <a class="btn btn-default gold"  href="../TeamInfo">View Teams &raquo;</a>            

            </p>
        </div>
    </div>

</asp:Content>
