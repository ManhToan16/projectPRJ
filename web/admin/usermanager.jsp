<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Quan Ly Khach Hang</title>
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
                                Quản Lý Khách Hàng
                            </header>
                            <!-- <div class="box-header"> -->
                            <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                            <!-- </div> -->
                            <div class="panel-body table-responsive">
                                <div class="sliderList">
                                    <div class="input-group" style="margin-bottom: 10px;width: 100%; ">
                                        <form class="search-slider"
                                              style="width: 100%; display: flex; justify-content: space-between; position: relative;"
                                              method="get" action="productmanagement">
                                            <div class="left-filter">
                                            </div>

                                            <div class="right-search">
                                                <label class="form-control"
                                                       style="border:none;display: inline;">Status</label>
                                                <select class="form-control" name="status" style="display: inline; width: 100px;">
                                                    <option value="">All</option>
                                                    <option value="1" ${param['status']==1?'selected':''}>Active</option>
                                                    <option value="0" ${param['status']==0?'selected':''}>Inactive</option>
                                                </select>
                                                <input type="text" name="search" class="form-control" value="${param['search']} "
                                                       style="width: 250px;" placeholder="Search" />
                                                <select class="form-control input-sm" name="type-search"
                                                        style="display: inline; width: 90px; border:none; position:absolute; right:50px;top:2px;">
                                                    <option value="0" ${param['type-search']==0?'selected':''}>Title</option>
                                                    <option value="1" ${param['type-search']==1?'selected':''}>Brief</option>
                                                </select>
                                                <button class="btn btn-default">Go</button>
                                            </div>
                                        </form>
                                    </div>
                                    <table class="table table-hover " id="tablepro">
                                        <thead>
                                            <tr style="cursor: pointer; font-size: 15px;  text-align: center;">
                                                <th style="width: 55px;">ID</th>
                                                <th>Name</th>
                                                <th>UserName</th>
                                                <th>DOB</th>
                                                <th>Address</th>
                                                <th>Phone</th>
                                                <th>Gender</th>
                                                <th  width="20px">Edit</th>
                                                <th  width="20px">Del</th>
                                                <th width="3%">Switch</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="s" items="${prolist}">
                                            <tr>
                                                <td style="width: 55px;">${s.getId()}</td>
                                                <td data-toggle="modal" data-target="#Show${s.getId()}" style="cursor: pointer;">${s.getTitle()}</td>
                                                <td style="width: 340px;">${s.getBrief()}...</td>
                                                <td>${s.getBrand()}</td>
                                                <td>${s.getStock()}</td>
                                                <td>${s.getPrice()}$</td>
                                                <td>${s.getSalePrice()}$</td>
                                            <c:if test="${s.isActive()}">
                                                <td><span class="label label-success" style="font-size: 15px">Acive</span></td>
                                            </c:if>
                                            <c:if test="${!s.isActive()}">
                                                <td><span class="label label-danger" style="font-size: 15px">Inacive</span></td>
                                            </c:if>
                                            <td width="20px"><a class="btn btn-primary"  data-toggle="modal" data-target="#EditModalUP${s.getId()}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
                                            <td Width="20px"><a class="btn btn-danger" data-toggle="modal" data-target="#Delete${s.getId()}"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                                            <c:if test="${s.isActive()}">
                                                <td><a class="btn btn-warning" href="productmanagement?action=switch&pid=${s.getId()}&sstatus=0&index=${index}">Inctive</a></td>
                                            </c:if>

                                            </tr>
                                            <!-- Show detail modal -->
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="pagination-arena " style="margin-left: 40%">
                                        <ul class="pagination">
                                            <li class="page-item"><a href="" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                            <li class="page-item">
                                                <a href="" class="page-link " style="${index-2<1?"display:none;":""}">0</a></li>
                                            <li class="page-item">
                                                <a href="" class="page-link " style="${index-1<1?"display:none;":""}">1</a></li>
                                            <li class="page-item active">
                                                <a href="" class="page-link">2</a></li>
                                            <li class="page-item">
                                                <a href="" class="page-link " style="${index+1>numberPage?"display:none;":""}" >3</a></li>
                                            <li class="page-item">
                                                <a href="" class="page-link " style="${index+2>numberPage?"display:none;":""}">4</a></li>
                                            <li><a href="" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div> 
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
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