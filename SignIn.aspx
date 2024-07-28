<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="OneServiceStop.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
     crossorigin="anonymous">   </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Custome.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

      <%---  $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });*/---%>

   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container ">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                            class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="default.aspx"><span>
                        <img src="icons/slogo3.jpg" alt="All In One Service stop" height="30" /></span>All In One Service stop</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li ><a href="default.aspx">Home</a> </li>
                        <li><a href="About.aspx">About</a> </li>
                        <%--<li><a href="#">Contact US</a> </li>--%>
                        <%--<li><a href="#">Blog-</a> </li>--%>
                        <li class="drodown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<b
                            class="caret"></b></a>
                            <ul class="dropdown-menu ">
                                <li><a href="#">Home appliance</a></li>
                                <li role="separator" class="divider "></li>
                                <li><a href="#">Electronic Devices</a></li>
                                <li role="separator" class="divider "></li>
                                <li><a href="#">Plumbing </a></li>
                                <li role="separator" class="divider "></li>
                                 <li><a href="#">Others</a></li>
                                <li role="separator" class="divider "></li>
                               
                               
                              
                               
                            </ul>
                        </li>
                      <%---   <li>
                            <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                Cart <span class="badge " id="pCount" runat="server"></span>
                            </button>
                        </li> ---%>
                        <li id="btnSignUP" runat="server"><a href="SignUp.aspx">SignUp</a> </li>
                        <li class="active" id="btnSignIN" runat="server"><a href="SignIn.aspx">SignIn</a> </li>
                       
                    </ul>
                </div>
            </div>
        </div>
        </div>
        <br />
    <!---signin form start--->
         
           <div class="container">
               <div class="form-horizontal">
                  LogIn Form</h2>
                   <hr />
                   <div class="form-group">
                       <asp:Label ID="Label1" CssClass="col-md-2 control-label1" runat="server" Text="UserName"></asp:Label>
                       <div class="col-md-3 ">

                           <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" CssClass="text-danger" ErrorMessage="please enter valid username" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>

                       </div>
                   </div>

                   <div class="form-group">
                       <asp:Label ID="Label2" CssClass="col-md-2 control-label1" runat="server" Text="Password"></asp:Label>
                       <div class="col-md-3 ">

                           <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" CssClass="text-danger" ErrorMessage="please enter valid password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>


                       </div>
                   </div>

                  <%---- <div class="form-group">
                       <div class="col-md-2 "> </div>
                       <div class="col-md-6 ">

                           <asp:CheckBox ID="CheckBox1" runat="server" />
                           <asp:Label ID="Label3" CssClass=" control-label1" runat="server" Text="Remember Me"></asp:Label>


                       </div>
                   </div> ---%>

                   
                   <div class="form-group">
                       <div class="col-md-2 "> </div>
                       <div class="col-md-6 ">
            
                            <asp:Button ID="btnLogin" CssClass ="btn btn-success" runat="server" Text="Login &raquo;" OnClick="btnLogin_Click"/>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>


                       </div>
                   </div>


                   <%--- for forgot password ---%>
                    <div class="form-group">
                       <div class="col-md-2 "> </div>
                       <div class="col-md-6 "> 
                           <asp:HyperLink ID="HyForgotpass" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot Password</asp:HyperLink>
                       </div>
                   </div>


                    <div class="form-group">
                       <div class="col-md-2 "> </div>
                       <div class="col-md-6 "> 
                           <asp:Label ID="lblError" CssClass="text-danger" runat="server" ></asp:Label>

                       </div>
                   </div>

               </div>
               </div>
               

       
           <!---signin form end--->

    

           <!---Footer COntents Start here---->
        <hr />

        <footer class="footer-pos">
            <div class ="container">
             <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                <p class ="pull-right "><a href="AdminHome.aspx"> Admin Login  ogin  </a></p> 
                <p>&copy;2022 Srkistudents.in &middot; <a href ="default.aspx">Home</a>&middot;<a href ="#">About</a>&middot;<a href ="#">Contact</a>&middot;<a href ="#">Products</a> </p>
            </div>

        </footer>

         <!---Footer COntents End---->
    </form>
</body>
</html>
