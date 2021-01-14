<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JudgeModify.aspx.cs" Inherits="CaseCompetitionApp.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <h2 class=" center gold">
       Modify Judge Info
    </h2>
    <h3 class="center">
        Add or remove information about yourself!
    </h3>
    <br />

  <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvJudge" runat="server"  AutoGenerateColumns="False" DataKeyNames="JudgeID" DataSourceID="SqlDataSource3" Width="100%">
                <Columns>
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
                    <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [JudgeID], [FirstName], [LastName], [Company], [Email], [CompanySite], [Website2] FROM [Judges] where Username = (select Username FROM AspNetUsers where Id = @ID)" UpdateCommand="UPDATE [Judges] SET [FirstName] = @FirstName, [LastName]=@LastName, [Company]=@Company, [Email]=@Email, [CompanySite]=@CompanySite, [Website2]=@Website2  WHERE [JudgeID] = @original_JudgeID  " OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Judges] where [JudgeID] = @original_JudgeID">
                <SelectParameters>
    <asp:Parameter Name="ID" Type="String"/>
</SelectParameters>         
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
     <div class="bottomdiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink" >Return to Hub</asp:HyperLink>
    </div>
</asp:Content>