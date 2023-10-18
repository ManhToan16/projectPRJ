<%-- 
    Document   : Admin
    Created on : Jun 23, 2022, 4:40:48 PM
    Author     : Hoang Phi Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin pages</title>

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css" rel="stylesheet" />
        <title>JSP Page</title>
        <style>
            :root {
                --web-main-theme: #00ffff;
            }

            .btn-primary {
                background-color: var(--web-main-theme) !important;
            }

            .web-header {
                background-color: var(--web-main-theme);
            }

            .web-body__nav a,
            .web-body__content a {
                background-color: #00ffff !important;
            }

            .web-drinks-list {
                overflow-y: scroll;
            }

            ::-webkit-scrollbar-thumb {
                border-radius: 5px;
                -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
                background-color: var(--web-main-theme);
            }

            ::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
                border-radius: 5px;
                background-color: #F5F5F5;
            }

            ::-webkit-scrollbar {
                width: 5px;
                background-color: #F5F5F5;
            }
        </style>
    </head>
    <body>
        <header class="web-header container-fluid">
            <div class="row align-items-center">
                <div class="col-6 d-flex align-items-center">
                    <span class="fa fa-book"></span>

                    <h5 class="m-0 p-3">Admin IIBOOK</h5>
                </div>
                <div class="col-6 d-flex justify-content-end">
                    <a href="#Back" class="text-black">Back</a>
                </div>
            </div>
        </header>
        <section class="web-body container-fluid">
            <div class="row">
                <div class="web-body__nav col-md-3 col-sm-4">
                    <!-- Pills navs -->
                    <ul class="nav nav-pills mb-3 d-flex flex-column" id="ex1" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" data-mdb-toggle="pill" href="#list-product" role="tab"
                               aria-controls="view-book" aria-selected="true">Danh mục sản phẩm</a>
                        </li>
                        <li class="nav-item d-none" role="presentation">
                            <a class="nav-link" data-mdb-toggle="pill" href="#product" role="tab"
                               aria-controls="edit-book" aria-selected="false">Sản phẩm</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-mdb-toggle="pill" href="#add-product" role="tab"
                               aria-controls="add-book" aria-selected="false">Thêm sản phẩm</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-mdb-toggle="pill" href="#list-customer" role="tab"
                               aria-controls="view-customer" aria-selected="false">Danh sách khách hàng</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-mdb-toggle="pill" href="#list-order" role="tab"
                               aria-controls="view-order" aria-selected="false">Danh sách đơn hàng</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-mdb-toggle="pill" href="#log-out" role="tab"
                               aria-controls="log-out" aria-selected="false">Đăng xuất</a>
                        </li>
                    </ul>
                    <!-- Pills navs -->


                </div>
                <div class="web-body__content col-md-9 col-sm-8">
                    <!-- Pills content -->
                    <div class="tab-content pt-5" id="ex1-content">
                        <div class="tab-pane fade show active" id="list-product" role="tabpanel" aria-labelledby="ex1-tab-1">
                            <div class="container d-flex flex-column h-100">
                                <h1 class="text-center">List</h1>

                                <div class="web-drinks-list row flex-fill" style="height: calc(100vh - 200px); overflow-y: auto;">

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 1</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Trà đá" data-drink-id="1" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 2</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Bún chả" data-drink-id="2" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 3</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Trà đá" data-drink-id="1" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 4</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Bún chả" data-drink-id="2" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 5</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Trà đá" data-drink-id="1" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 6</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Bún chả" data-drink-id="2" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 7</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Trà đá" data-drink-id="1" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 8</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Bún chả" data-drink-id="2" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 9</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Trà đá" data-drink-id="1" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 mb-1">
                                        <div class="card border">
                                            <img src="http://diaoc5sao.vn/wp-content/uploads/2021/11/The-Ukrainian-Book-Institute-Purchases-380.9-Thousand-Books-for-Public-Libraries1.jpeg"
                                                 class="card-img-top" alt="" />

                                            <div class="card-body">
                                                <h5 class="card-title">Sach 10</h5>
                                                <a href="#!" class="btn btn-primary web-drinks-list__item"
                                                   data-drink-name="Bún chả" data-drink-id="2" data-drink-price="10000"
                                                   data-drink-note="Trà đá bún chả">More</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="add-product" role="tabpanel">
                            <form action="" method="post" autocomplete="off">
                                <h1 class="text-center">Edit Book</h1>

                                <div class="form-outline m-4">
                                    <input type="text" id="edit-drink__drink-id" class="form-control" name="id" readonly
                                           required />
                                    <label class="form-label">Book ID</label>
                                </div>

                                <div class="form-outline m-4">
                                    <input type="text" id="edit-drink__drink-name" class="form-control" name="name"
                                           required />
                                    <label class="form-label">Book name</label>
                                </div>

                                <div class="form-outline m-4">
                                    <input type="text" id="edit-drink__drink-price" class="form-control" pattern="\d+"
                                           name="price" required />
                                    <label class="form-label">Price</label>
                                </div>

                                <div class="form-outline m-4">
                                    <input type="text" id="edit-drink__drink-note" class="form-control" name="note" />
                                    <label class="form-label">Note</label>
                                </div>

                                <div class="d-flex justify-content-between m-4">
                                    <div>
                                        <button type="submit" class="btn btn-primary btn-rounded m-1">Submit</button>
                                        <input type="submit" class="btn btn-danger btn-rounded m-1" name="delete"
                                               value="delete"></input>
                                    </div>

                                    <button type="button" class="btn btn-dark btn-rounded m-1"
                                            onclick="document.querySelector(`a.nav-link[href='#view-drink']`).click()">Cancel</button>

                                </div>
                            </form>
                        </div>

                        <div class="tab-pane fade" id="add-drink" role="tabpanel">
                            <form action="" method="post" autocomplete="off">
                                <h1 class="text-center">Add Drink</h1>

                                <div class="form-outline m-4">
                                    <input type="text" class="form-control" name="name" required />
                                    <label class="form-label">Drink name</label>
                                </div>

                                <div class="form-outline m-4">
                                    <input type="text" class="form-control" pattern="\d+" name="price" required />
                                    <label class="form-label">Price</label>
                                </div>

                                <div class="form-outline m-4">
                                    <input type="text" class="form-control" name="note" />
                                    <label class="form-label">Note</label>
                                </div>

                                <div class="m-4">
                                    <button type="submit" class="btn btn-primary btn-rounded m-1">Submit</button>

                                    <button type="button" class="btn btn-dark btn-rounded m-1"
                                            onclick="document.querySelector(`a.nav-link[href='#view-drink']`).click()">Cancel</button>
                                </div>
                            </form>
                        </div>

                        <div class="tab-pane fade" id="view-order" role="tabpanel">
                            4
                        </div>

                        <div class="tab-pane fade" id="change-password" role="tabpanel">
                            <form action="" method="post"
                                  oninput="this.rePassword.setCustomValidity(this.newPassword.value == this.rePassword.value ? '' : 'Not match with new password!')">
                                <h1 class="text-center">Change Password</h1>

                                <div class="form-outline m-4">
                                    <input type="password" class="form-control" name="old-password" required />
                                    <label class="form-label">Old Password</label>
                                </div>

                                <div class="form-outline m-4">
                                    <input type="password" class="form-control" name="new-password" id="newPassword"
                                           required />
                                    <label class="form-label">New Password</label>
                                </div>

                                <div class="form-outline m-4">
                                    <input type="password" class="form-control" id="rePassword" required />
                                    <label class="form-label">Re-Enter Your Password</label>
                                </div>

                                <div class="m-4">
                                    <button type="submit" class="btn btn-primary btn-rounded m-1">Submit</button>

                                    <button type="button" class="btn btn-dark btn-rounded m-1"
                                            onclick="document.querySelector(`a.nav-link[href='#view-drink']`).click()">Cancel</button>
                                </div>
                        </div>
                    </div>
                    <!-- Pills content -->
                </div>
            </div>
        </section>
    </body>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
    integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script> -->

    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>

</html>
