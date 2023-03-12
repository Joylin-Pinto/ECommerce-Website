<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Project.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Manage">
     <div class="signupBox" style="height:200px; top:30%; padding-top:20px">

        <asp:Label ID="Label1" runat="server" Text="UserName" Class="col-xs-11" CssClass="Unamelbl">Category Name: </asp:Label>
            <div class="col-xs-11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoryname" runat="server" ErrorMessage="Enter Valid Category Name" ControlToValidate="TxtCategory" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TxtCategory" runat="server" Class="form-control" CssClass="Unametxt" placeholder="Enter Category"></asp:TextBox>
                
             </div>

            
            
               <div class="col-xs-11">
                   <asp:Button ID="AddCategoryBtn" runat="server" Text="Add Category" CssClass="signup-btn" OnClick="AddCategoryBtn_Click"/>
               </div>
           
             </div>
        <!--Table Starts--->
                 <div class="table-box" style="position:absolute; top:45%;left:25%;  width:50%">
        <div class="panel panel-default">
            <div class="panel-heading">All Category</div>
            <asp:Repeater ID="RepeaterCategory" runat="server">
                <HeaderTemplate>
                    <table class="table" style="color:black">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Category</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr>
                        <th> <%# Eval("CATId") %> </th>
                        <td><%# Eval("CatName") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                          
                </tbody>

            </table>
                </FooterTemplate>
            </asp:Repeater>

            
             
        </div>
 <!--Table Endss--->
    </div>
        </div>
</asp:Content>
