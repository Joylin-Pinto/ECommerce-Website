<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Project.AddProduct" %>

<asp:Content ID="AddProdWebFrm" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div class="container">
        <div class="form-horizontal AddProduct" >
            <div class="signupBox" style="top:56%; padding:10px 20px;height:850px;width:520px;background: rgba(100,100,100,0.5);">
            <h2 style="color:lavender; text-align:center; padding-top:5px">Add Product</h2>

        <div class="form-group">
            <div class="col-lg-12">
            <asp:Label ID="Label1" runat="server" Text="Product Name: " CssClass="Pdlabel"></asp:Label>
            </div>
            <div class="col-lg-12">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="PdTxt"></asp:TextBox>
            </div>
        </div>
                <div class="form-group">
            <div class="col-lg-6">
            <asp:Label ID="lblPrice" runat="server" Text="Price: " CssClass="Pdlabel"></asp:Label>
            </div>
                    <div class="col-lg-6">
            <asp:Label ID="LabeSPrice" runat="server" Text="Selling Price: " CssClass="Pdlabel"></asp:Label>
            </div>
            <div class="col-lg-6">
                <asp:TextBox ID="TxtPrice" runat="server" CssClass="PdTxt"></asp:TextBox>
            </div>
                    <div class="col-lg-6">
                <asp:TextBox ID="TxtSPrice" runat="server" CssClass="PdTxt"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-6">
            <asp:Label ID="Label2" runat="server" Text="Brand Name: " CssClass="Pdlabel"></asp:Label>
            </div>
            <div class="col-lg-6">
            <asp:Label ID="Label5" runat="server" Text="Category: " CssClass="Pdlabel" ></asp:Label>
            </div>
            <div class="col-lg-6">
                <asp:DropDownList ID="ddlBrand" runat="server" CssClass="ddlist"></asp:DropDownList>
            </div>
            <div class="col-lg-6">
                <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" CssClass="ddlist" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" ></asp:DropDownList>
            </div>
            <div class="col-lg-6">
            <asp:Label ID="Label3" runat="server" Text="Sub Category: " CssClass="Pdlabel"></asp:Label>
            </div>
                <div class="col-lg-6">
            <asp:Label ID="Label12" runat="server" Text="Gender: " CssClass="Pdlabel"></asp:Label>
            </div>
            
            <div class="col-lg-6">
                <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="ddlist" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-lg-6">
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="ddlist" AutoPostBack="True" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged"></asp:DropDownList>
            </div>
            
        </div>
                <div class="form-group">
                    <div class="col-lg-6">
            <asp:Label ID="Label13" runat="server" Text="Quantity: " CssClass="Pdlabel"></asp:Label>
            </div>
                    <div class="col-lg-6">
            <asp:Label ID="Label4" runat="server" Text="Size: " CssClass="Pdlabel"></asp:Label>
            </div>
                    
                    
                    <div class="col-lg-6">
                <asp:TextBox ID="TxtQty" runat="server" CssClass="PdTxt"></asp:TextBox>
            </div>

                    <div class="col-lg-6">
                <asp:CheckBoxList ID="cblSize" CssClass="ddlist" class="form-control" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>
            </div>
                    
                     
                </div>
            <div class="form-group" runat="server">
             <div class="col-lg-12">
            <asp:Label ID="Label6" runat="server" Text="Description: " CssClass="Pdlabel"></asp:Label>
            </div>
            <div class="col-lg-12">
                <textarea id="TextArea1" runat="server" cols="10" rows="2" style="width:100%;background:rgba(255,255,255,0.2); "></textarea>
            </div>
            </div>
              <div class="form-group">
             <div class="col-lg-6">
            <asp:Label ID="Label7" runat="server" Text="Product Details: " CssClass="Pdlabel"></asp:Label>
            </div>
                  <div class="col-lg-6">
            <asp:Label ID="Label8" runat="server" Text="Materials & Care: " CssClass="Pdlabel"></asp:Label>
            </div>
            <div class="col-lg-6">
                 <asp:TextBox ID="PdDetails" runat="server" CssClass="PdTxt"></asp:TextBox>
            </div>
             
             
            <div class="col-lg-6">
                 <asp:TextBox ID="txtMatCare" runat="server" CssClass="PdTxt"></asp:TextBox>
            </div>
            </div>
             <div class="form-group">
             <div class="col-lg-6">
            <asp:Label ID="Label9" runat="server" Text="Upload Image: " CssClass="Pdlabel"></asp:Label>
            </div>
            <div class="col-lg-6">
            <asp:Label ID="Label14" runat="server" Text="Upload Image: " CssClass="Pdlabel"></asp:Label>
            </div>
            <div class="col-lg-6">
                <asp:FileUpload ID="Fuimg01" runat="server" />
            </div>
            <div class="col-lg-6">
                <asp:FileUpload ID="Fuimg02" runat="server" />
            </div>
            </div>
             <div class="form-group">
             <div class="col-lg-6">
            <asp:Label ID="Label10" runat="server" Text="Upload Image: " CssClass="Pdlabel"></asp:Label>
            </div>
            <div class="col-lg-6">
            <asp:Label ID="Label11" runat="server" Text="Upload Image: " CssClass="Pdlabel"></asp:Label>
            </div>
             <div class="col-lg-6">
                <asp:FileUpload ID="Fuimg04" runat="server" />
            </div>
            <div class="col-lg-6">
                <asp:FileUpload ID="Fuimg05" runat="server" />
            </div> 
            </div>
            <div class="form-group">

              <div class="col-lg-4 ">
                <asp:CheckBox ID="chFd" runat="server" class="remember" style="color:white" />
                <label for="remember" style="color:White">Free Delivery</label>
                </div>
             <div class="col-lg-4">
                <asp:CheckBox ID="chret" runat="server" class="remember" style="color:white" />
                <label for="remember" style="color:White">30 Days return</label>
            </div>
                <div class="col-lg-4 ">
                <asp:CheckBox ID="cbCod" runat="server" class="remember" style="color:white" />
                <label for="remember" style="color:White">Cash on Delivery</label>
            </div>
            </div>
            <div class="col-lg-12" style="width:80%">
                <asp:Button ID="BtnAdd" runat="server" Text="Add Product" CssClass="btn btn-success AddProductBtn" OnClick="BtnAdd_Click"  />

            </div>
        </div>
            </div>
   </div>
</asp:Content>
