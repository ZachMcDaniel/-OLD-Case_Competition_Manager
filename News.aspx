<%@ Page Title="News" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="CaseCompetitionApp.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class=" center gold">
        News & Information
    </h2>
    <h3 class="center">
        This news feed will contain all information related to the CyHawk Case Competition
    </h3>

    <br />

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" DataSourceID="SQLNews" Width="100%" EditRowStyle-BorderWidth="4px" CssClass="newsborder">
                <Columns>
                    <asp:BoundField DataField="Feed" SortExpression="Feed" >
                    <ControlStyle Font-Size="Large" CssClass="newspadding" />
                <ItemStyle Font-Overline="False" Font-Size="Large" CssClass="newspadding" />
                </asp:BoundField>
                </Columns>

<EditRowStyle BorderWidth="4px"></EditRowStyle>

            </asp:GridView>
            <asp:SqlDataSource ID="SQLNews" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [News] ORDER BY NewsTime desc"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
