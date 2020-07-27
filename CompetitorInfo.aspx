<%@ Page Title="Team Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompetitorInfo.aspx.cs" Inherits="CaseCompetitionApp.CompetitorInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class=" center gold">
       Team Information
     </h2>
    <hr />

    <div id="empty" runat="server" class="center">
      <asp:Label ID="lblEmpty" Font-Size="X-Large" runat="server" Text="No Current Competition is running. Please check archives for any data"></asp:Label>
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TeamID" DataSourceID="SqlTeams" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="TeamName" HeaderText="TeamName" SortExpression="TeamName" >
            <ControlStyle CssClass="padding" />
            <HeaderStyle CssClass="padding" />
            <ItemStyle CssClass="padding" />
            </asp:BoundField>
            <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" >
            <ControlStyle CssClass="padding" />
            <HeaderStyle CssClass="padding" />
            <ItemStyle CssClass="padding" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">

                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                       <a href="Mailto:<%# Eval("Email") %>"><%#Eval("Email")%></a>
                </ItemTemplate>

                <ControlStyle CssClass="padding" />
                <HeaderStyle CssClass="padding" />
                <ItemStyle CssClass="padding" />

            </asp:TemplateField>
            <asp:BoundField DataField="Timeslots" HeaderText="Timeslots" SortExpression="Timeslots">
                 <ControlStyle CssClass="padding" />
            <HeaderStyle CssClass="padding" />
            <ItemStyle CssClass="padding" />
            </asp:BoundField>
            <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber">
                 <ControlStyle CssClass="padding" />
            <HeaderStyle CssClass="padding" />
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
    <asp:SqlDataSource ID="SqlTeams" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamID], [School], [TeamName], [Email], FORMAT([Timeslots], 'hh:mm tt') AS Timeslots, [RoomNumber] FROM [TEAM] where competitionID IS NULL">

    </asp:SqlDataSource>
      <div class="bottomdiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink" >Return to Hub</asp:HyperLink>
    </div>
</asp:Content>
