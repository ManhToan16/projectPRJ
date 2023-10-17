<%-- 
    Document   : signup
    Created on : Jun 30, 2022, 5:15:57 PM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join us · IIBOOK </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/style.css">

    </head>
    <body>
        <section class="ftco-section">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section"><span class="fa fa-book"></span>IIBOOK</h2>
                </div>
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="wrap">
                            <div class="img" style="background-image: url(images/slider-image-3-1920x700.jpg);"></div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign Up</h3>
                                    </div>
                                </div>
                                <form action="Signup" method="POST" class="signin-form">
                                    <input type="hidden" name="origin" value="${origin}">
                                    <div class="form-group mt-3">
                                        <input type="text" name="name" class="form-control" required>
                                        <label class="form-control-placeholder" for="name">Full Name</label>
                                    </div>
                                    <div class="form-group mt-3">
                                        <input type="text" name="email" class="form-control" required>
                                        <label class="form-control-placeholder" for="email">Email</label>
                                    </div>
                                    <div class="form-group mt-3">
                                        <input type="text" name="username" class="form-control" required>
                                        <label class="form-control-placeholder" for="username">Username</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" name="password" type="password" class="form-control" required>
                                        <label class="form-control-placeholder" for="password">Password</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" name="re_password" type="password" class="form-control" required>
                                        <label class="form-control-placeholder" for="re_password">Re-enter Password</label>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                    <% if (request.getAttribute("error") != null) {%>
                                    <div class="w-100">
                                        <%=request.getAttribute("error")%>
                                    </div>
                                    <%}%>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign Up</button>
                                    </div>
                                </form>
                                <p class="text-center">Already a member? <a data-toggle="tab" href="Login?origin=${origin}">Log In</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="assets/js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>


