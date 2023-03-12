<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Project.UserHome" %>

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
            $("#btnCart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

    </script>
    <style>
        .footer-pos{
            width:auto;
    height:40px;
    position:absolute;
    top:700px;
    bottom:0px;
    left:0;
    right:0;
    margin:auto;
    background-color:lightblue;
        }
        .umsg{
            font-size:25px;
        }
    </style>
     
</head>
<body>
    <form id="form1" runat="server">
        <br />
          <br />
          <h2 style="margin:60px 0px 20px 20px">Welcome User!</h2>
        <div>
             <!---Navbar Start--->
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
                             <li><a href="ManShirt.aspx">Shirts</a></li>
                             <li><a href="ManPants.aspx">Trousers</a></li>
                             <li><a href="ManShoes.aspx">Shoes</a></li>
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
                          <li><button class="btn btn-primary navbar-btn" type="button" id="btnCart" style="margin-right:10px">
                            Cart <span class="badge" id="pCount" runat="server" style="margin-right:10px" ></span></button></li>
                         <li><asp:Button ID="Button2" runat="server" Text="Sign In" CssClass="btn btn-default navbar-btn" OnClick="Button2_Click"  /></li>
                       <li> <asp:Button ID="Button1" runat="server" Text="Sign Out" CssClass="btn btn-default navbar-btn" OnClick="Button1_Click"  /></li>

                    </ul>
                </div>
            </div>
                </div>
            <!---Navbar End--->
           
    <br/>
     <asp:Label ID="Label1" runat="server" CssClass="text-success umsg"  ></asp:Label>



            <!------ Footer start------>
        <footer class="footer-pos">
        <div class="container">
            <p class="pull-right"><a href="Default.aspx">Back to top</a></p>
            <p>&copy;2023 RagsandTags.in &middot;<a href="Default.aspx">  Home &middot;</a><a href="Default.aspx">About &middot;</a><a href="Default.aspx">Home &middot;</a><a href="Default.aspx">Contact &middot;</a><a href="Default.aspx">Products </a>
            </p>
        </div>
        </footer>
        <!------ Footer End------>
        </div>
    </form>
</body>
</html>
