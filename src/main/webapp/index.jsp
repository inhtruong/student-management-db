<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/4/2021
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Đăng nhập</title>
    <%@ include file="/layout/head.jsp"%>
  </head>
  <body>
  <div class="account-pages mt-5 mb-5">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6 col-xl-5">
          <div class="card">

            <div class="text-center account-logo-box">
              <div class="mt-2 mb-2">
                <a href="index.html" class="text-success">
                  <span><img src="assets\images\logo.png" alt="" height="36"></span>
                </a>
              </div>
            </div>

            <div class="card-body">

              <form action="/login" method="post">

                <div class="form-group">
                  <input class="form-control" type="text" id="username"  name="username" placeholder="Username">
                </div>

                <div class="form-group">
                  <input class="form-control" type="password" name="password" id="password" placeholder="Password">
                </div>

                <div class="form-group">
                  <div class="custom-control custom-checkbox checkbox-success">
                    <input type="checkbox" class="custom-control-input" id="checkbox-signin" checked="">
                    <label class="custom-control-label" for="checkbox-signin">Remember me</label>
                  </div>
                </div>

                <div class="form-group text-center mt-4 pt-2">
                  <div class="col-sm-12">
                    <a href="#" class="text-muted"><i class="fa fa-lock mr-1"></i> Forgot your password?</a>
                  </div>
                </div>

                <div class="form-group account-btn text-center mt-2">
                  <div class="col-12">
                    <button class="btn width-md btn-bordered btn-danger waves-effect waves-light" type="submit">Log In</button>
                  </div>
                </div>
              </form>

            </div>
            <!-- end card-body -->
          </div>
          <!-- end card -->

          <div class="row mt-5">
            <div class="col-sm-12 text-center">
              <p class="text-muted">Don't have an account? <a href="page-register.html" class="text-primary ml-1"><b>Sign Up</b></a></p>
            </div>
          </div>

        </div>
        <!-- end col -->
      </div>
      <!-- end row -->
    </div>
    <!-- end container -->
  </div>
  <!-- end page -->

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

  <!-- Vendor js -->
  <script src="assets\js\vendor.min.js"></script>

  <!-- App js -->
  <script src="assets\js\app.min.js"></script>
  </body>
</html>
