<%-- 
    Document   : products
    Created on : Jun 15, 2022, 10:56:23 AM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <noscript><link rel="stylesheet" href="assets/css/noscript.css"/></noscript>
    </head>
    <body class="is-preload">
        <!-- Wrapper -->
        <div id="wrapper">
            <!-- Header -->
            <header id="header">
                <div class="inner">
                    <!-- Logo -->
                    <a href="./Home" class="logo">
                        <span class="fa fa-book"></span>
                        <span class="title">IIBOOK</span>
                    </a>

                    <!-- Nav -->
                    <nav>
                        <ul>
                            <li><a href="#menu">Menu</a></li>
                        </ul>
                    </nav>
                </div>
            </header>

            <!-- Menu -->
            <nav id="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="./Home" class="active">Home</a></li>

                    <li><a href="./Cart">Cart</a></li>

                    <li><a href="about.jsp">About</a></li>
                        <% 
                            if(session.getAttribute("user")==null){ 
                        %>
                    <li><a href="Login?origin=./Home">Login</a></li>
                        <% } else{ %>
                    <li><a href="">Welcome ${user.getName()}</a></li>
                    <li><a href="./Order">Order History</a></li>
                    <li><a href="Logout">Logout</a></li>
                        <% }%>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">
                <div class="inner">
                    <h1>List My Orders</h1>

                    <div class="image main">
                        <img
                            src="images/banner-image-6-1920x500.jpg"
                            class="img-fluid"
                            alt=""
                            />
                    </div>
                    
                    <table>
                        <tr>
                            <th>No.</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Expected Delivery Time</th>
                            <th>Created Time</th>
                            <th>Details</th>
                        </tr>
                        <% int No = 1 ;%>
                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td><%=No++%></td>
                                <td>${user.getName()}</td>
                                <td>${user.getEmail()}</td>
                                <td>${order.getTotal()}</td>
                                <td>${order.getStatus()}</td>
                                <td></td>
                                <td>${order.getOrderdate()}</td>
                                <td><a class="btn btn-outline-dark"><i class="fa fa-caret-right"></i></a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

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
                                    DE336, FBT University</a
                                >
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
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>

