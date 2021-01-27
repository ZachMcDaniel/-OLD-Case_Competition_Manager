<%@ Page Title="Team Host" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamHost.aspx.cs" Inherits="CaseCompetitionApp.TeamHost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <div>
        <h2 style="font-size:65px; font-family: ZillaSlab-SemiBold">Team Host</h2>
        <div>
            <hr style="border-top: 3px solid #FFCD00" />
        </div>
       
        <h2 style="font-size: 30px; font-family: Roboto-Regular">Find Your Team's Host for the Competition</h2>
          
    </div>

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
