
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rags and Tags</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="Chrome" />
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="icon" href="Icons/logo.png"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>      
    <script>
        $(document).ready(function myfunction() {
            $("#btnCart").Click(function myfunction() {
                window.location.href = "`/Cart.aspx";
            });
        });
    </script>
</head>
    
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"></button>
                        <span class="sr-only" >Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    
                    <a class="navbar-brand" href="Default.aspx"> 
                       <span>
                        <img src="Icons/logo.png" height="30" style="padding-right:10px; padding-bottom:2px" alt="ECommerce"/>Rags And Tags</span></a>
                       </div>
                
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                    <li ><a href="Default.aspx">Home</a></li>
                    <li ><a href="About.aspx">About</a></li>
                     <li class="dropdown">
                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                         <ul class="dropdown-menu">
                             <li> <a href ="Products.aspx">All Products</a></li>
                             <li role="separator" class="divider"></li>
                             <li class="dropdown-header">Mens</li>
                             <li role="separator" class="divider"></li>
                             <li><a href="#">Shirts</a></li>
                             <li><a href="#">Trousers</a></li>
                             <li><a href="#">Shoes</a></li>
                             <li role="separator" class="divider"></li>
                             <li class="dropdown-header">Womens</li>
                                 <li role="separator" class="divider"></li>
                                   <li><a href="WomenDress.aspx">Dress</a></li>
                             <li><a href="WomenTops.aspx">Tops</a></li>
                             <li><a href="WomenShoes.aspx">Shoes</a></li>
                             <li role="separator" class="divider"></li>
                             <li><a href="Electronics.aspx">Electronics</a></li>
                         </ul>
                     </li>
                        <li><button class="btn btn-primary navbar-btn" type="button">
                            Cart <span class="badge" id="pCount" runat="server" style="margin-right:10px"></span></button></li>
                         <li id="SignUpBtn" runat="server" ><a  href="SignUp.aspx">SignUp</a></li>
                        <li id="SignIntBtn"  runat="server"><a  href="SignIn.aspx">SignIn</a></li>
                        <li><asp:Button ID="btnlogout" runat="server" Text="Sign Out" CssClass="btn btn-default navbar-btn" OnClick="Button1_Click" /></li>
                    </ul>
                </div>
            </div>
                </div>
            <!------ Image Slider------>
            <div class="container" style="width:100%;">  
            <h2 class="carousel-hidden">Carousel</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="Images/image1.jpg" alt="Los Angeles" style="width:100%;"/>
      </div>

      <div class="item">
        <img src="Images/image2.jpg" alt="Chicago" style="width:100%;"/>
      </div>
    
      <div class="item">
        <img src="Images/image3.jpg" alt="New york" style="width:100%;"/>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
 <!------ Image Slider------>
 </div>

         <!------ Middle Content------>
        <div>
            <div class="container center"  style="margin-top:20px;">
                <div class="row">
                    <div class="col-lg-4">
                        <img class="img-circle" src="Images/phone-circle.jpg"  alt="" height="140" width="140"/>
                        <h2>Electronics</h2>
                        <p>Our store offers a wide range of electronics, latest and greatest smartphones, tablets, laptops, and cameras from top brands</p>
                        <p><a class="btn btn-default" href="Electronics.aspx" role="button">View More</a></p>
                    </div>
                    <div class="col-lg-4">
                        <img class="img-circle" src="Images/cloths-circle.jpg"  alt="" height="140" width="140"/>
                        <h2>Clothing</h2>
                        <p>At our store, we offer a wide selection of clothing to suit every style and occasion. From casual wear to formal wear, we have something for everyone. </p>
                        <p><a class="btn btn-default" href="WomenDress.aspx" role="button">View More</a></p>
                    </div>
                    <div class="col-lg-4">
                        <img class="img-circle" src="Images/shoes-circle.jpg"  alt="" height="140" width="140"/>
                        <h2>Footwear</h2>
                        <p>Step up your shoe game with our wide selection of footwear. We have everything from comfy sneakers to stylish boots and sandals.</p>
                        <p><a class="btn btn-default" href="ManShoes.aspx" role="button">View More</a></p>
                    </div>

                </div>
            </div>
        </div>
        <!------ Footer start------>
        <footer>
        <div class="container">
            <p class="pull-right"><a href="Default.aspx">Back to top</a></p>
            <p>&copy;2023 RagsandTags.in &middot;<a href="Default.aspx">  Home &middot;</a><a href="Default.aspx">About &middot;</a><a href="Default.aspx">Home &middot;</a><a href="Default.aspx">Contact &middot;</a><a href="Default.aspx">Products </a>
            </p>
        </div>
        </footer>
        <!------ Footer End------>
    </form>
    
  
</body>
</html>
