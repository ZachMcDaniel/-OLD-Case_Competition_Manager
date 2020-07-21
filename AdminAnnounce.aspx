<%@ Page Title="Admin Announcements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAnnounce.aspx.cs" Inherits="CaseCompetitionApp.AdminAnnounce" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class=" center gold">
       Update News Feed
    </h2>
    <h3 class="center">
        Add or Remove Announcements on the News Page
    </h3>

    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GVNews" runat="server" DataKeyNames="NewsId" AutoGenerateColumns="False" ShowHeader="False" DataSourceID="SQLNews" Width="100%"  BorderWidth="1px" CellPadding="4" ForeColor="Black" Gridlines="Horizontal" EditRowStyle-BorderWidth="4px" Css-Class="newsborder" >
                <Columns>
                    <asp:BoundField DataField="Time" SortExpression="Time" HeaderText="Time" ReadOnly="True" >
                    <ControlStyle CssClass="newspadding" Font-Size="Medium" width="800px"/>
                    <ItemStyle CssClass="newspadding" Font-Size="Medium" Width="100px" />
                </asp:BoundField>
                    <asp:TemplateField HeaderText="Feed" SortExpression="Feed">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFeed" runat="server" class="txtbox" TextMode="MultiLine" Wrap="true" Text='<%# Bind("Feed") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFeed" runat="server" Text='<%# Bind("Feed") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle CssClass="newspadding editbox" font-size="Medium"/>
                        <HeaderStyle CssClass="newspadding editbox" font-size="Medium"/>
                        <ItemStyle CssClass="newspadding editbox" font-size="Medium"/>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle CssClass="newspadding" Font-Size="Medium" />
                    <ItemStyle CssClass="newspadding" Font-Size="Medium" />
                    </asp:CommandField>
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
            <asp:SqlDataSource ID="SQLNews" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT NewsId, FORMAT([NewsTime], 'MM/dd/yy hh:mm tt') AS Time, Feed FROM [News] ORDER BY NewsTime desc" UpdateCommand="UPDATE [News] SET [Feed] = @Feed WHERE [NewsId] = @original_NewsId" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [News] where [NewsId] = @original_NewsId">
         <DeleteParameters>
              <asp:Parameter Name="original_NewsId" Type="String" />
          </DeleteParameters>
         <UpdateParameters>
              <asp:Parameter Name="Feed" Type="String" />
              <asp:Parameter Name="original_NewsId" />
          </UpdateParameters>
                </asp:SqlDataSource>
        </div>
        <div class="col-md-12">
            <br />
    </div>
    </div>
    <div class="row">
            <div class="col-md-8">
            <asp:TextBox ID="txtNews" runat="server" class="txtbox" TextMode="MultiLine" Wrap="True"></asp:TextBox> <%--YEET--%>
                <br />
                <asp:RegularExpressionValidator ID="REVEntry" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtNews" ValidationExpression="^[\s\S]{0,1000}$" CssClass="text-danger" style="font:bold">1000 word limit on news posts</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfVEntry" runat="server"  CssClass="text-danger" ControlToValidate="txtNews" ErrorMessage="RequiredFieldValidator">News Entry Required</asp:RequiredFieldValidator>
                </div>

            <div class="col-md-2">
                <asp:Button ID="btnNews" CssClass="btn btn-default grey" width="100%" runat="server" Text="Insert News" OnClick="btnNewsClick" />
             </div>
                    <div class="col-md-2">
                <asp:Button ID="btncancel" CssClass="btn btn-default grey" width="100%" runat="server" Text="Clear" OnClick="btnClear_Click" />
             </div>
    </div>

    <div class="col-md-12">
        <hr />
    </div>

    <div class="rightdiv">
    <asp:Button ID="btnDrop" cssclass="btn btn-default" runat="server" Text="Delete All News"  OnClientClick="return confirm('Are you sure you want to delete the news feed?')" OnClick="btnDrop_Click" />
    </div>
    
    <div class="col-md-12">
        <br />
    </div>

     <div class="bottomdiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink" >Return to Hub</asp:HyperLink>
    </div>

</asp:Content>
