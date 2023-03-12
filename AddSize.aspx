<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddSize.aspx.cs" Inherits="Project.AddSize" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Manage" style="height:120%">
     <div class="signupBox" style="top:40%; height:500px; padding-top:10px; padding-left:20px" >
         <h2 style="text-align:center"> Add Size </h2>
         <asp:Label ID="Label1" runat="server" Text="Size" Class="col-xs-11" CssClass="Unamelbl">Size: </asp:Label>
            <div class="col-xs-11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSize" runat="server" ErrorMessage="Enter Valid Size" ControlToValidate="TxtSize" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TxtSize" runat="server" style="width: 109%;margin-bottom:15px;border:none;border-bottom: 2px solid #fff;outline:none;height:30px;color: #fff;font-size: 16px;background: transparent" placeholder="Enter Size" ></asp:TextBox>
                
             </div>

         <asp:Label ID="Label2" runat="server" Text="Brand" Class="col-xs-11" CssClass="Unamelbl">Brand: </asp:Label>
            <div class="col-xs-12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrand" runat="server" ErrorMessage="Enter Valid Brand" ControlToValidate="ddlBrand" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlBrand" runat="server" CssClass="ddlist"></asp:DropDownList>
             </div>
         <div class="form-group">
             <div class="col-lg-6">
          <asp:Label ID="Label4" runat="server" Text="Category"  CssClass="Unamelbl">Category: </asp:Label>
                 </div>
             <div class="col-lg-6">
         <asp:Label ID="Label3" runat="server" Text="Sub Category" Class="col-lg-6" CssClass="Unamelbl">Sub Category: </asp:Label>
                 </div>
            <div class="col-xs-6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" ErrorMessage="Enter Valid Category" ControlToValidate="ddlCategory" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddlist" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
             </div>
         </div>
         <div class="col-xs-6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategory" runat="server" ErrorMessage="Enter Valid Sub Category" ControlToValidate="ddlSubCategory" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="ddlist"></asp:DropDownList>
             </div>

        
            
        
         <asp:Label ID="Label5" runat="server" Text="Gender" Class="col-xs-11" CssClass="Unamelbl">Gender: </asp:Label>
            <div class="col-xs-12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" ErrorMessage="Enter Valid Gender" ControlToValidate="ddlGender" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="ddlist"></asp:DropDownList>
             </div>
            
               <div class="col-xs-11">
                   <asp:Button ID="AddSizetBtn" runat="server" Text="Add Size" CssClass="signup-btn" style="margin:10px 35px" OnClick="AddSizetBtn_Click" />
               </div>
           
             </div>
                <!--Table Starts--->
                 <div class="table-box" style="position:absolute; top:70%;left:25%;  width:50%">
        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>
            <asp:Repeater ID="RepeaterSize" runat="server">
                <HeaderTemplate>
                    <table class="table" style="color:black">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Size</th>
                        <th>Brand ID</th>
                        <th>Category ID</th>
                        <th>Sub Category ID</th>
                        <th>Gender ID</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr>
                        <th> <%# Eval("SizeID") %> </th>
                        <td><%# Eval("SizeName") %></td>
                          <td><%# Eval("Name") %></td>
                          <td><%# Eval("CatName") %></td>
                         <td><%# Eval("SubCatName") %></td>
                         <td><%# Eval("GenderName") %></td>
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
