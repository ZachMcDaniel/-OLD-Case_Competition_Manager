<%@ Page Title="Meet the Judges" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JudgeInfo.aspx.cs" Inherits="CaseCompetitionApp.JudgeInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Meet the Judges!
    </h2>
    <h3>
        This year's judges can be found below, along with the company they work for. Make sure to check this out!
    </h3>
    <br/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcejudge" Width="95%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                 <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                 </asp:BoundField>
            <asp:HyperLinkField runat="server" DataNavigateUrlFields="CompanySite" DataTextField="CompanySite" target="_blank" HeaderText="Company Site" SortExpression="CompanySite" DataNavigateUrlFormatString="http://{0}" >
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSourcejudge" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [FirstName], [LastName], [Company], [CompanySite] FROM [Judges]" ></asp:SqlDataSource>


</asp:Content>
