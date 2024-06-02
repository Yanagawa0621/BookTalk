<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <!-- Main Sidebar Container -->
 <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="${pageContext.request.contextPath}/back-end/bk_index.jsp" class="brand-link">
      <img src="${pageContext.request.contextPath}/back-end/dist/img/logo.png" alt="BookTalk Logo" height="80" width="80" class="brand-image elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">不可說 (Book Talk)</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath}/back-end/dist/img/userAdmin1.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Coy Chang</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                帳號管理
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/back-end/user/users.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>會員列表</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>會員權限類別</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-book"></i>
              <p>
                商品管理
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/back-end/bookProducts/bookProducts.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>商品列表</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/back-end/bookClass/bookClass.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>書籍類別資料</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/back-end/publishingHouse/publishingHouse.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>出版社資料</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/back-end/author/author.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>作者資料</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-cart-arrow-down"></i>
              <p>
                訂單管理
                <i class="right fas fa-angle-left"></i>               
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/back-end/order/order.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>訂單列表</p>
                </a>
              </li>
            </ul>                      
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-user-astronaut"></i>
              <p>
                客服
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">5</span>      
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>客訴案件列表</p>
                  <span class="badge badge-info right">5</span> 
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>前台Q&A資料編輯</p>
                </a>
              </li>    
            </ul>           
          </li>        
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fab fa-wpforms"></i>
              <p>
                論壇管理
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>  
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>文章檢舉列表</p>
                  <span class="badge badge-info right">6</span> 
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-bar"></i>
              <p>
                資料分析
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>營收</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>熱門文章/書籍</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">暫時保留的樣式</li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>