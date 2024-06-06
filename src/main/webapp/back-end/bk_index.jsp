<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/back-end/adminInfo.jsp" %>
<%@ include file="/back-end/checkAdminSession.jsp" %>

<!DOCTYPE html>
<html lang="en">
<!-- head -->
<%@ include file="/back-end/component/header.jsp" %>

<body class="hold-transition sidebar-mini layout-fixed" data-panel-auto-height-mode="height">
<div class="wrapper">
    <!-- Preloader -->
    <div class="preloader flex-column justify-content-center align-items-center">
        <img class="animation__shake" src="${pageContext.request.contextPath}/back-end/dist/img/logo.png" alt="BookTalk Logo" height="150" width="150">
    </div>

    <!-- Navbar -->
    <%@ include file="/back-end/component/navbar.jsp" %>

    <!-- Main Sidebar Container -->
    <%@ include file="/back-end/component/sidebar.jsp" %> 

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper iframe-mode" data-widget="iframe" data-loading-screen="750">
        <div class="nav navbar navbar-expand navbar-white navbar-light border-bottom p-0">
            <div class="nav-item dropdown">
                <a class="nav-link bg-danger dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">關閉</a>
                <div class="dropdown-menu mt-0">
                    <a class="dropdown-item" href="#" data-widget="iframe-close" data-type="all">全部關閉</a>
                    <a class="dropdown-item" href="#" data-widget="iframe-close" data-type="all-other">關閉其他分頁</a>
                </div>
            </div>
            <a class="nav-link bg-light" href="#" data-widget="iframe-scrollleft"><i class="fas fa-angle-double-left"></i></a>
            <ul class="navbar-nav overflow-hidden" role="tablist"></ul>
            <a class="nav-link bg-light" href="#" data-widget="iframe-scrollright"><i class="fas fa-angle-double-right"></i></a>
            <a class="nav-link bg-light" href="#" data-widget="iframe-fullscreen"><i class="fas fa-expand"></i></a>
        </div>
        <div class="tab-content">
            <div class="tab-empty">
                <h2 class="display-4">No tab selected!</h2>
            </div>
            <div class="tab-loading">
                <div>
                    <h2 class="display-4">Tab is loading <i class="fa fa-sync fa-spin"></i></h2>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->

    <!-- footer -->
    <%@ include file="/back-end/component/footer.jsp" %>

</div>
<!-- ./wrapper -->

<!-- js -->
<%@ include file="/back-end/component/script.jsp" %>

</body>
</html>
