﻿<%@ Page Title="Modify Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyCompetitionInfo.aspx.cs" Inherits="CaseCompetitionApp.ModifyCompetitionInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class=" center gold">
       Modify Competition Info
    </h2>
    <h3 class="center">
        Add or remove information on the competition info pages
    </h3>
    <hr class="style-four">
    <br />

    <%--Buttons--%>
    <div class="row">
        <div class="col-md-3 center">
            <asp:Button ID="BTNTeamInfo" runat="server" Text="Modify Team Info" OnClick="BTNClickTeamInfo" width="100%" CssClass="btn btn-default wide grey"/>
        </div>

        <div class="col-md-3 center">
            <asp:Button ID="BTNMemberInfo" runat="server" Text="Modify Member Info" OnClick="BTNClickMemberInfo" width="100%" CssClass="btn btn-default wide grey" />
        </div>

        <div class="col-md-3 center">
            <asp:Button ID="BTNJudgeInfo" runat="server" Text="Modify Judge Info" OnClick="BTNClickJudgeInfo" width="100%" CssClass="btn btn-default wide grey"/>
        </div>
        <div class="col-md-3 center">
             <asp:Button ID="BTNHost" runat="server" Text="Modify Host Info" OnClick="BTNClickHostInfo" width="100%" CssClass="btn btn-default wide grey"/>
        </div>
    </div>

    <%--Line--%>
    <br />
    <hr style="border: .25px solid rgb(0,0,0)" />

     <div id="empty" runat="server" class="center">
      <asp:Label ID="lblEmpty" Font-Size="X-Large" runat="server" Text="There is no current competition data available. Unarchive a competition to edit it."></asp:Label>
         <br />
         <br />
         <asp:Button ID="btnUnarchive" CssClass="btn btn-default" OnClick="UnarchiveLink_Click" runat="server" Text="Go to Admin Archives &raquo;" />
    </div>

    <%--Team Table--%>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvCompete" CssClass="Grid" DataKeyNames="TeamID" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="TeamID" HeaderText="TeamID" SortExpression="TeamID" ReadOnly="True" InsertVisible="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TeamName" HeaderText="TeamName" SortExpression="TeamName" >
                        </asp:BoundField>
                        <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Timeslots" HeaderText="Timeslots" SortExpression="Timeslots" ReadOnly="True">
                        </asp:BoundField>
                        <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                        <asp:BoundField DataField="Ranking" HeaderText="Ranking" SortExpression="Ranking" />
                        <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete team?');" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                            <ControlStyle CssClass="smpadding" />
                            <HeaderStyle CssClass="padding" />
                            <ItemStyle CssClass="smpadding" />
                        </asp:TemplateField>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamID], [TeamName],[School], FORMAT([Timeslots], 'hh:mm tt') AS Timeslots, [RoomNumber], [Ranking], [Dropbox] FROM [TEAM] where CompetitionId IS NULL" UpdateCommand="UPDATE [TEAM] SET [Timeslots] = @Timeslots, [RoomNumber] = @RoomNumber , [Ranking] = @Ranking, [Dropbox] = @Dropbox WHERE [TeamID] = @original_TeamID" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [TEAM] where [TeamID] = @original_TeamID">
                     <DeleteParameters>
                        <asp:Parameter Name="original_TeamID" Type="String" />
                     </DeleteParameters>
                     <UpdateParameters>
                        <asp:Parameter Name="Timeslots" Type="String" />
                        <asp:Parameter Name="RoomNumber" Type="String" />
                        <asp:Parameter Name="Ranking" Type="String" />
                         <asp:Parameter Name="Dropbox" Type="String" />
