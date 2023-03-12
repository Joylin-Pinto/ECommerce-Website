<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="Project.AddBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Manage">
     <div class="signupBox" style="height:200px; top:30%; padding-top:20px">

        <asp:Label ID="Label1" runat="server" Text="UserName" Class="col-xs-11" CssClass="Unamelbl">Brand Name: </asp:Label>
            <div class="col-xs-11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandname" runat="server" ErrorMessage="Enter Valid Brand Name" ControlToValidate="TxtBrand" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TxtBrand" runat="server" Class="form-control" CssClass="Unametxt" placeholder="Enter Username"></asp:TextBox>
                
             </div>

            
            
               <div class="col-xs-11">
                   <asp:Button ID="AddBrandBtn" runat="server" Text="Add Brand" CssClass="signup-btn" OnClick="AddBrandBtn_Click"/>
               </div>
           
             </div>
         <div class="table-box" style="position:absolute; top:45%;left:25%;  width:50%">
        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>
            <asp:Repeater ID="RepeaterBrands" runat="server">
                <HeaderTemplate>
                    <table class="table" style="color:black">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Brand</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr>
                        <th> <%# Eval("BrandId") %> </th>
                        <td><%# Eval("Name") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                          
                </tbody>

            </table>
                </FooterTemplate>
            </asp:Repeater>

            
             
        </div>

    </div>
        </div>
   
        <!---- Sign In End --->
</asp:Content>
