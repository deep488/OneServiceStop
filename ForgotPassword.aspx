<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OneServiceStop.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password </title>
     <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">   </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Custome.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
                        <li class="active"><a href="default.aspx">Home</a> </li>
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
                       <%---  <li>
                            <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                Cart <span class="badge " id="pCount" runat="server"></span>
                            </button>
                        </li> ---%>
                        <li  id="btnSignIN" runat="server"><a href="SignIn.aspx">SignIn</a> </li>
                       
                    </ul>
                </div>
            </div>
        </div>
        </div>
        <div class="container">
            <div class="form-horizontal">
                <h2>Recover Password</h2>
                <hr />
                <h3>Please Enter Your Email Address,we will send you the recovery link for your password</h3>
                
                <div class="form-group">
                    <asp:Label ID="lblEmail" CssClass="col-md-2 control-lable" runat="server" Text=" Your Email Address"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtEmailID" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtEmailID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>


                </div  class="form-group">
                <div class="col-md-2"> </div>

                <div class="col-md-6">
                    <asp:Button ID="btnResetPassword" CssClass="btn btn-default" runat="server" Text="Send" OnClick="btnResetPassword_Click"  />
                    <asp:Label ID="lblResetPassMsg" CssClass="text-success" runat="server" ></asp:Label>

                </div>

                <div>


                </div>

            </div>
        </div>

    </form>
    
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
</body>
</html>
