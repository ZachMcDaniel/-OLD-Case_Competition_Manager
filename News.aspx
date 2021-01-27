<%@ Page Title="News" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="CaseCompetitionApp.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div>
        <h2 style="font-size:65px; font-family: ZillaSlab-SemiBold">News & Information</h2>
        <div>
            <hr style="border-top: 3px solid #FFCD00" />
        </div>
        <h2 style="font-size: 30px; font-family: Roboto-Regular">Updates and information about the current case competition</h2>
        <br />  
    </div>

    <div id="empty" runat="server" class="center">
        <hr />
        <br />
      <asp:Label ID="lblEmpty" Font-Size="X-Large" runat="server" Text="No Current News. Please check back later."></asp:Label>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" DataSourceID="SQLNews" Width="100%" EditRowStyle-BorderWidth="4px" CssClass="newsborder">
                <Columns>
                    <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" ReadOnly="True">
                    <ControlStyle CssClass="newspadding" Font-Size="Medium" />
                    <ItemStyle CssClass="newspadding" Font-Size="Medium" Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Feed" SortExpression="Feed" HeaderText="Feed" >
                    <ControlStyle CssClass="newspadding" Font-Size="Medium" />
                    <ItemStyle CssClass="newspadding" Font-Size="Medium" />
                </asp:BoundField>
                </Columns>

<EditRowStyle BorderWidth="4px" ></EditRowStyle>

            </asp:GridView>
            <asp:SqlDataSource ID="SQLNews" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT NewsId, FORMAT([NewsTime], 'MM/dd/yy hh:mm tt') AS Time, Feed FROM [News] ORDER BY NewsTime desc"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
