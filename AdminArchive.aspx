<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminArchive.aspx.cs" Inherits="CaseCompetitionApp.AdminArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class=" center gold">
       Admin Competition Archive
     </h2>
    <h3 class="center">
        Modify Competition Archives and Results
    </h3>

    <hr />
    <div class="row center">
            <div class="col-md-6">
                <asp:Button ID="btnShowArchives" CausesValidation="false" OnClick="btnShowArchives_Click" class="btn btn-default wide grey" runat="server" Text="Archive/Unarchive Competitions  &raquo;" />
            </div>
             <div class="col-md-6">
                <asp:Button ID="btnEditArchives" CausesValidation="false" OnClick="btnEditArchives_Click" class="btn btn-default wide grey" runat="server" Text="Edit Archived Competitions  &raquo;" />
            </div>
    </div>
      <hr style="border: .25px solid rgb(0,0,0)" />

    <div id="archives" runat="server">
    <div class="row">
        <div>
             <div class="col-md-2" style="text-align:right;vertical-align:central">
             <asp:Label ID="lblArchive" style="text-align:right; font-weight:bold; vertical-align:central" runat="server"  CssClass="control-label" Text="Name of Competition: "></asp:Label>
                 </div>
            <div class="col-md-3">
             <asp:TextBox ID="txtCompetition" runat="server" class="ArchBox"></asp:TextBox>
            <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompetition" ErrorMessage="RequiredFieldValidator">Competition Name Required</asp:RequiredFieldValidator>
        </div>
        </div>
       <div>
           <div class="col-md-2" style="text-align:right;vertical-align:central">
              <asp:Label ID="lblDate" style="text-align:right; font-weight:bold; vertical-align:central" runat="server" CssClass="control-label" Text="Date of Competition: "></asp:Label>
               </div>
           <div class="col-md-3">
              <asp:TextBox ID="txtDate" textmode="Date" runat="server" class="ArchBox"></asp:TextBox>
            <br />

              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate" ErrorMessage="RequiredFieldValidator">Competition Date Required</asp:RequiredFieldValidator>
        </div>
       </div>
          <div class="col-md-2">
            <asp:Button ID="BtnArchive" CssClass="btn btn-default" Style="padding-bottom:0px; padding-top:0px; margin-top:0px;text-align:center" runat="server" OnClientClick="return confirm('Are you sure you want to archive the current competition?')" Text="Archive Competition" Height="26px" OnClick="Btn_Archive" />
              <asp:Label ID="lblEmpty" runat="server" CssClass="text-danger" Text=""></asp:Label>
          </div>
    </div>
       <hr />

     <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvCompete" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCompetition" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataKeyNames="CompetitionId">
                <Columns>
                    <asp:BoundField DataField="CompetitionId" HeaderText="CompetitionId" SortExpression="CompetitionId" ReadOnly="True" InsertVisible="False" >
                    </asp:BoundField>
                    <asp:BoundField DataField="CompetitionName" HeaderText="CompetitionName" SortExpression="CompetitionName" >
                    </asp:BoundField>
                    
                    
                    <asp:BoundField DataField="CompetitionDate" HeaderText="CompetitionDate" ReadOnly="True" SortExpression="CompetitionDate" />
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
            <asp:SqlDataSource ID="SqlCompetition"  runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CompetitionId, CompetitionName, FORMAT([CompetitionDate], 'MM/dd/yy') AS CompetitionDate FROM [Competition]" UpdateCommand="UpdateCompetition" UpdateCommandType="StoredProcedure"  OldValuesParameterFormatString="original_{0}">
                <UpdateParameters>
                  <asp:Parameter Name="CompetitionId" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
              <asp:Parameter Name="original_MemberID" Type="String" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <br />

</div>
    


<div id="editarchive" runat="server">
      <%--Buttons--%>
    <div class="row">
        <div class="col-md-4 center">
            <asp:Button ID="BTNTeamInfo" CausesValidation="false" runat="server" Text="Modify Team Info" OnClick="BTNTeamInfo_Click" width="100%" CssClass="btn btn-default wide grey"/>
        </div>

        <div class="col-md-4 center">
            <asp:Button ID="BTNMemberInfo" CausesValidation="false" runat="server" Text="Modify Member Info" OnClick="BTNMemberInfo_Click" width="100%" CssClass="btn btn-default wide grey" />
        </div>

        <div class="col-md-4 center">
            <asp:Button ID="BTNJudgeInfo" CausesValidation="false" runat="server" Text="Modify Judge Info" OnClick="BTNJudgeInfo_Click" width="100%" CssClass="btn btn-default wide grey"/>
        </div>
    </div>

    <%--Line--%>
    <br />
<hr />
     <div id="empty" runat="server" class="center">
      <asp:Label ID="Label1" Font-Size="X-Large" runat="server" Text="There is no data archived"></asp:Label>
         <br />
         <br />
    </div>

    
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCompetition" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataKeyNames="CompetitionID">
                <Columns>
                    <asp:BoundField DataField="CompetitionId" HeaderText="CompetitionId" InsertVisible="False" ReadOnly="True" SortExpression="CompetitionId" />
                    <asp:BoundField DataField="CompetitionName" HeaderText="Competition Name" SortExpression="CompetitionName" >
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompetitionDate" HeaderText="Competition Date" SortExpression="CompetitionDate" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:CommandField SelectText="View Details" ShowSelectButton="True" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:CommandField>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CompetitionId, CompetitionName, FORMAT([CompetitionDate], 'MM/dd/yy') AS CompetitionDate FROM [Competition]"></asp:SqlDataSource>
        </div>
    </div>
    <br />
     <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvJudge" runat="server" AutoGenerateColumns="False" DataSourceID="SqlJudge" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" >
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                    </asp:BoundField>
                    <asp:BoundField DataField="CompanySite" HeaderText="CompanySite" SortExpression="CompanySite" />
                    <asp:BoundField DataField="CompetitionID" HeaderText="CompetitionID" SortExpression="CompetitionID" />
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
            <asp:SqlDataSource ID="SqlJudge" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [FirstName], [LastName], [Company], [CompanySite], [CompetitionID] FROM [Judges] WHERE ([CompetitionID] = @CompetitionID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvCompete" Name="CompetitionID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col-md-7"> 
            <asp:GridView ID="gvTeam" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" DataSourceID="SqlTeam" DataKeyNames="TeamID">
                <Columns>
                    <asp:BoundField DataField="TeamName" HeaderText="Team Name" SortExpression="TeamName" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Ranking" HeaderText="Ranking" SortExpression="Ranking" />
                    <asp:BoundField DataField="CompetitionID" HeaderText="CompetitionID" SortExpression="CompetitionID" />
                    <asp:CommandField SelectText="View Members" ShowSelectButton="True" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:CommandField>
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

        <div class="col-md-5">
            <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataSourceID="SQLMembers">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Competitor Name" SortExpression="Name" >
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
            <asp:SqlDataSource ID="SQLMembers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT concat([FirstName], ' ', [LastName]) AS Name FROM [Members] WHERE ([TeamID] = @TeamID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvTeam" DefaultValue="1" Name="TeamID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </div>

</div>



      <div class="bottomdiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink" >Return to Hub</asp:HyperLink>
    </div>
     

</asp:Content>
