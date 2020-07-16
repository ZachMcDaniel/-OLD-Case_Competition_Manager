<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Archive.aspx.cs" Inherits="CaseCompetitionApp.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <h2 class=" center gold">
       Competition Archive
     </h2>
    <h3 class="center">
        Access all previous competitions and results
    </h3>

    <div class="row">
        <div class="col-md-4 center">
            <asp:Label ID="lblArchive" runat="server" Text="Input Name of Competition" CssClass="center"></asp:Label>
            <br />
            <asp:TextBox ID="txtCompetition" runat="server" CssClass="center"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompetition" ErrorMessage="RequiredFieldValidator">Competition Name REquired</asp:RequiredFieldValidator>
        </div>
        <div class="col-md-4 center">
            <asp:Label ID="lblDate" runat="server" Text="Select Date of Competition" CssClass="center"></asp:Label>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="161px" NextPrevFormat="FullMonth" Width="95%" CssClass="center">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
        </div>
        <div class="col-md-4 center">
            <asp:Button ID="BtnArchive" CssClass="btn btn-default wide" runat="server" OnClientClick="return confirm('Are you sure you want to archive the current competition?')" Text="Archive Competition" />
        </div>
    </div>

    <div class="row">
    <div class="col-md-3">
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SQLCompete" DataTextField="CompetitionName" DataValueField="CompetitionName" Width="95%" Height="31px">
            <asp:ListItem Selected="True" Value="0">- Select Competition -</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SQLCompete" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [CompetitionName] FROM [Competition]"></asp:SqlDataSource>
    </div>
    <div class="col-md-3">
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlCompetitions" DataTextField="CompetitionDate" DataValueField="CompetitionDate" Width="95%" Height="31px">
                        <asp:ListItem Selected="True" Value="0">- Select Date -</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlCompetitions" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CompetitionDate] FROM [Competition] WHERE ([CompetitionName] = @CompetitionName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CompetitionName" PropertyName="SelectedValue" Type="String" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </div>

   <%-- <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvCompete" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCompetition" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataKeyNames="CompetitionID">
                <Columns>
                    <asp:BoundField DataField="CompetitionName" HeaderText="CompetitionName" SortExpression="CompetitionName" />
                    <asp:BoundField DataField="CompetitionDate" HeaderText="CompetitionDate" SortExpression="CompetitionDate" />
                    <asp:CommandField SelectText="View Details" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlCompetition" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Competition]"></asp:SqlDataSource>
        </div>
        </div>
    <div class="row">
        <div class="col-md-5"> 
            <asp:GridView ID="gvTeam" runat="server" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" DataSourceID="SqlTeam" DataKeyNames="TeamID">
                <Columns>
                    <asp:BoundField DataField="TeamName" HeaderText="TeamName" SortExpression="TeamName" />
                    <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CommandField SelectText="View Members" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlTeam" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [TEAM] WHERE ([CompetitionID] = @CompetitionID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvCompete" DefaultValue="1" Name="CompetitionID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-2">
            <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="False" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataSourceID="SQLMembers">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
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
            <asp:SqlDataSource ID="SQLMembers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [FirstName], [LastName] FROM [Members] WHERE ([TeamID] = @TeamID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvTeam" DefaultValue="1" Name="TeamID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-5">
            <asp:GridView ID="gvJudge" runat="server" AutoGenerateColumns="False" DataSourceID="SqlJudge" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="CompanySite" HeaderText="CompanySite" SortExpression="CompanySite" />
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
            <asp:SqlDataSource ID="SqlJudge" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [FirstName], [LastName], [Company], [Email], [CompanySite] FROM [Judges] WHERE ([CompetitionID] = @CompetitionID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvCompete" DefaultValue="1" Name="CompetitionID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>--%>

</asp:Content>
