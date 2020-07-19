<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/7
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>

    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <script src="style/js/jquery-3.2.1.min.js"></script> -->
    <!-- Stylesheets -->
    <link rel="stylesheet" href="style/css/plugins/bootstrap.min.css">
    <link rel="stylesheet" href="style/css/plugins.css">
    <link rel="stylesheet" href="style/style.css">

    <!-- Custom css -->
    <link rel="stylesheet" href="style/css/custom.css">


</head>
<body>
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <header id="wn__header" class="header__area header__absolute sticky__header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                    <div class="logo">
                        <a href="index.do">
                            <img src="style/images/logo/logo.png" alt="logo images">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8 d-none d-lg-block">
                    <nav class="mainmenu__nav">
                        <ul class="meninmenu d-flex justify-content-start">
                            <li><a href="index.do">首页</a></li>
                            <li><a href="querycourse.do">课程列表</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                    <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                        <li class="shop_search"><a class="search__active" href="#"></a></li>

                        <c:if test="${loginUser != null }">
                            <li class="shopcart"><a class="cartbox_active" href="#"><span class="product_qun">${mycourses.size()}</span></a>
                                <!-- Start 我的课程 -->
                                <div class="block-minicart minicart__active">
                                    <div class="minicart-content-wrapper">
                                        <div class="micart__close">
                                            <span>close</span>
                                        </div>

                                        <div class="single__items">
                                            <div class="miniproduct">
                                                <c:forEach var="course" items="${mycourses}" begin="0" end="2">
                                                <div class="item01 d-flex">
                                                    <div class="thumb">
                                                        <a href="course_info.do?id=${course.id}"><img src="style/images/product/sm-img/1.jpg" alt="product images"></a>
                                                    </div>
                                                    <div class="content">
                                                        <h6><a href="course_info.do?id=${course.id}">${course.name}</a></h6>
                                                        <span class="prize">${course.teacher}</span>
                                                        <span class="prize">${course.school}</span>
                                                        <div class="product_prize d-flex justify-content-between">
                                                            <span class="qun">${course.label}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="mini_action cart">
                                            <a class="cart__btn" href="learncourse.do">查看我的课程</a>
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
                                                        <span><a href="studyhistory.jsp">${loginUser.username}</a></span>
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
                            <li><a href="index.do">首页</a></li>
                            <li><a href="querycourse.do">课程列表</a></li>
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
        <form id="search_form" class="minisearch" action="querycourse.do" method="post">
            <div class="field__search">
                <input id="search" name="search" type="text" placeholder="Search entire store here...">
                <div class="action">
                    <a href="javascript:document:search_form.submit();"><i class="zmdi zmdi-search"></i></a>
                </div>
            </div>
        </form>
        <div class="close__wrap">
            <span>close</span>
        </div>
    </div>
    <!-- End Search Popup -->
 <!-- Start Slider area -->
    <div class="slider-area brown__nav slider--15 slide__activation slide__arrow01 owl-carousel owl-theme">
        <!-- Start Single Slide -->
        <div class="slide animation__style10 bg-image--1 fullscreen align__center--left">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="slider__content">
                            <div class="contentbox">
                                <h2>选择 <span>你 </span></h2>
                                <h2>最喜欢 <span>的课程 </span></h2>
                                <h2>from <span>Here </span></h2>
                                <a class="shopbtn" href="querycourse.do">select now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Single Slide -->
        <!-- Start Single Slide -->
        <div class="slide animation__style10 bg-image--7 fullscreen align__center--left">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="slider__content">
                            <div class="contentbox">
                                <h2>选择 <span>你 </span></h2>
                                <h2>最喜欢 <span>的课程 </span></h2>
                                <h2>from <span>Here </span></h2>
                                <a class="shopbtn" href="querycourse.do">select now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Single Slide -->
    </div>
    <!-- End Slider area -->
    <!-- Start BEst Seller Area -->
    <section class="wn__product__area brown--color pt--80 pb--30">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__title text-center">
                        <h2 class="title__be--2">最新 <span class="color--theme">课程</span></h2>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered lebmid alteration in some ledmid form</p>
                    </div>
                </div>
            </div>
            <!-- Start Single Tab Content -->
            <div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
                <c:forEach var="course" items="${latestcourses}" begin="0" end="9">
                    <!-- Start Single Product -->
                    <div class="product product__style--3">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="product__thumb">
                                <a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
                                <a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/books/2.jpg" alt="product image"></a>
                                <div class="hot__box">
                                    <span class="hot-label">${course.grade}</span>
                                </div>
                            </div>
                            <div class="product__content content--center">
                                <h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
                                <ul class="prize d-flex">
                                    <li>${course.teacher}</li>
                                </ul>
                                <h5>${course.school}</h5>

                            </div>
                        </div>
                    </div>
                    <!-- Start Single Product -->
                </c:forEach>
            </div>
            <!-- End Single Tab Content -->
        </div>
    </section>
    <!-- Start BEst Seller Area -->
    <section class="wn__bestseller__area bg--white pt--80 pb--30">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__title text-center">
                        <h2 class="title__be--2">All <span class="color--theme">Products</span></h2>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered lebmid alteration in some ledmid form</p>
                    </div>
                </div>
            </div>
            <div class="row mt--50">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="product__nav nav justify-content-center" role="tablist">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#nav-computer" role="tab">COMPUTER</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-biographic" role="tab">BIOGRAPHIC</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-adventure" role="tab">THEORETICAL</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-children" role="tab">ECONOMICAL</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-cook" role="tab">ENGINEERING</a>
                    </div>
                </div>
            </div>
            <div class="tab__container mt--60">
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade show active" id="nav-computer" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <c:forEach var="course" items="${computercourses}" begin="0" end="11">
                            <div class="single__product">
                                <!-- Start Single Product -->
                                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                    <div class="product product__style--3">
                                        <div class="product__thumb">
                                            <a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
                                            <a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/books/2.jpg" alt="product image"></a>
                                            <div class="hot__box">
                                                <span class="hot-label">${course.grade}</span>
                                            </div>
                                        </div>
                                        <div class="product__content content--center content--center">
                                            <h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
                                            <ul class="prize d-flex">
                                                <li>${course.teacher}</li>
                                            </ul>
                                            <h5>${course.school}</h5>
                                            <div class="product__hover--content">
                                                <ul class="rating d-flex">
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Start Single Product -->
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- End Single Tab Content -->
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade" id="nav-biographic" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <c:forEach var="course" items="${creacourses}" >
                            <div class="single__product">
                                <!-- Start Single Product -->
                                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                    <div class="product product__style--3">
                                        <div class="product__thumb">
                                            <a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
                                            <a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/books/2.jpg" alt="product image"></a>
                                            <div class="hot__box">
                                                <span class="hot-label">${course.grade}</span>
                                            </div>
                                        </div>
                                        <div class="product__content content--center content--center">
                                            <h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
                                            <ul class="prize d-flex">
                                                <li>${course.teacher}</li>
                                            </ul>
                                            <h5>${course.school}</h5>
                                            <div class="product__hover--content">
                                                <ul class="rating d-flex">
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Start Single Product -->
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- End Single Tab Content -->
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade" id="nav-adventure" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <c:forEach var="course" items="${therocourses}" begin="0" end="11">
                            <div class="single__product">
                                <!-- Start Single Product -->
                                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                    <div class="product product__style--3">
                                        <div class="product__thumb">
                                            <a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
                                            <a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/books/2.jpg" alt="product image"></a>
                                            <div class="hot__box">
                                                <span class="hot-label">${course.grade}</span>
                                            </div>
                                        </div>
                                        <div class="product__content content--center content--center">
                                            <h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
                                            <ul class="prize d-flex">
                                                <li>${course.teacher}</li>
                                            </ul>
                                            <h5>${course.school}</h5>
                                            <div class="product__hover--content">
                                                <ul class="rating d-flex">
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Start Single Product -->
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- End Single Tab Content -->
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade" id="nav-children" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <c:forEach var="course" items="${ecocourses}" begin="0" end="11">
                            <div class="single__product">
                                <!-- Start Single Product -->
                                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                    <div class="product product__style--3">
                                        <div class="product__thumb">
                                            <a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
                                            <a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/books/2.jpg" alt="product image"></a>
                                            <div class="hot__box">
                                                <span class="hot-label">${course.grade}</span>
                                            </div>
                                        </div>
                                        <div class="product__content content--center content--center">
                                            <h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
                                            <ul class="prize d-flex">
                                                <li>${course.teacher}</li>
                                            </ul>
                                            <h5>${course.school}</h5>
                                            <div class="product__hover--content">
                                                <ul class="rating d-flex">
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Start Single Product -->
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- End Single Tab Content -->
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade" id="nav-cook" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <c:forEach var="course" items="${faccourses}" begin="0" end="11">
                            <div class="single__product">
                                <!-- Start Single Product -->
                                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                    <div class="product product__style--3">
                                        <div class="product__thumb">
                                            <a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
                                            <a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/books/2.jpg" alt="product image"></a>
                                            <div class="hot__box">
                                                <span class="hot-label">${course.grade}</span>
                                            </div>
                                        </div>
                                        <div class="product__content content--center content--center">
                                            <h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
                                            <ul class="prize d-flex">
                                                <li>${course.teacher}</li>
                                            </ul>
                                            <h5>${course.school}</h5>
                                            <div class="product__hover--content">
                                                <ul class="rating d-flex">
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Start Single Product -->
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- End Single Tab Content -->
            </div>
        </div>
    </section>
    <!-- Start BEst Seller Area -->
    <!-- Best Sale Area -->
    <section class="best-seel-area pt--80 pb--60">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__title text-center pb--50">
                        <h2 class="title__be--2">最受欢迎 <span class="color--theme">课程 </span></h2>
                        <p>There are many variations of courses of Lorem Ipsum available, but the majority have suffered lebmid alteration in some ledmid form</p>
                    </div>
                </div>
            </div>
            <!-- Start Single Tab Content -->
            <div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
                <c:forEach var="course" items="${favouratecourses}" begin="0" end="9">
                    <!-- Start Single Product -->
                    <div class="product product__style--3">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="product__thumb">
                                <a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
                                <a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/books/2.jpg" alt="product image"></a>
                                <div class="hot__box">
                                    <span class="hot-label">${course.grade}</span>
                                </div>
                            </div>
                            <div class="product__content content--center">
                                <h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
                                <ul class="prize d-flex">
                                    <li>${course.teacher}</li>
                                </ul>
                                <h5>${course.school}</h5>

                            </div>
                        </div>
                    </div>
                    <!-- Start Single Product -->
                </c:forEach>
            </div>
            <!-- End Single Tab Content -->
