<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventInformation.aspx.cs" Inherits="CaseCompetitionApp.EventInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container">
    <div class="form">
     <%--Jumbotron--%>

    <div class="jumbotron center">
        <asp:Image ID="Image1" runat="server" />
    </div>

    <br />

        <div class="row center">
            <div class="form-group, center">
             <asp:LoginView runat="server">     
             <RoleGroups>       
                 <asp:RoleGroup Roles="admin"> 
                    <ContentTemplate>
                    <div class="stickydiv">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="AdminEventInfo.aspx" CssClass="hyperlink" ForeColor="#999999" Font-Size="Medium">< Return to Admin</asp:Hyperlink>
                     </div>
                     </ContentTemplate>
                 </asp:RoleGroup>   
             </RoleGroups>
                </asp:LoginView>
                    <h3><asp:Label ID="LblBox1a" runat="server" ViewStateMode="Enabled"></asp:Label></h3>
                    <h5><asp:Label ID="LblBox1" runat="server" Font-Size="Medium" ViewStateMode="Enabled"></asp:Label></h5>
                </div>
                <br />
            <div class="form-group, center">
                    <h3><asp:Label ID="LblBox2a" runat="server"></asp:Label></h3>
                    <h5><asp:Label ID="LblBox2" runat="server" Font-Size="Medium"></asp:Label></h5>
                </div>
                <br />
            <div class="form-group, center">
                    <h3><asp:Label ID="LblBox3a" runat="server"></asp:Label></h3>
                    <h5><asp:Label ID="LblBox3" runat="server" Font-Size="Medium"></asp:Label></h5>
                </div>
                <br />
            <div class="form-group, center">
                    <h3 class="center">Event Schedule</h3>
                <div class="row center">
                    <h5 class="center"><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="8" DataKeyNames="EventID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" ShowHeaderWhenEmpty="True" CellSpacing="2" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="EventID" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" >
                            <ControlStyle CssClass="Center" />
                            <HeaderStyle CssClass="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EventDate" DataFormatString="{0:d}" HeaderText="Date: " SortExpression="EventDate" ApplyFormatInEditMode="True" >
                            <ControlStyle CssClass="center" />
                            <HeaderStyle CssClass="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EventStartTime" HeaderText="Begins: " SortExpression="EventStartTime" ApplyFormatInEditMode="True" DataFormatString="{0:hh\:mm}" HtmlEncode="False" >
                            <ControlStyle CssClass="Center" />
                            <HeaderStyle CssClass="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EventEndTime" HeaderText="Ends: " SortExpression="EventEndTime" DataFormatString="{0:hh\:mm}" HtmlEncode="False" >
                            <ControlStyle CssClass="Center" />
                            <HeaderStyle CssClass="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EventLocation" HeaderText="Location: " SortExpression="EventLocation" >
                            <ControlStyle CssClass="Center" />
                            <HeaderStyle CssClass="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EventName" HeaderText="Event Name:" SortExpression="EventName" >
                            <ControlStyle CssClass="Center" />
                            <HeaderStyle CssClass="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EventDescription" HeaderText="Event Description: " SortExpression="EventDescription" >
                            <ControlStyle CssClass="Center" />
                            <HeaderStyle CssClass="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EventSpeaker" HeaderText="Event Speaker(s): " SortExpression="EventSpeaker" >
                            <ControlStyle CssClass="Center" />
                            <HeaderStyle CssClass="center" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView></h5>  
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:casecompetitionConnectionString %>" SelectCommand="SELECT * FROM [EventInfo]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
