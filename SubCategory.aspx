<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="SubCategory.aspx.cs" Inherits="Project.SubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Manage">
     <div class="signupBox" style="height:280px; top:30%; padding-top:20px">

         <asp:Label ID="Label2" runat="server" Text="CatName" Class="col-xs-11" CssClass="Unamelbl">Main Category ID: </asp:Label>
            <div class="col-xs-12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatId" runat="server" ErrorMessage="Enter Valid Category ID" ControlToValidate="ddlMainCat" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlMainCat" runat="server" CssClass="ddlist"></asp:DropDownList>
             </div>

        <asp:Label ID="Label1" runat="server" Text="UserName" Class="col-xs-11" CssClass="Unamelbl">Sub Category Name: </asp:Label>
            <div class="col-xs-11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandname" runat="server" ErrorMessage="Enter Valid Sub Category Name" ControlToValidate="TxtSubcat" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TxtSubCat" runat="server" Class="form-control" CssClass="Unametxt" placeholder="Enter Sub Category"></asp:TextBox>
                
             </div>

            
            
               <div class="col-xs-11">
                   <asp:Button ID="AddSubCatBtn" runat="server" Text="Add Sub Category" CssClass="signup-btn" OnClick="AddSubCatBtn_Click"/>
               </div>
           
             </div>
                <!--Table Starts--->
                 <div class="table-box" style="position:absolute; top:55%;left:25%;  width:50%">
        <div class="panel panel-default">
            <div class="panel-heading">All Sub Category</div>
            <asp:Repeater ID="RepeaterSubCategory" runat="server">
                <HeaderTemplate>
                    <table class="table" style="color:black">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Sub Category</th>
                        <th>Main Category ID</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr>
                        <th> <%# Eval("SubCatID") %> </th>
                        <td><%# Eval("SubCatName") %></td>
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
</asp:Content>
