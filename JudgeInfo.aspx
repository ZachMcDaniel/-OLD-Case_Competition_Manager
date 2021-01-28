<%@ Page Title="Meet the Judges" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JudgeInfo.aspx.cs" Inherits="CaseCompetitionApp.JudgeInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2 style="font-size:65px; font-family: ZillaSlab-SemiBold">Meet the Judges!</h2>
        <div>
            <hr style="border-top: 3px solid #FFCD00" />
        </div>
        <h2 style="font-size: 30px; font-family: Roboto-Regular">This year's judges can be found below, along iwth the company they work for. Make sure to check this out!</h2>
          <br />
    </div>
    <div id="empty" runat="server" class="center">
      <asp:Label ID="lblEmpty" Font-Size="X-Large" runat="server" Text="There is no current judges information available at this time. Please check back later."></asp:Label>
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcejudge" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="JudgeID">
        <Columns>
            <asp:BoundField DataField="JudgeName" HeaderText="JudgeName" SortExpression="JudgeName" ReadOnly="True" >
                 <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company">
                 <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:HyperLinkField runat="server" DataNavigateUrlFields="CompanySite" DataTextField="CompanySite" target="_blank" HeaderText="Company Site" SortExpression="CompanySite" DataNavigateUrlFormatString="http://{0}" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:HyperLinkField>
            <asp:HyperLinkField runat="server" DataNavigateUrlFields="Website2" DataTextField="Website2" target="_blank" HeaderText="Personal Site" SortExpression="Website2" DataNavigateUrlFormatString="http://{0}" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSourcejudge" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [JudgeID], concat([FirstName], ' ', [LastName]) AS JudgeName, [Company], [CompanySite], [Website2] FROM [Judges] WHERE CompetitionID IS NULL" ></asp:SqlDataSource>


</asp:Content>
