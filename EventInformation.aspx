<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventInformation.aspx.cs" Inherits="CaseCompetitionApp.EventInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <img src="Images\CyHawk1.ico" class="col-md-5 col-md-offset-4 img-responsive" />
    </div>
    <div class="panel panel-default">
        <div class="panel-body, center">
            <h2>Competition Awards</h2>
            <h5><asp:Label ID="LblBox1" runat="server" Text="Label"></asp:Label></h5>
        </div>
        <br />
        <div class="panel-body, center">
            <h2>Team Rules & Requirements</h2>
            <h5><asp:Label ID="LblBox2" runat="server" Text="Label"></asp:Label></h5>
        </div>
        <br />
        <div class="panel-body, center">
            <h2>Judging Criteria</h2>
            <h5><asp:Label ID="LblBox3" runat="server" Text="Label"></asp:Label></h5>
        </div>
        <br />
        <div class="panel-body, center">
            <h2>Event Schedule</h2>
            <h5><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="8" DataKeyNames="EventID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" ShowHeaderWhenEmpty="True" CellSpacing="2" Width="1024px">
                <Columns>
                    <asp:BoundField DataField="EventID" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                    <asp:BoundField DataField="EventName" HeaderText="Event Name" SortExpression="EventName" />
                    <asp:BoundField DataField="EventDate" HeaderText="Date" SortExpression="EventDate" />
                    <asp:BoundField DataField="EventStartTime" HeaderText="Begins:" SortExpression="EventStartTime" />
                    <asp:BoundField DataField="EventEndTime" HeaderText="Ends:" SortExpression="EventEndTime" />
                    <asp:BoundField DataField="EventLocation" HeaderText="Location" SortExpression="EventLocation" />
                    <asp:BoundField DataField="EventDescription" HeaderText="Description" SortExpression="EventDescription" />
                    <asp:BoundField DataField="EventSpeaker" HeaderText="Speaker(s) / Presenter(s)" SortExpression="EventSpeaker" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:casecompetitionConnectionString %>" SelectCommand="SELECT * FROM [EventInfo] ORDER BY [EventDate], [EventStartTime], [EventName]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
