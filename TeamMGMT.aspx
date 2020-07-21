<%@ Page Title="Team Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamMGMT.aspx.cs" Inherits="CaseCompetitionApp.TeamMGMT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="center gold">Team Managment</h2>

  <%--  <asp:gridview id="gvTeam"         
    autogeneratecolumns="False"   
    emptydatatext="No data available." CssClass="GridViewStyle"         
    runat="server" DataKeyNames="ProductID"
    OnRowEditing="gvTeam_RowEditing" <%--OnRowCancelingEdit="gvTeam_RowCancelingEdit"      
    onrowupdating="gvTeam_RowUpdating" onrowdatabound="gvTeam_RowDataBound">
    <RowStyle CssClass="RowStyle" />             
    <FooterStyle CssClass="RowStyle" />                       
    <SelectedRowStyle CssClass="SelectedRowStyle" />   
    <HeaderStyle CssClass="HeaderStyle" />             
    <AlternatingRowStyle CssClass="AltRowStyle" />
    <Columns>                           
         <asp:TemplateField headertext="First Name">
            <HeaderStyle HorizontalAlign="Left" Width="200px" />
            <ItemStyle HorizontalAlign="Left" Width="200px"/>
            <ItemTemplate> <%#Eval("FirstName")%></ItemTemplate>
            <EditItemTemplate>
              <asp:TextBox id="txtFirst" Width="170px" text='<%# Eval("FirstName")%>' runat="server"/>                                            
            </EditItemTemplate>                   
        </asp:TemplateField>    
        <asp:TemplateField headertext="Last Name">
            <HeaderStyle HorizontalAlign="Left" Width="200px" />
            <ItemStyle HorizontalAlign="Left" Width="200px"/>
            <ItemTemplate> <%#Eval("LastName")%></ItemTemplate>
            <EditItemTemplate>
              <asp:TextBox id="txtLast" Width="170px" text='<%# Eval("LastName")%>' runat="server"/>                                            
            </EditItemTemplate>                   
        </asp:TemplateField>
        <asp:TemplateField headertext="Email">
            <HeaderStyle HorizontalAlign="Left" Width="200px" />
            <ItemStyle HorizontalAlign="Left" Width="200px"/>
            <ItemTemplate> <%#Eval("Email")%></ItemTemplate>
            <EditItemTemplate>
              <asp:TextBox id="txtTeamEmail" Width="170px" text='<%# Eval("Email")%>' runat="server"/>                                            
            </EditItemTemplate>                   
        </asp:TemplateField>
        <asp:TemplateField headertext="Food Allergy">
            <HeaderStyle HorizontalAlign="Left" Width="200px" />
            <ItemStyle HorizontalAlign="Left" Width="200px"/>
            <ItemTemplate> <%#Eval("FoodAllergy")%></ItemTemplate>
            <EditItemTemplate>
              <asp:TextBox id="txtFood" Width="170px" text='<%# Eval("FoodAllergy")%>' runat="server"/>                                            
            </EditItemTemplate>                   
        </asp:TemplateField>
        <asp:TemplateField headertext="Shirt Size">
            <HeaderStyle HorizontalAlign="Left" Width="150px" />
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate> <%#Eval("ShirtSize")%></ItemTemplate>
            <EditItemTemplate>
             <asp:DropDownList ID="ddlShirt" runat="server" > </asp:DropDownList>                                      
            </EditItemTemplate>                   
        </asp:TemplateField>
        <asp:TemplateField headertext="Phone Number">
            <HeaderStyle HorizontalAlign="Left" Width="200px" />
            <ItemStyle HorizontalAlign="Left" Width="200px"/>
            <ItemTemplate> <%#Eval("PhoneNumber")%></ItemTemplate>
            <EditItemTemplate>
              <asp:TextBox id="txtPhoneNumb" Width="170px" text='<%# Eval("PhoneNumber")%>' runat="server"/>                                            
            </EditItemTemplate>                   
        </asp:TemplateField>

        <asp:TemplateField headertext="Vegan">
            <HeaderStyle HorizontalAlign="Left" Width="150px" />
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate> <%#Eval("Vegan")%></ItemTemplate>
            <EditItemTemplate>                  
                <asp:PlaceHolder ID="plVegan" runat="server"></asp:PlaceHolder>
                <asp:HiddenField ID="hflVegan" Value='<%#Eval("Vegan")%>' runat="server" />
            </EditItemTemplate>                   
        </asp:TemplateField>    

                                    
        <asp:TemplateField>
        <ItemTemplate>
           <asp:LinkButton ID="btnedit" runat="server" CommandName="Edit" Text="Edit"/>                 
        </ItemTemplate>
        <EditItemTemplate>
           <asp:LinkButton ID="btnupdate" runat="server" CommandName="Update" Text="Update" />
           <asp:LinkButton ID="btncancel" runat="server" CommandName="Cancel" Text="Cancel"/>               
        </EditItemTemplate>             
        </asp:TemplateField>                                         
    </Columns>
