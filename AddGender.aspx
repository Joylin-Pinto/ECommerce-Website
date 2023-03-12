<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddGender.aspx.cs" Inherits="Project.AddGender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Manage">
     <div class="signupBox"style="height:200px; top:30%; padding-top:20px">

        <asp:Label ID="Label1" runat="server" Text="UserName" Class="col-xs-11" CssClass="Unamelbl"> Gender: </asp:Label>
            <div class="col-xs-11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" ErrorMessage="Enter Valid Gender" ControlToValidate="TxtGender" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TxtGender" runat="server" Class="form-control" CssClass="Unametxt" placeholder="Enter Gender"></asp:TextBox>
                
             </div>

            
            
               <div class="col-xs-11">
                   <asp:Button ID="AddGenBtn" runat="server" Text="Add Gender" CssClass="signup-btn" OnClick="AddGenBtn_Click" />
               </div>
           
             </div>
                <!--Table Starts--->
                 <div class="table-box" style="position:absolute; top:45%;left:25%;  width:50%">
        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>
            <asp:Repeater ID="RepeaterCGender" runat="server">
                <HeaderTemplate>
                    <table class="table" style="color:black">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Gender</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr>
                        <th> <%# Eval("GenderId") %> </th>
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
