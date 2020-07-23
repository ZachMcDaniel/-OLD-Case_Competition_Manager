<%@ Page Title="Modify Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyCompetitionInfo.aspx.cs" Inherits="CaseCompetitionApp.ModifyCompetitionInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class=" center gold">
       Modify Competition Info
    </h2>
    <h3 class="center">
        Add or remove information on the competition info pages
    </h3>
    <br />

    <%--Buttons--%>
    <div class="row">
        <div class="col-md-4 center">
            <asp:Button ID="BTNTeamInfo" runat="server" Text="Modify Team Info" OnClick="BTNClickTeamInfo" width="100%" CssClass="btn btn-default wide grey"/>
        </div>

        <div class="col-md-4 center">
            <asp:Button ID="BTNMemberInfo" runat="server" Text="Modify Member Info" OnClick="BTNClickMemberInfo" width="100%" CssClass="btn btn-default wide grey" />
        </div>

        <div class="col-md-4 center">
            <asp:Button ID="BTNJudgeInfo" runat="server" Text="Modify Judge Info" OnClick="BTNClickJudgeInfo" width="100%" CssClass="btn btn-default wide grey"/>
        </div>
    </div>

    <%--Line--%>
    <br />
    <hr style="border: .25px solid rgb(0,0,0)" />


    <%--Team Table--%>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvCompete" DataKeyNames="TeamID" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="TeamName" HeaderText="Team Name" SortExpression="TeamName" ReadOnly="True" >
                        <ControlStyle CssClass="padding" />
                        <HeaderStyle CssClass="padding" />
                        <ItemStyle CssClass="padding" />
                        </asp:BoundField>
                        <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" ReadOnly="True" >
                        <ControlStyle CssClass="padding" />
                        <HeaderStyle CssClass="padding" />
                        <ItemStyle CssClass="padding" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Timeslot" SortExpression="Timeslots">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="Time" Text='<%# Bind("Timeslots") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Timeslots") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle CssClass="padding" />
                            <HeaderStyle CssClass="padding" />
                            <ItemStyle CssClass="padding" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" >
                        <ControlStyle CssClass="padding" />
                        <HeaderStyle CssClass="padding" />
                        <ItemStyle CssClass="padding" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ranking" HeaderText="Team Ranking" SortExpression="Ranking">
                        <ControlStyle CssClass="padding" />
                        <HeaderStyle CssClass="center" />
                        <ItemStyle CssClass="padding" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" >
                        <ControlStyle CssClass="smpadding" />
                        <HeaderStyle CssClass="padding" />
                        <ItemStyle CssClass="smpadding" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamID], [TeamName],[School], FORMAT([Timeslots], 'hh:mm tt') AS Timeslots, [RoomNumber], [Ranking] FROM [TEAM] where CompetitionId IS NULL" UpdateCommand="UPDATE [TEAM] SET [Timeslots] = @Timeslots, [RoomNumber] = @RoomNumber , [Ranking] = @Ranking WHERE [TeamID] = @original_TeamID" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [TEAM] where [TeamID] = @original_TeamID">
                     <DeleteParameters>
                        <asp:Parameter Name="original_TeamID" Type="String" />
                     </DeleteParameters>
                     <UpdateParameters>
                        <asp:Parameter Name="Ranking" Type="String" />
                        <asp:Parameter Name="Timeslots" Type="String" />
                        <asp:Parameter Name="RoomNumber" Type="String" />
                     </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>


    <%--Member Table--%>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvMember" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberID" DataSourceID="SqlDataSource2" Width="100%">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FoodAllergy" HeaderText="Food Allergy" SortExpression="FoodAllergy">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ShirtSize" HeaderText="Shirt Size" SortExpression="ShirtSize">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Vegan" HeaderText="Vegan" SortExpression="Vegan">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True">
                    <ControlStyle CssClass="smpadding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="smpadding" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Members] join TEAM on Members.TeamID = TEAM.TeamID where CompetitionId IS NULL" UpdateCommand="UPDATE [Members] SET [FirstName] = @FirstName, [LastName] =@LastName, [Email]=@Email, [FoodAllergy]=@FoodAllergy, [ShirtSize]=@ShirtSize, [PhoneNumber]=@PhoneNumber, [Vegan]=@Vegan  WHERE [MemberID] = @original_MemberID  " OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Members] where [MemberID] = @original_MemberID">
                     
                  <DeleteParameters>
                    <asp:Parameter Name="original_MemberID" Type="String" />
                 </DeleteParameters>
                 <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="FoodAllergy" Type="String" />
                    <asp:Parameter Name="ShirtSize" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="Vegan" Type="String" />
                 </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>


    <%--Judge Table--%>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvJudge" runat="server" AutoGenerateColumns="False" DataKeyNames="JudgeID" DataSourceID="SqlDataSource3" Width="100%">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompanySite" HeaderText="Company Site" SortExpression="CompanySite">
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" >
                    <ControlStyle CssClass="smpadding" />
                    <ItemStyle CssClass="smpadding" />
                    <HeaderStyle CssClass="padding" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [JudgeID], [FirstName], [LastName], [Company], [Email], [CompanySite] FROM [Judges] where competitionID IS NULL" UpdateCommand="UPDATE [Judges] SET [FirstName] = @FirstName, [LastName]=@LastName, [Company]=@Company, [Email]=@Email, [CompanySite]=@CompanySite  WHERE [JudgeID] = @original_JudgeID  " OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Judges] where [JudgeID] = @original_JudgeID">
                 <DeleteParameters>
                    <asp:Parameter Name="original_JudgeID" Type="String" />
                 </DeleteParameters>
                 <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Company" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="CompanySite" Type="String" />
                 </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <div class="stickydiv">
        <br />
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink">Return to Hub</asp:HyperLink>
    </div>
   

</asp:Content>
