<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CaseCompetitionApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 class="center gold" >CyHawk Case Competition</h1>
        
        <asp:Image ID="Image1" runat="server" />
    </div>

    <br />
    <div>
        <h2 class="center">The CyHawk Case Competition is an annual event hosted by the University of Iowa and Iowa State University.</h2>
    </div>
    <br />

    <div class="row">
        <div class="col-md-4">
            <h2>SECTION 1</h2>
            <p>
                (ENTER TEXT HERE)
            </p>
           
        </div>
        <div class="col-md-4">
            <h2>SECTION 2</h2>
            <p>
                (ENTER TEXT HERE)
            </p>
        </div>
        <div class="col-md-4">
            <h2>Meet the Judges</h2>
            <p>
                (ENTER TEXT HERE)
            </p>
            <p>                <a class="btn btn-default"  href="../JudgeInfo">See Info &raquo;</a>            

            </p>
        </div>
    </div>

</asp:Content>
