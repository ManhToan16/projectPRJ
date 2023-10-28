<%-- 
    Document   : user_profile
    Created on : Jul 12, 2022, 3:41:46 AM
    Author     : FPT SHOP KM4
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Book"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Book</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="../../assets/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../../assets/css/main.css" />
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

    </head>

    <style>
        .sidebar{
            background-color: rgb(222, 188, 211);
            color: white;
            height: 100%
        }
        .sidebar a {
            margin-left: 10px;
            display: block;
            color: white;
            padding-bottom: 10px;
            font-size: 30px;
            text-decoration: none;
        }
        .card{
            position: relative;
            display: flex;
            flex-direction: column;

        }
        .content{
            background-color: whitesmoke;
        }




    </style>
    <body class="is-preload">
        <div id ="wrapper">
            <!--Header-->
            <header id="header">
                <div class="inner">

                    <!-- Logo -->
                    <a href="./Home" class="logo">
                        <span class="fa fa-book"></span> <span class="title">IIBOOK</span>
                    </a>

                    <!-- Nav -->
                    <nav>
                        <ul>
                            <li><a href="#menu">Menu</a></li>
                        </ul>
                    </nav>

                </div>
            </header>

            <!--Menu-->
            <nav id="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="">Welcome ${sessionScope.user.getName()}</a></li>
                    <li><a href="./Home" class="active">Home</a></li>

                    <li><a href="./Cart">Cart</a></li>

                    <li><a href="about.jsp">About</a></li>
                        <% 
                            if(session.getAttribute("user")==null){ 
                        %>
                    <li><a href="Login?origin=./Home">Login</a></li>
                        <% } else{ %>

                    <li><a href="./Order">Order History</a></li>
                    <li><a href="Logout">Logout</a></li>
                        <% }%>
                </ul>
            </nav>

            <nav id="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="">Welcome ${sessionScope.user.getName()}</a></li>
                    <li><a href="./Home" class="active">Home</a></li>

                    <li><a href="./Cart">Cart</a></li>

                    <li><a href="about.jsp">About</a></li>
                        <% 
                            if(session.getAttribute("user")==null){ 
                        %>
                    <li><a href="Login?origin=./Home">Login</a></li>
                        <% } else{ %>

                    <li><a href="./Order">Order History</a></li>
                    <li><a href="Logout">Logout</a></li>
                        <% }%>
                </ul> 
            </nav>


           
        <body class="is-preload">
            <div class="profile">
                <div class="row">
                    <div class="col-md-4 mt-1">
                        <div class="card text-center sidebar">
                            <div class="card-body">
                                <div class="mt-3">

                                    <a href="index.jsp">Home</a>
                                    <a href="profile.jsp">Profile</a>
                                    <a href="editprofile.jsp">Edit Profile</a>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 mt-1">
                        <div class="card mb-3 content">
                            <h1 class="m-3 pt-3">About</h1>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h5>Full name</h5>

                                    </div>
                                    <div class="col-md-9 text-secondary">
                                        Full name
                                    </div>

                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-md-3">
                                        <h5>Email</h5>

                                    </div>
                                    <div class="col-md-9 text-secondary">
                                        abc@gmail.com
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <h5>Phone</h5>

                                    </div>
                                    <div class="col-md-9 text-secondary">
                                        phonenumber
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <h5>Address</h5>

                                    </div>
                                    <div class="col-md-9 text-secondary">
                                        address
                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>





                </div>
            </div>


            <form role="form" method="post">
                <div class="box box-primary">
                    <div class="box-header">
                        <h2 class="page-header"><i class="fa fa-lock"></i> Change Password</h2>
                        <div class="pull-right">
                            <button type="button" name="Submit" value="Save" class="btn btn-danger"><i class="livicon"
                                    data-n="pen" data-s="16" data-c="#fff" data-hc="0"></i> Save</button>
                            <button type="reset" name="Reset" value="Clear" class="btn btn-primary"><i class="livicon"
                                    data-n="trash" data-s="16" data-c="#fff" data-hc="0"></i> Clear</button>
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <label>Old Password</label>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-lock"></i>
                                    </div>
                                    <input class="text" id="oldPassword" name="oldPassword" value=""
                                        placeholder="Enter the Old Password" type="password">
                                </div>
                            </div>
                            <!-- /.input group -->
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <label>New Password</label>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-lock"></i>
                                    </div>
                                    <input class="form-control" id="newPassword" name="newPassword" value=""
                                        placeholder="Enter the New Password" type="password">
                                </div>
                            </div>
                            <!-- /.input group -->
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <label>Confirm Password</label>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-lock"></i>
                                    </div>
                                    <input class="form-control" id="confirmPassword" name="confirmPassword" value=""
                                        placeholder="Re-enter the New Password" type="password">
                                </div>
                            </div>
                            <!-- /.input group -->
                        </div>

            </form>

            <!-- Footer -->
            <footer id="footer">
                <div class="inner">
                    <section>
                        <h2>Contact Info</h2>
                        <ul class="alt">
                            <li>
                                <span class="fa fa-github"></span>
                                <a href="https://github.com/nekon0/IIBOOK">Our Project</a>
                            </li>
                            <li>
                                <span class="fa fa-map-pin"></span>
                                <a href="https://goo.gl/maps/ojwCjTqRteiA4B9U7">
                                    DE336, FBT University</a>
                            </li>
                        </ul>
                    </section>
                    <ul class="copyright">
                        <li>HLV</li>
                    </ul>
                </div>
            </footer>
            </div>

            <!-- Scripts -->
            <script src="../../assets/js/jquery.min.js"></script>
            <script src="../../assets/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="../../assets/js/jquery.scrolly.min.js"></script>
            <script src="../../assets/js/jquery.scrollex.min.js"></script>
            <script src="../../assets/js/main.js"></script>
        </body>


        <style>
            .body {
                margin-top: 20px;
            }

            .main {
                padding: 15px;
                font-family: Arial, Helvetica, sans-serif;
            }

            .sidebar {
                background-color: rgb(222, 188, 211);
                color: white;
                height: 100%;
                margin-left: 50px;
            }

            .sidebar a {
                margin-left: 10px;
                display: block;
                color: white;
                padding-bottom: 10px;
                font-size: 30px;
                text-decoration: none;
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;

            }

            .content {
                background-color: whitesmoke;
            }
        </style>

