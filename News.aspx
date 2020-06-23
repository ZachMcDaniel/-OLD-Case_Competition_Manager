<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="CaseCompetitionApp.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class=" center gold">
        News & Information
    </h1>
    <h3>
        This news feed will contain all information related to the CyHawk Case Competition
        including contact information, resources, ETC ...
    </h3>

    <br />

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" DataSourceID="SQLNews" Width="100%" BorderWidth="3px" CellPadding="4" ForeColor="#333333" Gridlines="None" EditRowStyle-BorderWidth="4px" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Feed" SortExpression="Feed" >
                    <ControlStyle Font-Size="Large" />
                <ItemStyle Font-Overline="False" Font-Size="Large" />
                </asp:BoundField>
                </Columns>

<EditRowStyle BorderWidth="4px" BackColor="#7C6F57"></EditRowStyle>

                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SQLNews" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Feed] FROM [News]"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
