<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Quan ly san pham</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="./admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="./admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="./admin/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="./admin/css/style.css" rel="stylesheet" type="text/css" />

        <style type="text/css">
            .left-aside{
                height: 1550px;
            }
        </style>
    </head>
    <body class="skin-black">
    <c:if test="${param['index']==null }">   
        <c:set var = "index" scope = "page" value = "1"/>
    </c:if>
    <c:if test="${param['index']!=null}">
        <c:set var = "index" scope = "page" value = "${param['index']}"/>
    </c:if>
    <!-- header logo: style can be found in header.less -->
    <jsp:include page="./header.jsp"/>
    <div class="wrapper row-offcanvas row-offcanvas-left" style="height: 100%;">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="./aside.jsp"/>

        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel">
                            <header class="panel-heading">
                                Thêm  Sản Phẩm
                            </header>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">ID</label>
                                    <input class="form-control" type="text"  name="proid" readonly value="auto genarate">
                                    <input class="form-control" type="hidden"  name="index" value="${index}">

                                </div>
                                <div class="form-group col-md-6">
                                    <label for="exampleSelect1" class="control-label">Title</label>
                                    <input class="form-control" type="text" name="protitle" required value="${s.getTitle()}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Category:</label>
                                    <select class="form-control" name="categoryId" style="display: inline; width: 100px;">
                                        <c:forEach var="cate" items="${cate}">
                                            <option value="${cate.getSetting_id()}" ${cate.getValue()==s.getCategory()?"selected":""}>${cate.getValue()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="control-label">Price:</label>
                                    <input class="form-control" type="text" name="price" required value="${s.getPrice()}">

                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Sale:</label>
                                    <input type="checkbox" name="salePrice" required value="${s.getSalePrice()}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Disconut</label>
                                    <input class="form-control" type="text" name="price" required value="${s.getPrice()}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Stock:</label>
                                    <input class="form-control" type="text" name="stock" required value="${s.getStock()}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Create Date:</label>
                                    <input class="form-control" type="date" name="createDate" required value="${s.getCreateDate()}">
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Description:</label>
                                    <textarea class="form-control" name="Description" style="height: 95px;">${s.getDescription()}</textarea>
                                </div>
                                <div class="form-group col-md-10">
                                    <label class="control-label" >Image</label>

                                    <input class="form-control" id="img${s.getId()}" onchange="changeimg${s.getId()}()" name="image" type="file" >
                                    <input name="proimage" id="image${s.getId()}" value="${s.getImg()}" type="hidden" >
                                    <image  src="${s.getImg()}" id="demoimg${s.getId()}" style="margin-top: 5px;" width="50%">
                                </div>
                            </div>
                        </div>
                    </div>
            </section><!-- /.content -->
            <div class="footer-main">
                Copyright &copy Director, 2014
            </div>
        </aside><!-- /.right-side -->


    </div><!-- ./wrapper -->



    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    <script>
                                        $(document).ready(function () {
                                            $("#tablepro").DataTable({bFilter: false, bInfo: false, paging: false});
                                        });
    </script>
    <!-- Bootstrap -->
    <script src="./admin/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Director App -->
    <script src="./admin/js/Director/app.js" type="text/javascript"></script>
</body>
</html>