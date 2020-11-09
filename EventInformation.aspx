﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventInformation.aspx.cs" Inherits="CaseCompetitionApp.EventInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container">
    <div class="row">
        <img src="Images\CyHawk1.ico" class="col-md-5 col-md-offset-4 img-responsive" />
    </div>
    <div class="form">
        <div class="form-group, center">
                <h3>Competition Awards</h3>
                <h5><asp:Label ID="LblBox1" runat="server" Font-Size="Medium"></asp:Label></h5>
            </div>
            <br />
        <div class="form-group, center">
                <h3>Team Rules & Requirements</h3>
                <h5><asp:Label ID="LblBox2" runat="server" Font-Size="Medium"></asp:Label></h5>
            </div>
            <br />
        <div class="form-group, center">
                <h3>Judging Criteria</h3>
                <h5><asp:Label ID="LblBox3" runat="server" Font-Size="Medium"></asp:Label></h5>
            </div>
            <br />
        <div class="form-group, center">
                <h3>Event Schedule</h3>
            <div class="row">
                <h5><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="8" DataKeyNames="EventID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" ShowHeaderWhenEmpty="True" CellSpacing="2" Width="1024px">
                    <Columns>
                        <asp:BoundField DataField="EventID" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                        <asp:BoundField DataField="EventDate" DataFormatString="{0:d}" HeaderText="Date: " SortExpression="EventDate" ApplyFormatInEditMode="True" />
                        <asp:BoundField DataField="EventStartTime" HeaderText="Begins: " SortExpression="EventStartTime" ApplyFormatInEditMode="True" DataFormatString="{0:hh\:mm}" HtmlEncode="False" />
                        <asp:BoundField DataField="EventEndTime" HeaderText="Ends: " SortExpression="EventEndTime" DataFormatString="{0:hh\:mm}" HtmlEncode="False" />
                        <asp:BoundField DataField="EventLocation" HeaderText="Location: " SortExpression="EventLocation" />
                        <asp:BoundField DataField="EventName" HeaderText="Event Name:" SortExpression="EventName" />
                        <asp:BoundField DataField="EventDescription" HeaderText="Event Description: " SortExpression="EventDescription" />
                        <asp:BoundField DataField="EventSpeaker" HeaderText="Event Speaker(s): " SortExpression="EventSpeaker" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:casecompetitionConnectionString %>" SelectCommand="SELECT * FROM [EventInfo] ORDER BY [EventDate], [EventStartTime] DESC, [EventName]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</div>
</asp:Content>