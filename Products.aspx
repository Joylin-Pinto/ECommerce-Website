<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Project.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />

    <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                        Cart <span id="CartBadge" runat="server" class="badge">0</span>
                    </button>
    <div class="row" style="padding-top:50px; width:98%; height:425px; margin-left:15px">
        <asp:Repeater ID="rpteProducts" runat="server">
            <ItemTemplate>
            <div  class="col-sm-3 col-md-3">
                <a href="ProductView.aspx?PID=<%# Eval("PID")%>" style="text-decoration:none">
                <div class="thumbnail">
            <img src="Images/ProductImages/<%# Eval("PID")%>/<%#Eval("ImageName") %><%#Eval("Extension") %>" alt="<%#Eval("ImageName") %>" style="height:425px; width:340px" />
                <div class="caption">
                <div class="prodbrand"><%#Eval("BrandName") %></div>
                <div class="proName"><%#Eval("PName") %></div>
                <div class="proPrice">
                    <span class="progPrice"><%#Eval("PPrice","{0:c}") %></span>
                        <span class="prodPriceDIscount"> (<%#Eval("DiscAmount","{0:c}") %> Off)</span>
                        <div class="priceGreen"><%#Eval("PSelPrice","{0:c}") %></div>
                </div>
                </div>
                </div>
        </div>
                </a>
                </ItemTemplate>
            </asp:Repeater>
    </div>
</asp:Content>
