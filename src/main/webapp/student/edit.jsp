<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/2/2021
  Time: 9:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sửa thông tin</title>
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

                <!-- start page title -->
                <div class="col-12">
                    <h2>Chỉnh sửa thông tin</h2>
                    <h4>Học sinh: ${student.getName()}</h4>
                </div>
                <div class="col-12">
                    <a href="student">Trở về trang quản lý</a>
                </div>
                <!-- end page title -->

                <form method="post" class="row">
                    <c:if test="${student != null}">
                        <input type="hidden" name="id" value="${student.getId()}"/>
                    </c:if>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        <label>Họ và tên: </label>
                        <input type="text" name="name" class="form-control" id="name" value="${student.getName()}" placeholder="Select the name">
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        <label>Giới tính: </label>
                        <select name="gender" class="form-control">
                            <c:if test="${student.getGender() == 1}">
                                <option value="1">Nam</option>
                                <option value="0">Nữ</option>
                            </c:if>
                            <c:if test="${student.getGender() == 0}">
                                <option value="0">Nữ</option>
                                <option value="1">Nam</option>
                            </c:if>
                        </select>
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        <label>Ngày sinh: </label>
                        <input type="date" name="dob" class="form-control" id="dob" value="${student.getDob()}">
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        <label>Email: </label>
                        <input type="email" name="mail" class="form-control" id="mail" value="${student.getMail()}" >
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        <label>Địa chỉ: </label>
                        <input type="text" name="address" class="form-control" id="address" value="${student.getAddress()}">
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        <label>Số điện thoại: </label>
                        <input type="text" name="phoneNum" class="form-control" id="phoneNum" value="${student.getPhoneNum()}" placeholder="+1 (545) 409-2137">
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        <label>Trạng thái: </label>
                        <select name="status" class="form-control">
                            <c:if test="${student.getStatus() == 1}">
                                <option value="1">Đang học</option>
                                <option value="0">Bỏ học</option>
                            </c:if>
                            <c:if test="${student.getStatus() == 0}">
                                <option value="0">Bỏ học</option>
                                <option value="1">Đang học</option>
                            </c:if>
                        </select>
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        <label>Hình ảnh: </label>
                        <input type="text" name="image" class="form-control" id="image" value="${student.getImage()}">
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-4">
                        &nbsp;
                    </div>

                    <div class="form-group col-12 col-sm-12 col-md-2">
                        <button type="submit" class="btn btn-primary" id="submit">Cập nhật</button>
                    </div>
                </form>

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
        <script>
            Swal.fire({
                icon: 'success',
                title: 'New student was created',
                showConfirmButton: false,
                timer: 1500
            })
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
