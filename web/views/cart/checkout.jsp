<%-- 
    Document   : checkout
    Created on : Jun 15, 2022, 11:01:33 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    </head>
    <body class="is-preload">
        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Header -->
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

            <!-- Menu -->
            <nav id="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="./Home" >Home</a></li>

                    <li><a href="products.jsp">Products</a></li>

                    <li><a href="./Cart" class="active">Checkout</a></li>

                    <li><a href="about.jsp">About</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">
                <div class="inner">
                    <h1>Checkout</h1>
                    <table>
                        <tr>
                            <th style="width: 100px;">Image</th>
                            <th style="width: 100px;">Title</th>
                            <th style="width: 100px;">Author</th>
                            <th style="width: 100px;">Price</th>
                            <th>Quantity</th>
                            <th style="width: 100px;">Total Price</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${books}" var="book">
                            <tr>
                                <th><img src="${book.getImage()}" alt="alt" style="width: 50px;"/></th>
                                <td>${book.getTitle()}</td>
                                <td>${book.getAuthor()}</td>
                                <td>${book.getPrice()}</td>
                                <td>${book.getQuantity()}</td>
                                <td>${book.getRealPrice()}</td>
                                <td><a href="Cart?delete=ok"</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

            <!-- Footer -->
            <footer id="footer">
                <div class="inner">
                    <section>
                        <form method="post" action="Cart">
                            <div class="fields">
                                <div class="field">
                                    <input type="text" name="Fullname" id="field-2" placeholder="Name" value="${sessionScope.user.getName()}">
                                </div>

                                <div class="field">
                                    <input type="text" name="email" id="field-3" placeholder="Email" value="${sessionScope.user.getEmail()}">
                                </div>

                                <div class="field">
                                    <input type="text" name="phone" id="field-4" placeholder="Phone" value="${sessionScope.user.getPhone()}">
                                </div>

                                <div class="field">
                                    <input type="text" name="Address" id="field-5" placeholder="Address" value="${sessionScope.user.getAddress()}">
                                </div>

                                <div class="field half">

                                    <select>
                                        <option value="">-- Choose Payment Method--</option>
                                        <option value="fast"> Fast Delivery - $1.5</option>
                                        <option value="free"> Free Delivery</option>
                                    </select>
                                </div>
                                <div class="field half text-right">
                                    <ul class="actions">
                                        <li><input type="submit" value="Finish" class="primary"></li>
                                    </ul>
                                </div>
                            </div>
                        </form>
                    </section>
                    <section>
                        <h2>Contact Info</h2>
                        <ul class="alt">
                            <li><span class="fa fa-github"></span> <a href="https://github.com/nekon0/IIBOOK">Our Project</a></li>
                            <li><span class="fa fa-map-pin"></span> <a href="https://goo.gl/maps/ojwCjTqRteiA4B9U7"> DE336, FBT University</a></li>
                        </ul>
                    </section>

                    <ul class="copyright">
                        <li>HLV </li>
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
