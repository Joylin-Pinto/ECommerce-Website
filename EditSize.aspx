<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditSize.aspx.cs" Inherits="Project.EditSize" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="Manage" style="height:150%;background-size:cover">
     <div class="signupBox col-md-11" style="height:820px; width:60%;top:46%; padding-top:20px; margin-top:150px">
         <div class="row" style="margin:0px 100px">
             <div class="col-sm-4">
                  <div class="form-group">
                       <label> Enter ID:</label>
                       <asp:TextBox ID="txtID" CssClass="form-control" runat="server" AutoPostBack="true"  ontextchanged="txtID_TextChanged"></asp:TextBox>
                  </div>
                </div>
             <div class="col-sm-4">
                 <div class="form-group">
                       <label> Enter Size</label>
                       <asp:TextBox ID="txtSize" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
             </div>
             <div class="col-sm-4">
                 <div class="form-group">
                       <label> Select Brand</label>
                        <asp:DropDownList ID="ddlBrand" CssClass ="form-control" runat="server"></asp:DropDownList>
                  </div>
             </div>
               <div class="col-sm-4">
                    <div class="form-group">
                       <label> Select Category</label>
                        <asp:DropDownList ID="ddlCategory" CssClass ="form-control" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                  </div>
               </div>
               <div class="col-sm-4">
                   <div class="form-group">
                       <label> Sub Category</label>
                        <asp:DropDownList ID="ddlSubCategory" CssClass ="form-control" runat="server"></asp:DropDownList>
                  </div>
               </div>
               <div class="col-sm-4">
                   <div class="form-group">
                       <label> Gender</label>
                       <asp:DropDownList ID="ddlGender" CssClass ="form-control" runat="server"></asp:DropDownList>
                  </div>
               </div>
                  
                  <div class="form-group">
                  <asp:Button ID="btnUpdateSubCategory" CssClass="btn btn-primary" runat="server" Text="UPDATE" onclick="btnUpdateSubCategory_Click" />
                  </div>
               </div>
              <div class="col-sm-2"></div>

               <div class="col-sm-8">

                <div class="row">
                <div class="col-md-12">
                <br />
                 <asp:TextBox ID="txtFilterGrid1Record" style="border:2px solid blue" CssClass="form-control" runat="server" placeholder="Search Category...." onkeyup="Search_Gridview(this)"></asp:TextBox>
                <hr />
                   <div class="table table-responsive">
                       <asp:GridView ID="GridView1" CssClass="table table-condensed table-hover gridviews"  runat="server" EmptyDataText="Record not found...">
                       </asp:GridView>
                   </div>
                </div>
             </div>
               
               </div>
          
         </div>
          </div>
           
</asp:Content>
