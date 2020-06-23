<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAnnounce.aspx.cs" Inherits="CaseCompetitionApp.AdminAnnounce" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1 class=" center gold">
       Update News Feed
    </h1>
    <h3>
        Add or Remove Announcements on the News Page
    </h3>

    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="NewsId" AutoGenerateColumns="False" ShowHeader="False" DataSourceID="SQLNews" Width="100%" BorderWidth="1px" CellPadding="4" ForeColor="Black" Gridlines="Horizontal" EditRowStyle-BorderWidth="4px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" >
                <Columns>
                    <asp:BoundField DataField="Feed" SortExpression="Feed" >
                    <ControlStyle Font-Size="Large" />
                <ItemStyle Font-Overline="False" Font-Size="Large" />
                </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>

<EditRowStyle BorderWidth="4px"></EditRowStyle>

                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SQLNews" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [News]" UpdateCommand="UPDATE [News] SET [Feed] = @Feed WHERE [NewsId] = @original_NewsId" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [News] where [NewsId] = @original_NewsId">
         <DeleteParameters>
              <asp:Parameter Name="original_NewsId" Type="String" />
          </DeleteParameters>
         <UpdateParameters>
              <asp:Parameter Name="NewsId" Type="String" />
              <asp:Parameter Name="Feed" Type="String" />
          </UpdateParameters>
                </asp:SqlDataSource>
        </div>
        <div class="col-md-12">
            <br />
    </div>
    </div>
    <div class="col-md-12">
            <div class="col-md-8">
            <asp:TextBox ID="txtNews" runat="server" class="txtbox"></asp:TextBox>
                </div>
            <div class="col-md-2">
                <asp:Button ID="btnNews" CssClass="btn btn-default grey" width="100%" runat="server" Text="Insert News" OnClick="btnNewsClick" />
             </div>
                    <div class="col-md-2">
                <asp:Button ID="btncancel" CssClass="btn btn-default grey" width="100%" runat="server" Text="Clear" OnClick="btnClear_Click" />
             </div>
    </div>
    <div class="col-md-12">
        <br />
    </div>

</asp:Content>
