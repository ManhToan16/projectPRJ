<%-- 
    Document   : products
    Created on : Jun 15, 2022, 10:56:23 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookshelf</title>
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
                    <li><a href="Login">Home</a></li>

                    <li><a href="products.jsp" class="active">Products</a></li>

                    <li><a href="./Cart">Checkout</a></li>

                    <li><a href="about.jsp">About</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">
                <div class="inner">
                    <h1>Products</h1>

                    <div class="image main">
                        <img
                            src="images/banner-image-6-1920x500.jpg"
                            class="img-fluid"
                            alt=""
                            />
                    </div>

                    <!-- Products -->
                    <section class="tiles">
                        <article class="style1">
                            <span class="image">
                                <img src="images/product-1-720x480.jpg" alt="" />
                            </span>
                            <a href="product-details.jsp">
                                <h2>Pride and Prejudice</h2>

                                <p><del>$19.00</del> <strong>$19.00</strong></p>

                                <p>
                                    It is a truth universally acknowledged, that a single man in
                                    possession of a good fortune, must be in want of a wife.
                                </p>
                            </a>
                        </article>
                        <article class="style2">
                            <span class="image">
                                <img src="images/product-2-720x480.jpg" alt="" />
                            </span>
                            <a href="product-details.jsp">
                                <h2>To Kill A Mockingbird</h2>

                                <p><del>$19.00</del> <strong>$19.00</strong></p>

                                <p>
                                    'Shoot all the bluejays you want, if you can hit 'em, but
                                    remember it's a sin to kill a mockingbird.'
                                </p>
                            </a>
                        </article>
                        <article class="style3">
                            <span class="image">
                                <img src="images/product-3-720x480.jpg" alt="" />
                            </span>
                            <a href="product-details.jsp">
                                <h2>The Godfather</h2>

                                <p><del>$19.00</del> <strong>$19.00</strong></p>

                                <p>“I'll make him an offer he can't refuse.”</p>
                            </a>
                        </article>

                        <article class="style4">
                            <span class="image">
                                <img src="images/product-4-720x480.jpg" alt="" />
                            </span>
                            <a href="product-details.jsp">
                                <h2>Tắt Đèn</h2>

                                <p><del>$19.00</del> <strong>$19.00</strong></p>

                                <p>
                                    “Thà ngồi tù. Để cho chúng nó làm tình làm tội mãi thế, tôi
                                    không chịu được”
                                </p>
                            </a>
                        </article>

                        <article class="style5">
                            <span class="image">
                                <img src="images/product-5-720x480.jpg" alt="" />
                            </span>
                            <a href="product-details.jsp">
                                <h2>Tuổi thơ dữ dội</h2>

                                <p><del>$19.00</del> <strong>$19.00</strong></p>

                                <p>
                                    Sông Ô Lâu đôi bờ trắng tóc lau<br />

                                    Hát lời thế kháng chiến đến bạc đầu
                                </p>
                            </a>
                        </article>

                        <article class="style6">
                            <span class="image">
                                <img src="images/product-6-720x480.jpg" alt="" />
                            </span>
                            <a href="product-details.jsp">
                                <h2>Chí Phèo</h2>

                                <p><del>$19.00</del> <strong>$19.00</strong></p>

                                <p>
                                    “Người ta chỉ xấu xa, hư hỏng trước đôi mắt ráo hoảnh của
                                    phường ích kỷ ; và nước mắt là một miếng kính biến hình vũ
                                    trụ.”
                                </p>
                            </a>
                        </article>
                    </section>
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

