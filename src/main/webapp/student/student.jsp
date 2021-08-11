
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/2/2021
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quản lý Sinh viên</title>
        <!-- Table datatable css -->
        <link href="/assets/libs/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
        <link href="/assets/libs/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css">
        <%@ include file="/layout/head.jsp"%>
        <style>
            .btn-me {
                margin: 0 5px;
            }

            #btn-trash {
                color: #e74c3c;
                cursor: pointer;
            }

            #btn-trash:hover {
                color: #c0392b;
            }

            #btn-edit {
                color: #f39c12;
            }

            #btn-edit:hover {
                color: #e67e22;
            }
        </style>

    </head>
    <body data-layout="horizontal">
    <div id="wrapper">
        <!-- Navigation Bar-->
        <%@ include file="/layout/navigation-bar.jsp"%>
        <!-- End Navigation Bar-->

        <!-- Start Page Content here -->
        <div class="content-page" >
            <!-- Start content -->
            <div class="content">
                <!-- Start container-fluid-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <h3 class="page-title"><a href="student" style="text-decoration: none; color: black">Quản lý Sinh viên</a></h3>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <div class="row justify-content-between mb-2 mr-2 ml-2">
                                    <a href="${pageContext.request.contextPath}/student?action=create" class="btn btn-sm btn-outline-primary my-2 my-sm-0"><i class="fas fa-plus"></i> Thêm mới</a>
                                    <form class="form-inline my-2 my-lg-0" method="post" action="${pageContext.request.contextPath}/student?action=search">
                                        <input class="form-control form-control-sm mr-sm-2" name="string-search" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn btn-sm btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                    </form>
                                </div>

                                <table id="myTable" class="table table-colored-bordered table-bordered table-bordered-teal dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr class="text-center">
                                        <th scope="col" >ID</th>
                                        <th scope="col">Họ và tên</th>
                                        <th scope="col">Giới tính</th>
                                        <th scope="col">Ngày sinh</th>
<%--                                        <th scope="col">Email</th>--%>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Số điện thoại</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Thao tác</th>
                                    </tr>
                                    </thead>

                                    <c:forEach var="student" items="${listStudent}">
                                        <tbody>
                                        <tr class="text-center" >
                                            <td scope="row">${student.getId()}</td>
                                            <td>${student.getName()}</td>

                                            <c:if test="${student.getGender() == 1}">
                                                <td>Nam</td>
                                            </c:if>
                                            <c:if test="${student.getGender() == 0}">
                                                <td>Nữ</td>
                                            </c:if>

                                            <td>${student.getDob()}</td>
<%--                                            <td>${student.getMail()}</td>--%>
                                            <td>${student.getAddress()}</td>
                                            <td>${student.getPhoneNum()}</td>

                                            <c:if test="${student.getStatus() == 1}">
                                                <td>
                                                    <span class="badge badge-primary">Đang học</span>
                                                </td>
                                            </c:if>
                                            <c:if test="${student.getStatus() == 0}">
                                                <td>
                                                    <span class="badge badge-danger">Nghỉ học</span>
                                                </td>
                                            </c:if>

                                            <td>
                                                <a href="${pageContext.request.contextPath}/student?action=edit&id=${student.getId()}"
                                                   title="Edit" class="btn-me" id="btn-edit">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a data-id="${student.id}" title="Delete" data-toggle="modal"
                                                   class="btn-me delete" id="btn-trash">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/student?action=info&id=${student.getId()}"
                                                   title="Information" class="btn-me">
                                                    <i class="fas fa-info-circle"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>

                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end container-fluid -->
            </div>
            <!-- end content -->

            <!-- Footer Start -->
            <%@ include file="/layout/footer.jsp"%>
            <!-- end Footer -->
        </div>
        <!-- End Page content -->

    </div>
    <!-- END wrapper -->

    <div id="alert">
            <c:if test='${requestScope["success"] != null}'>
                <div class="alert alert-success" style="position: fixed; top: 130px; right: 115px">
                    <strong>Success!</strong> ${requestScope["success"]}
                </div>
                <script>
                    $(".alert-success").delay(4000).slideUp(500, function() {
                        $(this).alert('close');
                    });
                </script>
            </c:if>
            <c:if test='${requestScope["error"] != null}'>
                <div class="alert alert-danger" style="position: fixed; bottom: 0; right: 0; left: 0">
                    <button type="button" class="close" data-dismiss="alert">x</button>
                    <strong>Error!</strong> ${requestScope["error"]}
                </div>
                <script>
                    $(document).ready(function() {
                        $("#submit").click(function () {
                            $(".alert-danger").slideUp("slow");
                        });

                        $(".close").click(function () {
                            $(".alert-danger").slideUp("slow");
                        });
                    });
                </script>

            </c:if>
            <c:if test='${requestScope["warning"] != null}'>
                <div class="alert alert-warning" style="position: fixed; bottom: 0; right: 0; left: 0">
                    <button type="button" class="close" data-dismiss="alert">x</button>
                    <strong>Warning!</strong> ${requestScope["warning"]}
                </div>
                <script>
                    $(document).ready(function() {
                        $("#submit").click(function () {
                            $(".alert-warning").slideUp("slow");
                        });
                        $(".close").click(function () {
                            $(".alert-warning").slideUp("slow");
                        });
                    });
                </script>
            </c:if>
        </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action ="${pageContext.request.contextPath}/student?action=delete" method="post">
                    <div class="modal-body text-center">
                        <i class="fas fa-exclamation-triangle" style="font-size: 100px; margin: 15px auto; color: #f8bb86"></i>
                        <h3> Bạn có chắc chắn muốn xóa? </h3>
                    </div>
                    <input type="text" id="id" name="id" style="display: none">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" style="position: relative; left: -10px;">Đóng</button>
                        <button type="submit" class="btn btn-primary" style="position: relative; left: -230px;">Xác nhận</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- Script Start -->
    <%@ include file="/layout/script.jsp"%>
    <script>
        $(".delete").click(function () {
            const ids = $(this).attr('data-id');
            $("#id").val(ids);
            $('#exampleModal').modal('show');
        });

        // $(document).ready(function () {
        //     $('#myTable').DataTable();
        //     $('#myTable_filter').addClass("d-none");
        // })



    </script>
    <!-- END Script -->
</body>
</html>