<%--            <div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">--%>
<%--            <c:forEach var="course" items="${favouratecourses}" begin="0" end="9">--%>
<%--            <!-- Single product start -->--%>
<%--            <div class="product product__style--3">--%>

<%--                <div class="product__thumb">--%>
<%--                    <a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>--%>
<%--                    <div class="new__box">--%>
<%--                        <span class="new-label">${course.grade}</span>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--                <div class="product__content content--center">--%>
<%--                    <ul class="prize d-flex">--%>
<%--                        <li><a href="course_info.do?id=${course.id}">${course.name}</a></li>--%>
<%--                        <li>${course.teacher}</li>--%>
<%--                    </ul>--%>
<%--                    <div class="action">--%>
<%--                        <div class="actions_inner">--%>
<%--                            <ul class="add_to_links">--%>
<%--                                <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link" href="#productmodal${course.id}"><i class="bi bi-search"></i></a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <!-- Single product end -->--%>
<%--                <!-- QUICKVIEW PRODUCT -->--%>
<%--                <div id="quickview-wrapper">--%>
<%--                    <!-- Modal -->--%>
<%--                    <div class="modal fade" id="productmodal${course.id}" tabindex="-1" role="dialog">--%>
<%--                        <div class="modal-dialog modal__container" role="document">--%>
<%--                            <div class="modal-content">--%>
<%--                                <div class="modal-header modal__header">--%>
<%--                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
<%--                                </div>--%>
<%--                                <div class="modal-body">--%>
<%--                                    <div class="modal-product">--%>
<%--                                        <!-- Start product images -->--%>
<%--                                        <div class="product-images">--%>
<%--                                            <div class="main-image images">--%>
<%--                                                <img alt="big images" src="${course.picture}">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <!-- end product images -->--%>
<%--                                        <div class="product-info">--%>
<%--                                            <h1>${course.name}</h1>--%>
<%--                                            <div class="rating__and__review">--%>
<%--                                                <ul class="rating">--%>
<%--                                                    <li><span class="ti-star"></span></li>--%>
<%--                                                    <li><span class="ti-star"></span></li>--%>
<%--                                                    <li><span class="ti-star"></span></li>--%>
<%--                                                    <li><span class="ti-star"></span></li>--%>
<%--                                                    <li><span class="ti-star"></span></li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>
<%--                                            <div class="review">--%>
<%--                                                <a href="#">${course.teacher}</a>--%>
<%--                                            </div>--%>
<%--                                            <div class="price-box-3">--%>
<%--                                                <div class="s-price-box">--%>
<%--                                                    <span class="new-price">${course.label}</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="quick-desc">--%>
<%--                                                    ${course.context}</div>--%>

<%--                                            <div class="addtocart-btn">--%>
<%--                                                <a href="course_info.do?id=${course.id}">浏览详情</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- END QUICKVIEW PRODUCT -->--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
        </div>

    </section>
    <!-- Best Sale Area Area -->
</div>
<!-- Modernizer js -->
<script src="style/js/modernizr-3.5.0.min.js" ></script>
<!-- JS Files -->
<script src="style/js/jquery-3.2.1.min.js"></script>
<script src="style/js/popper.min.js"></script>
<script src="style/js/repeat/bootstrap.min.js"></script>
<script src="style/js/plugins.js"></script>
<script src="style/js/active.js"></script>
</body>
</html>