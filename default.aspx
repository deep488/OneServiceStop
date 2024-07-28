<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="OneServiceStop._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All IN Service Stop</title>

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
                        <li><a href="#">About</a> </li>
                       
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
                  
                        <li id="btnSignUP" runat="server"><a href="SignUp.aspx">SignUp</a> </li>
                        <li id="btnSignIN" runat="server"><a href="SignIn.aspx">SignIn</a> </li>
                       
                    </ul>
                </div>
            </div>
        </div>
        <br />
        
        <!---image slider---->
        <div class="container">
            <h2>
               </h2>
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
                        <img src="imgslideronsm/sliderr1osm.jpg" alt="Los Angeles" style="width: 100%; height: 370px;">
                        <div class="carousel-caption">
                            <h3>
                                Full service of
                                    your all home electronic devices
                                    

                                 

                                </h3>
                            <p>
                                 Professional help & durable
                                    repair service</p>
                            <p>
                                <a class="btn btn-lg btn-primary" href="Products.aspx" role="button">call Now</a></p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="imgslideronsm/sliderr2osm.jpg" alt="Chicago" style="width: 100%; height: 370px;">
                        <div class="carousel-caption">
                            <h3>
                                Best plumbing Service</h3>
                            <p>
                                For any type of plumbing related requirements we are just one call away</p>
                             <p>
                                <a class="btn btn-lg btn-primary" href="Products.aspx" role="button">call Now</a></p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="imgslideronsm/sliderr3osm.jpg" alt="New york" style="width: 100% ;height: 370px">
                        <div class="carousel-caption">
                            <h3>
                                Oven and Stove Repair & Replacement</h3>
                            <p>
                                just on your one call </p>
                             <p>
                                <a class="btn btn-lg btn-primary" href="Products.aspx" role="button">call Now</a></p>
                        </div>
                    </div>
                </div>
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left">
                </span><span class="sr-only">Previous</span> </a><a class="right carousel-control"
                    href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                    </span><span class="sr-only">Next</span> </a>
            </div>
        </div>
        <!---image slider End---->
    </div>
    <!---Middle COntents start---->
    <hr />
    <div class="container center">
        <div class="row ">
            <div class="col-lg-4">
                <img class="img-squre " src="osmelectonic/elec2.jpg" alt="thumb" width="140" height="140" />
                <h2>
                    Professional Electrician</h2>
                <p>
                   Need An Electrician In A Hurry? Call The Most Trusted Name In Surat. We Do Complete Fit-Outs, Air Con, Solar, Switchboards, Industrial, And Residential. 24/7 Call-out Available. </p>
                <p>
                    <a class="btn btn-default " href="#" role="button">View More &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <img class="img-squre " src="osmplumber/plumber1.jpg" alt="thumb" width="140" height="140" />
                <h2>
                  Professional Plumbers   </h2>
                <p>
                    Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.</p>
                <p>
                    <a class="btn btn-default " href="#" role="button">View More &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <img class="img-squre " src="osmtechnition/technition.jpg" alt="thumb" width="140" height="140" />
                <h2>
                    Professional Technician</h2>
                <p>A professional technician is responsible for handling the complexities of technical and mechanical systems, repair defective components, and recommend technical solutions to enhance the  productivity and efficiency in delivering high-quality deliverables. </p>
                <p>
                    <a class="btn btn-default " href="#" role="button">View More &raquo;</a></p>
            </div>
        </div>
        
    </div>

    <!---Middle COntents End---->

    <!---Footer COntents Start here---->
    <hr />
    <footer>
            <div class ="container ">
               
                <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                <p class ="pull-right "><a href="AdminHome.aspx"> Admin Login  </a></p>  
                <p>&copy;2022 Srkistudent.in &middot; <a href ="default.aspx">Home</a>&middot;<a href ="#">About</a>&middot;<a href ="#">Contact</a>&middot;<a href ="#">Services</a> </p>
            </div>

        </footer>
    <!---Footer COntents End---->
    </form>
</body>
</html>
