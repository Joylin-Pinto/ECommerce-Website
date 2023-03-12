<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Project.ForgotPassword" %>

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
        h2 , h4{
            color:white;
            text-align:center;
            padding-bottom:20px;
        }
        .signupBox{
            padding-top:30px;
            width:60%;
        }
        .Emailtxt{
            padding-left:1.5rem;
            width:50%;
            text-align:center;
            margin-left:80px;
        }
        .signup-btn{
            margin-left:190px;
            width:50%;
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
                    <li ><a href="#">Blog</a></li>
                     <li class="dropdown">
                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                         <ul class="dropdown-menu">
                             <li class="dropdown-header">Mens</li>
                             <li role="separator" class="divider"></li>
                             <li><a href="#">Shirts</a></li>
                             <li><a href="#">Trousers</a></li>
                             <li><a href="#">Shoes</a></li>
                             <li role="separator" class="divider"></li>
                             <li class="dropdown-header">Womens</li>
                                 <li role="separator" class="divider"></li>
                                  <li><a href="#">Dress</a></li>
                             <li><a href="#">Tops</a></li>
                             <li><a href="#">Accessories</a></li>
                         </ul>
                     </li>
                        
                        <li ><a href="SignIn.aspx" class="active">Sign In</a></li>
                    </ul>
                </div>
            </div>
                </div>

        </div>
        <div class="container signupBox ">
            <div class="form-horizontal">
                <br/>
    <br/>
    <br/>
                <h2>Recover Password</h2>
                
                <h4>Please Enter your email address, we will send you the recovery link for password!</h4>
                <!---Forgot Password--->
            <div class="col-xs-11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="TextBox1" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox1" runat="server" Class="form-control" CssClass="Emailtxt" placeholder="Enter Email"></asp:TextBox>
                
             </div>
           
               <div class="col-md-11">
                   <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="signup-btn" OnClick="Button1_Click" />
               </div>
             </div>
         <div class="col-xs-11">
            <asp:Label ID="lblReset" runat="server" Text="Label" CssClass="text-success"></asp:Label>
            </div>
        <!---- Sign In End --->
            </div>
    </form>
    <!------ Footer start------>
         <footer class="footer-pos">
        <div class="container">
            <p class="pull-right"><a href="Default.aspx">Back to top</a></p>
            <p>&copy;2023 RagsandTags.in &middot;<a href="Default.aspx">  Home &middot;</a><a href="Default.aspx">About &middot;</a><a href="Default.aspx">Home &middot;</a><a href="Default.aspx">Contact &middot;</a><a href="Default.aspx">Products </a>
            </p>
        </div>
        </footer>
        <!------ Footer End------>
</body>
</html>
