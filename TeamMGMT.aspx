<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamMGMT.aspx.cs" Inherits="CaseCompetitionApp.TeamMGMT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Team Managment</h2>
    <div class="col-md-12 center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberID" DataSourceID="SqlDataSource1" Width="95%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="ShirtSize" HeaderText="Shirt Size" SortExpression="ShirtSize" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="FoodAllergy" HeaderText="Food Allergy" SortExpression="FoodAllergy" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="Vegan" HeaderText="Vegan" SortExpression="Vegan" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Members]"></asp:SqlDataSource>
        </div>

    <div class="col-md-12">
        <br />
            <asp:Button ID="BtnNewMember" CssClass="btn btn-default" runat="server" Text="Add Members" OnClick="BtnAddMember_Click" />
        </div>
    <div class="col-md-12"> 
<fieldset id="NewMember"  runat="server" method="post" class="form-horizontal expandedbox" defaultfocus="txtEmail1" defaultbutton="btnSubmit">
    <div class="col-md-12">
    <br />
    </div>

    <div class="form-group col-md-12">
        <asp:Label class="control-label col-sm-3" ID="lblFirst" runat="server" Text="First Name:"></asp:Label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="Require First Name" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtFirstName">Required</asp:RequiredFieldValidator>
              </div>
    </div>

      <div class="form-group col-md-12">
        <asp:Label class="control-label col-sm-3" ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="Require Last Name" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtLName">Required</asp:RequiredFieldValidator>
              </div>
    </div> 
    
    <div class="form-group col-md-12">
        <asp:Label class="control-label col-sm-3" ID="lblEmail" runat="server" Text="Email:"></asp:Label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Require Email" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtEmail">Required</asp:RequiredFieldValidator>
              </div>
    </div>  
    
    <div class="form-group col-md-12">
        <asp:Label class="control-label col-sm-3" ID="lblPhone" runat="server" Text="Phone Number:"></asp:Label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Require Phone" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtPhone">Required</asp:RequiredFieldValidator>
              </div>
    </div>  


    <div class="form-group col-md-12">
        <asp:Label class="control-label col-sm-3" ID="lblShirt" runat="server" Text="Shirt Size:"></asp:Label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtShirt" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Require Shirt" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtShirt">Required</asp:RequiredFieldValidator>
              </div>
    </div>  

  <div class="form-group col-md-12">
        <asp:Label class="control-label col-sm-3" ID="lblVegan" runat="server" Text="Vegan:"></asp:Label>
        <div class="col-sm-5">
            <asp:RadioButton ID="rbtnYes" runat="server" Text="Yes"/>
            <asp:RadioButton ID="rbtnNo" runat="server" Text="No"/>
        </div>
        <div class="col-sm-4">
              </div>
    </div>  

 
    <div class="form-group col-md-12">
        <asp:Label class="control-label col-sm-3" ID="lblFood" runat="server" Text="Please list any food allergies:"></asp:Label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtfood" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-4">
              </div>
        </div>

     <div class="form-group col-md-12">
        <div class="col-sm-3"></div>
        <div class="col-sm-5">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-default"  OnClick="btnSubmit_Click" Width="125px" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-default"  OnClick="btnClear_Click" Width="125px" />
        </div>
        <asp:label class="col-sm-4" ID="lblSubmit" runat="server"></asp:label>
    </div>

</fieldset>
    </div>
</asp:Content>
