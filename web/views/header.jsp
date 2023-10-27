<%-- 
    Document   : header
    Created on : Jul 11, 2022, 9:19:08 PM
    Author     : ACER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <h2>${sessionScope.user==null? "Menu": ("Welcome ")}${sessionScope.user.getName()}</h2>
    <ul>
        <li><a href="./Home">Home</a></li>
        
        <li><a href="./Book?id=0">Bookshelf</a></li>

        <li><a href="./Cart">Cart</a></li>

            <% 
                if(session.getAttribute("user")==null){ 
            %>
            <li><a href="about.jsp">About</a></li>
            
        <li><a href="Login?origin=./Home"><i class="fa fa-sign-in"></i>Login</a></li>
            <% } else{ %>
        <li><a href="./Order">Order History</a></li>
        
        <li><a href="about.jsp">About</a></li>
        
        <li><a href="Logout"><i class="fa fa-sign-out"></i>Logout</a></li>
            <% }%>
    </ul>
</nav>
