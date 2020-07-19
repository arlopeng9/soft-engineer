<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/7
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <script src="style/js/jquery-3.2.1.min.js"></script> -->
    <script src="style/js/amazeui.min.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    	<!-- Stylesheets -->

    <link rel="stylesheet" href="style/css/plugins/bootstrap.min.css">
	<link rel="stylesheet" href="style/css/plugins.css">
	<link rel="stylesheet" href="style/css/style.css">

	<!-- Cusom css -->
   <link rel="stylesheet" href="style/css/custom.css">

	<!-- Modernizer js -->
	<script src="style/js/modernizr-3.5.0.min.js"></script>
	<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet"> 

</head>
<body>
    <!-- Header -->
    <header id="wn__header" class="header__area header__absolute sticky__header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                    <div class="logo">
                        <a href="index.do">
                            <img src="images/logo/logo.png" alt="logo images">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8 d-none d-lg-block">
                    <nav class="mainmenu__nav">
                        <ul class="meninmenu d-flex justify-content-start">
                            <li><a href="index.jsp">首页</a></li>
                            <li><a href="course_list.jsp">课程列表</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                    <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                        <li class="shop_search"><a class="search__active" href="#"></a></li>
                        
                        <c:if test="${loginUser != null }">
                        <li class="shopcart"><a class="cartbox_active" href="#"><span class="product_qun">3</span></a>
                            <!-- Start 我的课程 -->
                            <div class="block-minicart minicart__active">
                                <div class="minicart-content-wrapper">
                                    <div class="micart__close">
                                        <span>close</span>
                                    </div>

                                    <div class="single__items">
                                        <div class="miniproduct">
                                            <div class="item01 d-flex">
                                                <div class="thumb">
                                                    <a href="single-product.html"><img src="images/product/sm-img/1.jpg" alt="product images"></a>
                                                </div>
                                                <div class="content">
                                                    <h6><a href="single-product.html">Voyage Yoga Bag</a></h6>
                                                    <span class="prize">$30.00</span>
                                                    <div class="product_prize d-flex justify-content-between">
                                                        <span class="qun">Qty: 01</span>
                                                        <ul class="d-flex justify-content-end">
                                                            <li><a href="#"><i class="zmdi zmdi-settings"></i></a></li>
                                                            <li><a href="#"><i class="zmdi zmdi-delete"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item01 d-flex mt--20">
                                                <div class="thumb">
                                                    <a href="single-product.html"><img src="images/product/sm-img/3.jpg" alt="product images"></a>
                                                </div>
                                                <div class="content">
                                                    <h6><a href="single-product.html">Impulse Duffle</a></h6>
                                                    <span class="prize">$40.00</span>
                                                    <div class="product_prize d-flex justify-content-between">
                                                        <span class="qun">Qty: 03</span>
                                                        <ul class="d-flex justify-content-end">
                                                            <li><a href="#"><i class="zmdi zmdi-settings"></i></a></li>
                                                            <li><a href="#"><i class="zmdi zmdi-delete"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item01 d-flex mt--20">
                                                <div class="thumb">
                                                    <a href="single-product.html"><img src="images/product/sm-img/2.jpg" alt="product images"></a>
                                                </div>
                                                <div class="content">
                                                    <h6><a href="single-product.html">Compete Track Tote</a></h6>
                                                    <span class="prize">$40.00</span>
                                                    <div class="product_prize d-flex justify-content-between">
                                                        <span class="qun">Qty: 03</span>
                                                        <ul class="d-flex justify-content-end">
                                                            <li><a href="#"><i class="zmdi zmdi-settings"></i></a></li>
                                                            <li><a href="#"><i class="zmdi zmdi-delete"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mini_action cart">
                                        <a class="cart__btn" href="">查看我的课程</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End 我的课程 -->
                        </li>
                        </c:if>
                        <li class="setting__bar__icon"><a class="setting__active" href="#"></a>
                            <div class="searchbar__content setting__block">
                                <div class="content-inner">
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>My Account</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <div class="setting__menu">
                                                    <c:if test="${loginUser != null }">
                                                    <span><a href="learncourse.do">我的学习 </a></span>
                                                    <span>[${loginUser.username }]</span>
                                                    <span><a href="logout.do">登出</a></span>
                                                    </c:if>
                                                    <c:if test="${loginUser == null }">
                                                    <span><a href="login.do">登陆</a></span>
                                                    <span><a href="regist.do">注册</a></span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Start Mobile Menu -->
            <div class="row d-none">
                <div class="col-lg-12 d-none">
                    <nav class="mobilemenu__nav">
                        <ul class="meninmenu">
                            <li><a href="index.jsp">首页</a></li>
                            <li><a href="course_list.jsp">课程列表</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- End Mobile Menu -->
            <div class="mobile-menu d-block d-lg-none">
            </div>
            <!-- Mobile Menu -->	
        </div>		
    </header>
    <!-- //Header -->
    <!-- Start Search Popup -->
    <div class="brown--color box-search-content search_active block-bg close__top">
        <form id="search_mini_form" class="minisearch" action="#">
            <div class="field__search">
                <input type="text" placeholder="Search entire store here...">
                <div class="action">
                    <a href="querycourse.do?"><i class="zmdi zmdi-search"></i></a>
                </div>
            </div>
        </form>
        <div class="close__wrap">
            <span>close</span>
        </div>
    </div>
    <!-- End Search Popup -->
    <!-- Start Slider area -->
</body>
</html> 