</asp:gridview>

--%>



















<div class="row center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberID" DataSourceID="SqlDataSource1" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowSorting="True">
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
            <asp:BoundField DataField="Vegan" HeaderText="Vegan" SortExpression="Vegan" ApplyFormatInEditMode="True" >
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select MemberId, TeamId, FirstName, LastName, Email, FoodAllergy, ShirtSize, PhoneNumber, CASE WHEN Vegan = 1 THEN 'Yes' ELSE 'No' END AS Vegan From [Members] where TeamID = (select TeamID FROM TEAM where TeamName = (select Username FROM AspNetUsers where Id = @ID))"  UpdateCommand="UPDATE [Members] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [PhoneNumber] = @PhoneNumber, [ShirtSize] = @ShirtSize, [FoodAllergy] = @FoodAllergy, [Vegan] = @Vegan WHERE [MemberID] = @original_MemberID" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Members] where [MemberID] = @original_MemberID">
<SelectParameters>
    <asp:Parameter Name="ID" Type="String"/>
</SelectParameters>        
        <DeleteParameters>
              <asp:Parameter Name="original_MemberID" Type="String" />
          </DeleteParameters>
         <UpdateParameters>
              <asp:Parameter Name="MemberID" Type="String" />
              <asp:Parameter Name="FirstName" Type="String" />
                   <asp:Parameter Name="LastName" Type="String" />
              <asp:Parameter Name="Email" Type="String" />
              <asp:Parameter Name="PhoneNumber" Type="String" />
              <asp:Parameter Name="ShirtSize" Type="String" />
              <asp:Parameter Name="FoodAllergy" Type="String" />
              <asp:Parameter Name="Vegan" Type="string" />
          </UpdateParameters>
                </asp:SqlDataSource>
        </div>





    <div class="row col-md-12">
      <br />
    </div>

    <div class="row">
        <div class="col-md-3">
                <asp:Button ID="BtnNewMember" CssClass="btn btn-default grey" runat="server" Text="Add Members" OnClick="BtnAddMember_Click" />
        </div>
        <div class="col-md-9">

        </div>
        </div>

     <div class="col-md-12">
      <br />
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
            <asp:RadioButtonList ID="rbtnVegan" runat="server" Width="107px">
                <asp:ListItem Value="1">Yes</asp:ListItem>
                <asp:ListItem Value="0">No</asp:ListItem>
            </asp:RadioButtonList>
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
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-default grey"  OnClick="btnSubmit_Click" Width="125px" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-default grey"  OnClick="btnClear_Click" Width="125px" />
        </div>
    </div>
</fieldset>
    </div>
    <div class="col-md-12">
        <br />
        <hr />
    </div>

      <div class="bottomdiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink">Return to Hub</asp:HyperLink>
    </div>
</asp:Content>