<asp:Parameter Name="original_TeamID"></asp:Parameter>
                     </UpdateParameters>
                </asp:SqlDataSource>
                <div>
                    <br />

                </div>
                <%--dropbox--%>
                <asp:GridView ID="gvdropbox" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" DataKeyNames="TeamID" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="TeamID" HeaderText="TeamID" SortExpression="TeamID" InsertVisible="False" ReadOnly="True">
                        </asp:BoundField>
                        <asp:BoundField DataField="TeamName" HeaderText="Team Name" SortExpression="TeamName">
                        </asp:BoundField>
                        <asp:BoundField DataField="Dropbox" HeaderText="Dropbox" SortExpression="Dropbox" />
                        <%-- <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" >
                        <HeaderStyle CssClass="center" />
                        </asp:CommandField>--%>
                        <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete team host?');" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                            <ControlStyle CssClass="smpadding" />
                            <HeaderStyle CssClass="padding" />
                            <ItemStyle CssClass="smpadding" />
                        </asp:TemplateField>
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamID], [TeamName], [Dropbox] FROM [TEAM] WHERE ([CompetitionID] IS NULL)" UpdateCommand="UPDATE [TEAM] SET [Dropbox] = @Dropbox WHERE [TeamID] = @original_TeamID" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [TEAM] where [TeamID] = @original_TeamID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_TeamID" Type="String" />
                     </DeleteParameters>
                    <UpdateParameters>
                         <asp:Parameter Name="Dropbox" Type="String" />
                         <asp:Parameter Name="original_TeamID"></asp:Parameter>
                     </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>


    <%--Member Table--%>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvMember" CssClass="Grid" runat="server" AutoGenerateColumns="False"  DataKeyNames="MemberID" DataSourceID="SqlDataSource2" Width="100%">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                    <ControlStyle CssClass="Shorter" />
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                    <ControlStyle CssClass="Shorter" />
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                    <ControlStyle CssClass="Shorter" />
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FoodAllergy" HeaderText="Food Allergy" SortExpression="FoodAllergy">
                    <ControlStyle CssClass="Shorter" />
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ShirtSize" HeaderText="Shirt Size" SortExpression="ShirtSize">
                    <ControlStyle CssClass="Shorter" />
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber">
                    <ControlStyle CssClass="Shorter" />
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Vegan" HeaderText="Vegan" SortExpression="Vegan">
                    <ControlStyle CssClass="Shorter" />
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Edit">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete team member?');" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <ControlStyle CssClass="smpadding" />
                        <HeaderStyle CssClass="padding" />
                        <ItemStyle CssClass="smpadding" />
                    </asp:TemplateField>
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
            <asp:GridView ID="gvJudge" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="JudgeID" DataSourceID="SqlDataSource3" Width="100%">
                <Columns>
                    <asp:BoundField DataField="JudgeID" HeaderText="JudgeID" SortExpression="JudgeID" InsertVisible="False" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName">
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName">
                    </asp:BoundField>
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company">
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                    </asp:BoundField>
                    <asp:BoundField DataField="CompanySite" HeaderText="CompanySite" SortExpression="CompanySite" />
                    <asp:BoundField DataField="Website2" HeaderText="Personal Site" SortExpression="Website2" />
                    <asp:TemplateField HeaderText="Edit">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete judge?');" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <ControlStyle CssClass="smpadding" />
                        <HeaderStyle CssClass="padding" />
                        <ItemStyle CssClass="smpadding" />
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [JudgeID], [FirstName], [LastName], [Company], [Email], [CompanySite], [Website2] FROM [Judges] where competitionID IS NULL" UpdateCommand="UPDATE [Judges] SET [FirstName] = @FirstName, [LastName]=@LastName, [Company]=@Company, [Email]=@Email, [CompanySite]=@CompanySite, [Website2]=@Website2  WHERE [JudgeID] = @original_JudgeID  " OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Judges] where [JudgeID] = @original_JudgeID">
                 <DeleteParameters>
                    <asp:Parameter Name="original_JudgeID" Type="String" />
                 </DeleteParameters>
                 <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Company" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="CompanySite" Type="String" />
                    <asp:Parameter Name="Website2" Type="String" />
                     <asp:Parameter Name="original_JudgeID" />
                 </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <%--Host Table--%>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvHost" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" DataKeyNames="HostID" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Host" HeaderText="Host" SortExpression="Host" />
                    <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                    <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                    <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team" />
                    <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" >
                        <HeaderStyle CssClass="center" />
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
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [HostID], [Host], [Website], [Contact], [Team] FROM [Team_host] WHERE ([CompetitionID] IS NULL)" UpdateCommand="UPDATE [Team_host] SET [Host] = @Host, [Website] = @Website, [Contact] = @Contact, [Team] = @Team WHERE [HostID] = @original_HostID" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Team_host] where [HostID] = @original_HostID">
                <DeleteParameters>
                    <asp:Parameter Name="original_HostID" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Host" Type="String" />
                    <asp:Parameter Name="Website" Type="String" />
                    <asp:Parameter Name="Contact" Type="String" />
                    <asp:Parameter Name="Team" Type="String" />
                    <asp:Parameter Name="original_HostID"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>


    <div class="stickydiv">
        <br />
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink">Return to Hub</asp:HyperLink>
    </div>
   

</asp:Content>
