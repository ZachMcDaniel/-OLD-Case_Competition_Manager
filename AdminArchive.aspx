<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminArchive.aspx.cs" Inherits="CaseCompetitionApp.AdminArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h2 class=" center gold">
       Admin Competition Archive
     </h2>
    <h3 class="center">
        Modify Competition Archives and Results
    </h3>

    <hr />

    <div class="row">
        <div>
             <div class="col-md-2" style="text-align:right;vertical-align:central">
             <asp:Label ID="lblArchive" style="text-align:right; font-weight:bold; vertical-align:central" runat="server"  CssClass="control-label" Text="Name of Competition: "></asp:Label>
                 </div>
            <div class="col-md-3">
             <asp:TextBox ID="txtCompetition" runat="server" class="ArchBox"></asp:TextBox>
            <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompetition" ErrorMessage="RequiredFieldValidator">Competition Name Required</asp:RequiredFieldValidator>
        </div>
        </div>
       <div>
           <div class="col-md-2" style="text-align:right;vertical-align:central">
              <asp:Label ID="lblDate" style="text-align:right; font-weight:bold; vertical-align:central" runat="server" CssClass="control-label" Text="Date of Competition: "></asp:Label>
               </div>
           <div class="col-md-3">
              <asp:TextBox ID="txtDate" textmode="Date" runat="server" class="ArchBox"></asp:TextBox>
            <br />

              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate" ErrorMessage="RequiredFieldValidator">Competition Date Required</asp:RequiredFieldValidator>
        </div>
       </div>
          <div class="col-md-2">
            <asp:Button ID="BtnArchive" CssClass="btn btn-default" Style="padding-bottom:0px; padding-top:0px; margin-top:0px;text-align:center" runat="server" OnClientClick="return confirm('Are you sure you want to archive the current competition?')" Text="Archive Competition" Height="26px" OnClick="Btn_Archive" />
              <asp:Label ID="lblEmpty" runat="server" CssClass="text-danger" Text=""></asp:Label>
          </div>
    </div>
       <hr />

     <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvCompete" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCompetition" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataKeyNames="CompetitionID">
                <Columns>
                    <asp:BoundField DataField="CompetitionName" HeaderText="Competition Name" SortExpression="CompetitionName" >
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompetitionDate" HeaderText="Competition Date" SortExpression="CompetitionDate" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    
                    <asp:TemplateField>
                         
                <ItemTemplate>
                    <asp:Button ID="btnUn" CssClass="button" OnClick="btnunarchive" runat="server" Text="Unarchive" />
                </ItemTemplate>

                <ControlStyle CssClass="padding" />
                <HeaderStyle CssClass="padding" />
                <ItemStyle CssClass="padding" />
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
            <asp:SqlDataSource ID="SqlCompetition" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CompetitionId, CompetitionName, FORMAT([CompetitionDate], 'MM/dd/yy') AS CompetitionDate FROM [Competition]"></asp:SqlDataSource>
        </div>
    </div>
    <br />
      <div class="bottomdiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink" >Return to Hub</asp:HyperLink>
    </div>
     
</asp:Content>
