<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="Project.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
    <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                        Cart <span id="CartBadge" runat="server" class="badge">0</span>
    </button>
    <br />

    <!--- Success Alert --->
                        <div id="divSuccess" runat="server" class="alert alert-success alert-dismissible fade in h4">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Success! </strong>Item successfully added to cart. <a href="Cart.aspx">View Cart</a>
                        </div>

    <div style="padding-top:50px">
        <div class="col-md-5">
            <div style="max-width:480px; margin-left:100px" class="thumbnail">
                <!-- Product Image Slider --->

                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      <li data-target="#carousel-example-generic" data-slide-to="3"></li>
      <li data-target="#carousel-example-generic" data-slide-to="4"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
      <asp:Repeater ID="RepeaterImage" runat="server">
          <ItemTemplate>
     <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>" >
      <img src ="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>" "/>
    </div>
    </ItemTemplate>
    </asp:Repeater>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 100%);">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 100%);">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
                 <!-- Product Image Slider --->

                
            </div>
        </div>
        
        <div class="col-md-5">
            <asp:Repeater ID="RepeaterProdDetails" runat="server" OnItemDataBound="RepeaterProdDetails_ItemDataBound">
                <ItemTemplate>
            <div class="divDet1">
            <h1 class="proNameView"><%# Eval("PName") %></h1>
            <span class="progPriceView">Rs. <%# Eval("PPrice","{0:c}") %></span><span class="prodPriceDIscountView"> ( <%# String.Format("{0}", Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %> OFF)</span><br />
            <div  class="proPriceView">  Rs. <%# Eval("PSelPrice","{0:c}") %></div>
        </div>
             <div>
                 <h5 class="h5size">SIZE</h5>
                 <div>
                     <asp:RadioButtonList ID="RblSize" runat="server" CssClass="radio-list" RepeatDirection="Horizontal"> 
                         <asp:ListItem Value="S" Text="S"></asp:ListItem>
                         <asp:ListItem Value="M" Text="M"></asp:ListItem>
                         <asp:ListItem Value="L" Text="L"></asp:ListItem>
                         <asp:ListItem Value="XL" Text="XL"></asp:ListItem>
                     </asp:RadioButtonList>
                 </div>
             </div>
             <div class="divDet1">
                 <asp:Button ID="BtnAddtoCart" runat="server" CssClass="MainBtn" Text="Add To Cart" onClick="BtnAddtoCart_Click"/>
                 <asp:Label ID="LblError" runat="server" Text="Label" Visible="False"></asp:Label>
                  
             </div>
             <div class="divDet1">
                 <h5 class="h5size">Description</h5>
                 <p><%# Eval("PDescription") %></p>
                 <h5 class="h5size">Product Details</h5>
                 <p>
                    <%# Eval("PProductDetails") %>
                 </p>
                 <h5 class="h5size">Material & Care</h5>
                 <p><%# Eval("PMaterialCare") %></p>
             </div>
            <div>
                <p><%#((int) Eval("FreeDelivery")==1)? "Free Delivery":"" %></p>
                <p><%#((int) Eval("30DayRet")==1)? "30 Days Return":"" %></p>
                <p><%#((int) Eval("COD")==1)? "Cash on Delivery":"" %></p>
            </div>
                    <asp:HiddenField ID="HfBrandID" runat="server" Value='<%# Eval("PBrandID") %>' />
                    <asp:HiddenField ID="HfCatID" runat="server" Value='<%# Eval("PCategoryID") %>' />
                    <asp:HiddenField ID="HfSubCatID" runat="server" Value='<%# Eval("PSubCatID") %>' />
                    <asp:HiddenField ID="HfGenderID" runat="server" Value='<%# Eval("PGender") %>' />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
    </div>
</asp:Content>
