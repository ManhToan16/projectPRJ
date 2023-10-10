<%-- 
    Document   : product-details
    Created on : Jun 15, 2022, 10:59:59 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Book</title>
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
                    <a href="index.jsp" class="logo">
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
                    <li><a href="index.jsp">Home</a></li>

                    <li><a href="products.jsp" class="active">Products</a></li>

                    <li><a href="checkout.jsp">Checkout</a></li>

                    <li><a href="about.jsp">About</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">
                <div class="inner">
                    <h1>Pride and Prejudice - Jane Austen <span class="pull-right"><del>$99.00</del> $79.00</span></h1>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="images/product-1-720x480.jpg" class="img-fluid" alt="">
                            </div>

                            <div class="col-md-7">
                                <p> <strong>'No sooner had he made it clear to himself and his friends that she had hardly a good feature in her face, than he began to find it was rendered uncommonly intelligent by the beautiful expression of her dark eyes ...'</strong></p>

                                <p> When Elizabeth Bennet first meets eligible bachelor Fitzwilliam Darcy, she thinks him arrogant and conceited; he is indifferent to her good looks and lively mind. When she later discovers that Darcy has involved himself in the troubled relationship between his friend Bingley and her beloved sister Jane, she is determined to dislike him more than ever. In the sparkling comedy of manners that follows, Jane Austen shows the folly of judging by first impressions and superbly evokes the friendships, gossip and snobberies of provincial middle-class life.</p>

                                <p>100 editions of the best fiction in English, from the eighteenth century and the very first novels to the beginning of the First World War.</p>

                                <div class="row">                                  
                                    <div class="col-sm-8">
                                        <label class="control-label">Quantity</label>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" name="name" id="name">
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <input type="submit" class="primary" value="Add to Cart">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br>
                    <br>

                    <div class="container-fluid">
                        <h2 class="h2">Similar Products</h2>

                        <!-- Products -->
                        <section class="tiles">
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
                        </section>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer id="footer">
                <div class="inner">
                    <section>
                        <h2>Contact Info</h2>
                        <ul class="alt">
                            <li><span class="fa fa-github"></span> <a href="https://github.com/nekon0/IIBOOK">Our Project</a></li>
                            <li><span class="fa fa-map-pin"></span> <a href="https://goo.gl/maps/ojwCjTqRteiA4B9U7"> DE336, FBT University</a></li>
                        </ul>
                    </section>

                    <ul class="copyright">
                        <li> HLV </li>
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
