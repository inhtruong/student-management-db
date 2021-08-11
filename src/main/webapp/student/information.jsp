<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/2/2021
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Thông tin học sinh</title>
    <%@ include file="/layout/head.jsp"%>
</head>
<body data-layout="horizontal">
    <div id="wrapper">
        <!-- Navigation Bar-->
        <%@ include file="/layout/navigation-bar.jsp"%>
        <!-- End Navigation Bar-->

        <!-- Start Page Content here -->
        <div class="content-page">
            <!-- Start content -->
            <div class="content">
                <!-- Start container-fluid-->
                <div class="container-fluid">
                    <div class="col-12">
                        <h2 class="page-title">Thông tin học sinh</h2>
                    </div>
                    <div class="col-12">
                        <a href="student">Trở về trang quản lý</a>
                    </div>

                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-4">
                            <figure class="figure">
                                <img src="${student.getImage()}" class="figure-img img-fluid rounded"
                                     style="width: 370px; height: 370px" alt="Lỗi">
                            </figure>
                        </div>
                        <div class="col-12 col-sm-12 col-md-8">
                            <div class="row">
                                <label class="col-8"><span class="font-weight-bold">Họ và tên:</span> ${student.getName()}</label>
                            </div>
                            <c:if test="${student.getGender()} == 1">
                                <div class="row">
                                    <label class="col-8"><span class="font-weight-bold">Giới tính:</span> Nam</label>
                                </div>
                            </c:if>
                            <c:if test="${student.getGender()} == 0">
                                <div class="row">
                                    <label class="col-8"><span class="font-weight-bold">Giới tính:</span> Nữ</label>
                                </div>
                            </c:if>
                            <div class="row">
                                <label class="col-8"><span class="font-weight-bold">Ngày sinh:</span> ${student.getDob()}</label>
                            </div>
                            <div class="row">
                                <label class="col-8"><span class="font-weight-bold">Email:</span> ${student.getMail()}</label>
                            </div>
                            <div class="row">
                                <label class="col-8"><span class="font-weight-bold">Địa chỉ:</span> ${student.getAddress()}</label>
                            </div>
                            <div class="row">
                                <label class="col-8"><span class="font-weight-bold">Số điện thoại:</span> ${student.getPhoneNum()}</label>
                            </div>
                            <div class="row">
                                <label class="col-8">
                                    <span class="font-weight-bold">Trạng thái:</span>
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
                                </label>
                            </div>
                        </div>
                    </div>
                    <div><a href="student">Trở về trang quản lý</a></div>

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
        <div class="alert alert-success" style="position: fixed; bottom: 0; right: 0; left: 0">
            <button type="button" class="close" data-dismiss="alert">x</button>
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
                    // $(".alert-danger").show();
                    $(".alert-danger").slideUp("slow");
                });

                $(".close").click(function () {
                    // $(".alert-danger").hide();
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
                    // $(".alert-warning").show();
                    $(".alert-warning").slideUp("slow");
                });
                $(".close").click(function () {
                    // $(".alert-warning").hide();
                    $(".alert-warning").slideUp("slow");
                });

            });
        </script>
    </c:if>
</div>
    <!-- Script Start -->
    <%@ include file="/layout/script.jsp"%>
    <!-- END Script -->
</body>
</html>
