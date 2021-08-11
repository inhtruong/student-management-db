<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/6/2021
  Time: 7:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <%@ include file="/layout/head.jsp"%>
</head>
<body class="authentication-bg">
<div class="home-btn d-none d-sm-block">
    <a href="index.html"><i class="fas fa-home h2"></i></a>
</div>
<div class="account-pages my-5 pt-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-6 text-center">

                <div class="wrapper-page">
                    <img src="assets\images\animat-search-color.gif" alt="" height="120">
                    <h2 class="text-uppercase text-danger">Page Not Found</h2>
                    <p class="text-muted mb-2">It's looking like you may have taken a wrong turn. Don't worry... it happens to the best of us. You might want to check your internet connection. Here's a little tip that might help you get back on track.</p>

                    <a class="btn btn-success waves-effect waves-light mt-4" href="index.html"> Return Home</a>
                </div>
            </div>

        </div>
        <!-- end col -->
    </div>
    <!-- end row -->
</div>
<!-- end container -->

<!-- Vendor js -->
<script src="assets\js\vendor.min.js"></script>

<!-- App js -->
<script src="assets\js\app.min.js"></script>
</body>
</html>
