<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Project.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rags and Tags</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="Chrome" />
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="icon" href="Icons/logo.png"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  
    <style>
        body{
           background-image:url("../Images/Signup-bg.jpg");
        }
        .forgot{
             margin:100px;
            color:white;
        }
    </style>
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
                    <li ><a href="#">About</a></li>
                    <li ><a href="#">Contact Us</a></li>
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
                         <li ><a href="SignUp.aspx">Sign Up</a></li>
                        <li ><a href="SignIn.aspx" class="active">Sign In</a></li>
                    </ul>
                </div>
            </div>
                </div>

        </div>
<!--- Sign In --->
        <div class="signupBox">

        <asp:Label ID="Label1" runat="server" Text="UserName" Class="col-xs-11" CssClass="Unamelbl">User Name: </asp:Label>
            <div class="col-xs-11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ErrorMessage="Enter Valid Username" ControlToValidate="TextBox1" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox1" runat="server" Class="form-control" CssClass="Unametxt" placeholder="Enter Username"></asp:TextBox>
                
             </div>

            <asp:Label ID="Label3" runat="server" Text="Password" Class="col-xs-11" CssClass="Passlbl">Password: </asp:Label>
            <div class="col-xs-11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="TextBox3" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox3" runat="server" class="form-control" CssClass="Passtxt" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                
                 
             </div>
            
            <div class="col-xs-6 form-group">
                <asp:CheckBox ID="CheckBox1" runat="server" class="remember" CssClass="rem"/>
                <label for="remember">Remeber Me</label>
            </div>
            
               <div class="col-xs-11">
                   <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="signup-btn" OnClick="Button1_Click" />
               </div>
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" NavigateUrl="~/SignUp.aspx">Create New account</asp:HyperLink>
            <div class="col-xs-11 form-group">
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="forgot" NavigateUrl="~/ForgotPassword.aspx">Forgot Password</asp:HyperLink>
            </div>
            <div style="color:white"> <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label></div>
          
             </div>
        
           
            
        <!---- Sign In End --->
         <!------ Footer start------>
         <footer class="footer-pos">
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
