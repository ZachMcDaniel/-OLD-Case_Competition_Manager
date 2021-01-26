<%@ Page Title="Team Host" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamHost.aspx.cs" Inherits="CaseCompetitionApp.TeamHost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="center gold">Team Host</h2>
    <h3 class ="center">Find Your Team Host for the Competition</h3>
    <hr class="style-four">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:BoundField DataField="Host" HeaderText="Host" SortExpression="Host">
                <ControlStyle CssClass="padding" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="padding" />
                </asp:BoundField>
            <asp:HyperLinkField runat="server" DataNavigateUrlFields="Website" DataTextField="Website" target="_blank" HeaderText="Website" SortExpression="Website" DataNavigateUrlFormatString="http://{0}" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" >
                <ControlStyle CssClass="padding" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="padding" />
                </asp:BoundField>
            <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team" >
                <ControlStyle CssClass="padding" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="padding" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFDF00" Font-Bold="True" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Host], [Website], [Contact], [Team] FROM [Team_host] WHERE ([CompetitionID] IS NULL)"></asp:SqlDataSource>


    <%--Return to hub--%>
   <div class="col-md-12">
        <br />
        <hr />
    </div>

      <div class="stickyrightdiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink">Return to Hub</asp:HyperLink>
    </div>

</asp:Content>
