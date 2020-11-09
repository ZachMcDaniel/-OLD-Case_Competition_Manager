﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminEventInfo.aspx.cs" Inherits="CaseCompetitionApp.AdminEventInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<div class="container">
    <div class="row">
    <img src="Images\CyHawk1.ico" class="col-md-5 col-md-offset-4 img-responsive" />
    </div>
    <div class="form">
        <div class="form-group, center">
            <h3>Competition Awards</h3>
    <%--            <h2><asp:TextBox ID="txtFirstBoxtitle" runat="server" TextMode="SingleLine" Width="1024px"></asp:TextBox></h2>--%>
            <h5><asp:TextBox ID="txtFirstBox" runat="server" Rows="10" TextMode="MultiLine" Width="1024px"></asp:TextBox></h5>
        </div>
        <br />
        <div class="form-group, center">
            <h3>Team Rules & Requirements</h3>
    <%--            <h2><asp:TextBox ID="txtSecondBoxtitle" runat="server" TextMode="SingleLine" Width="1024px"></asp:TextBox></h2>--%>
            <h5><asp:TextBox ID="txtSecondBox" runat="server" Rows="10" TextMode="MultiLine" Width="1024px"></asp:TextBox></h5>
        </div>
        <br />
        <div class="form-group, center">
            <h3>Judging Criteria</h3>
    <%--            <h2><asp:TextBox ID="txtThirdBoxtitle" runat="server" TextMode="SingleLine" Width="1024px"></asp:TextBox></h2>--%>
            <h5><asp:TextBox ID="txtThirdBox" runat="server" Rows="10" TextMode="MultiLine" Width="1024px"></asp:TextBox></h5>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6 col-md-offset-6">
                <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
                <br />
                <br />
                <asp:Label ID="LblStatus3" runat="server" Text="Success!" CssClass="alert-success" OnDataBinding="BtnUpdate_Click" Visible="False"></asp:Label>
                </div>
        </div>
        <br />
        <br />
        <br />
        <div class="form-group, center">
            <h3>Event Schedule</h3>
            <div class="row">
                <h5><asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="2" CellSpacing="2" ForeColor="Black" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="SqlDataSource1" Width="1024px" ShowHeaderWhenEmpty="True" ShowFooter="True" HorizontalAlign="Center">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:TemplateField HeaderText="Event ID" InsertVisible="False" SortExpression="EventID">
                            <EditItemTemplate>
                                <asp:Label ID="EventID" runat="server" Text='<%# Eval("EventID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEventID" runat="server" Text='<%# Bind("EventID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ValidationGroup="INSERT" OnClick="LbInsert_Click" ID="lbInsert" runat="server">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date: " SortExpression="EventDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventDate") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditEventDate" runat="server" ErrorMessage="Enter Event Date" ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEventDate" runat="server" Text='<%# Bind("EventDate") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtEventDate" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEventDate" runat="server" ErrorMessage="Enter Event Date" ControlToValidate="txtEventDate" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Begins: " SortExpression="EventStartTime">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EventStartTime") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditEventStartTime" runat="server" ErrorMessage="Enter Start Time" ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEventStartTime" runat="server" Text='<%# Bind("EventStartTime") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtEventStartTime" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEventStartTime" runat="server" ErrorMessage="Enter Start Time" ControlToValidate="txtEventStartTime" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ends: " SortExpression="EventEndTime">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EventEndTime") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditEventEndTime" runat="server" ErrorMessage="Enter End Time" ControlToValidate="TextBox3" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEventEndTime" runat="server" Text='<%# Bind("EventEndTime") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtEventEndTime" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEventEndTime" runat="server" ErrorMessage="Enter End Time" ControlToValidate="txtEventEndTime" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location: " SortExpression="EventLocation">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EventLocation") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEditEventLocation" runat="server" ErrorMessage="Enter Event Location" ControlToValidate="TextBox4" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEventLocation" runat="server" Text='<%# Bind("EventLocation") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtEventLocation" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEventLocation" runat="server" ErrorMessage="Enter Event Location" ControlToValidate="txtEventLocation" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Event: " SortExpression="EventName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EventName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEditEventName" runat="server" ErrorMessage="Enter Event Name" ControlToValidate="TextBox5" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEventName" runat="server" Text='<%# Bind("EventName") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtEventName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEventName" runat="server" ErrorMessage="Enter Event Name" ControlToValidate="txtEventName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Event Details: " SortExpression="EventDescription">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("EventDescription") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEditEventDescription" runat="server" ErrorMessage="Enter Event Description" ControlToValidate="TextBox6" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEventDescription" runat="server" Text='<%# Bind("EventDescription") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtEventDescription" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEventDescription" runat="server" ErrorMessage="Enter Event Description" ControlToValidate="txtEventDescription" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Presenter(s) / Speaker(s): " SortExpression="EventSpeaker">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("EventSpeaker") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEditEventSpeaker" runat="server" ErrorMessage="Enter Name(s) of Speaker(s)" ControlToValidate="TextBox7" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEventSpeaker" runat="server" Text='<%# Bind("EventSpeaker") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtEventSpeaker" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEventSpeaker" runat="server" ErrorMessage="Enter Name(s) of Speaker(s)" ControlToValidate="txtEventSpeaker" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle Wrap="True" />
                        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView></h5>

                    <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" ForeColor="Red" runat="server" />
                    <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:casecompetitionConnectionString %>" DeleteCommand="DELETE FROM [EventInfo] WHERE [EventID] = @original_EventID AND (([EventName] = @original_EventName) OR ([EventName] IS NULL AND @original_EventName IS NULL)) AND (([EventDate] = @original_EventDate) OR ([EventDate] IS NULL AND @original_EventDate IS NULL)) AND (([EventStartTime] = @original_EventStartTime) OR ([EventStartTime] IS NULL AND @original_EventStartTime IS NULL)) AND (([EventEndTime] = @original_EventEndTime) OR ([EventEndTime] IS NULL AND @original_EventEndTime IS NULL)) AND (([EventLocation] = @original_EventLocation) OR ([EventLocation] IS NULL AND @original_EventLocation IS NULL)) AND (([EventDescription] = @original_EventDescription) OR ([EventDescription] IS NULL AND @original_EventDescription IS NULL)) AND (([EventSpeaker] = @original_EventSpeaker) OR ([EventSpeaker] IS NULL AND @original_EventSpeaker IS NULL))" InsertCommand="INSERT INTO [EventInfo] ([EventName], [EventDate], [EventStartTime], [EventEndTime], [EventLocation], [EventDescription], [EventSpeaker]) VALUES (@EventName, @EventDate, @EventStartTime, @EventEndTime, @EventLocation, @EventDescription, @EventSpeaker)" SelectCommand="SELECT * FROM [EventInfo] ORDER BY [EventDate], [EventStartTime] DESC, [EventName]" UpdateCommand="UPDATE [EventInfo] SET [EventName] = @EventName, [EventDate] = @EventDate, [EventStartTime] = @EventStartTime, [EventEndTime] = @EventEndTime, [EventLocation] = @EventLocation, [EventDescription] = @EventDescription, [EventSpeaker] = @EventSpeaker WHERE [EventID] = @original_EventID AND (([EventName] = @original_EventName) OR ([EventName] IS NULL AND @original_EventName IS NULL)) AND (([EventDate] = @original_EventDate) OR ([EventDate] IS NULL AND @original_EventDate IS NULL)) AND (([EventStartTime] = @original_EventStartTime) OR ([EventStartTime] IS NULL AND @original_EventStartTime IS NULL)) AND (([EventEndTime] = @original_EventEndTime) OR ([EventEndTime] IS NULL AND @original_EventEndTime IS NULL)) AND (([EventLocation] = @original_EventLocation) OR ([EventLocation] IS NULL AND @original_EventLocation IS NULL)) AND (([EventDescription] = @original_EventDescription) OR ([EventDescription] IS NULL AND @original_EventDescription IS NULL)) AND (([EventSpeaker] = @original_EventSpeaker) OR ([EventSpeaker] IS NULL AND @original_EventSpeaker IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
                        <DeleteParameters>
                            <asp:Parameter Name="original_EventID" Type="Int32" />
                            <asp:Parameter Name="original_EventName" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_EventDate" />
                            <asp:Parameter DbType="Time" Name="original_EventStartTime" />
                            <asp:Parameter DbType="Time" Name="original_EventEndTime" />
                            <asp:Parameter Name="original_EventLocation" Type="String" />
                            <asp:Parameter Name="original_EventDescription" Type="String" />
                            <asp:Parameter Name="original_EventSpeaker" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="EventName" Type="String" />
                            <asp:Parameter DbType="Date" Name="EventDate" />
                            <asp:Parameter DbType="Time" Name="EventStartTime" />
                            <asp:Parameter DbType="Time" Name="EventEndTime" />
                            <asp:Parameter Name="EventLocation" Type="String" />
                            <asp:Parameter Name="EventDescription" Type="String" />
                            <asp:Parameter Name="EventSpeaker" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EventName" Type="String" />
                            <asp:Parameter DbType="Date" Name="EventDate" />
                            <asp:Parameter DbType="Time" Name="EventStartTime" />
                            <asp:Parameter DbType="Time" Name="EventEndTime" />
                            <asp:Parameter Name="EventLocation" Type="String" />
                            <asp:Parameter Name="EventDescription" Type="String" />
                            <asp:Parameter Name="EventSpeaker" Type="String" />
                            <asp:Parameter Name="original_EventID" Type="Int32" />
                            <asp:Parameter Name="original_EventName" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_EventDate" />
                            <asp:Parameter DbType="Time" Name="original_EventStartTime" />
                            <asp:Parameter DbType="Time" Name="original_EventEndTime" />
                            <asp:Parameter Name="original_EventLocation" Type="String" />
                            <asp:Parameter Name="original_EventDescription" Type="String" />
                            <asp:Parameter Name="original_EventSpeaker" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
             </div>
        </div>
    </div>
</asp:Content>
