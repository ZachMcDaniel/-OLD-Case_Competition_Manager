<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="CaseCompetitionApp.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class=" center gold">
        News & Information
    </h1>
    <h3
        >
        This news feed will contain all information related to the CyHawk Case Competition
        including contact information, resources, ETC ...
    </h3>

    <br />

    <div class="row">
        <div class="col-md-6">
            <h2 class="center">Message Board</h2>
            <p class="center">
                For Community Messaging and Updates
            </p>
            <p>                <a class="btn btn-default gold"  href="../">View Board &raquo;</a>            

            </p>
        </div>

           <div class="col-md-6">
            <h2 class="center">Competition Info</h2>
            <p class="center">
                Important Updates on the Competition
            </p>
            <p class="center">                            
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
        </div>
    </div>

</asp:Content>
