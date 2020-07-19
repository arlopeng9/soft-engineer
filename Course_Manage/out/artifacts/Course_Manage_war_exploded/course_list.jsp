<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/17
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
    <meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>课程列表</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
 <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">课程列表</h2>
                        <nav class="bradcaump-content">
                        <a class="breadcrumb_item" href="index.do">首页</a>
                        <span class="brd-separetor">/</span>
                        <span class="breadcrumb_item active">课程列表</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
        <!-- Start Shop Page -->
        <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
        				<div class="shop__sidebar">
        					<aside class="wedget__categories poroduct--cat">
        						<h3 class="wedget__title">院校分类</h3>
        						<ul>
        							<li><a href="querycourseBySchool?search=Mooc大学">Mooc大学 <span>(${school.get(0)})</span></a></li>
        							<li><a href="querycourseBySchool?search武汉大学">武汉大学 <span>(${school.get(1)})</span></a></li>
        							<li><a href="querycourseBySchool?search=北京大学">北京大学 <span>(${school.get(2)})</span></a></li>
        							<li><a href="querycourseBySchool?search=清华大学">清华大学 <span>(${school.get(3)})</span></a></li>
        							<li><a href="querycourseBySchool?search=华中科技大学">华中科技大学 <span>(${school.get(4)})</span></a></li>
        							<li><a href="querycourseBySchool?search=同济大学">同济大学 <span>(${school.get(5)})</span></a></li>
        							<li><a href="querycourseBySchool?search=复旦大学">复旦大学 <span>(${school.get(6)})</span></a></li>
        							<li><a href="querycourseBySchool?search=厦门大学">厦门大学 <span>(${school.get(7)})</span></a></li>
        							<li><a href="querycourseBySchool?search=哈尔滨工业大学">哈尔滨工业大学 <span>(${school.get(8)})</span></a></li>
        							<li><a href="querycourseBySchool?search=浙江大学">浙江大学<span>(${school.get(9)})</span></a></li>
        							<li><a href="querycourseBySchool?search=南京大学">南京大学 <span>(${school.get(10)})</span></a></li>
        							<li><a href="querycourseBySchool?search=西北工业大学">西北工业大学 <span>(${school.get(11)})</span></a></li>
        							<li><a href="querycourseBySchool?search=北京邮电大学">北京邮电大学<span>(${school.get(12)})</span></a></li>
                                    <li><a href="querycourseBySchool?search=其他">其他<span>(${school.get(13)})</span></a></li>
        						</ul>
        					</aside>
        					<aside class="wedget__categories poroduct--tag">
        						<h3 class="wedget__title">标签</h3>
        						<ul>
        							<li><a href="querycourseByTag?search1=计算机">计算机</a></li>
        							<li><a href="querycourseByTag?search1=数理化">数理化</a></li>
        							<li><a href="querycourseByTag?search1=经济学">经济学</a></li>
        							<li><a href="querycourseByTag?search1=工业技术">工业技术</a></li>
        							<li><a href="querycourseByTag?search1=生物学">生物学</a></li>
        						</ul>
        					</aside>
        					<aside class="wedget__categories sidebar--banner">
								<img src="style/images/others/banner_left.jpg" alt="banner images">
								<div class="text">
									<h2>Thanks for usage</h2>
									<h6>From:<br> <strong>第九小组</strong></h6>
								</div>
        					</aside>
        				</div>
        			</div>
        			<div class="col-lg-9 col-12 order-1 order-lg-2">
        				<div class="row">
        					<div class="col-lg-12">
								<div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
									<div class="shop__list nav justify-content-center" role="tablist">
			                            <a class="nav-item nav-link" data-toggle="tab" href="#nav-grid" role="tab"><i class="fa fa-th"></i></a>
			                            <a class="nav-item nav-link active" data-toggle="tab" href="#nav-list" role="tab"><i class="fa fa-list"></i></a>
			                        </div>

									<c:if test="${search!=null}">
			                        <p>Showing ${newcourses.size()} search results</p>
									</c:if>
									<c:if test="${search==null}">
										<p>Showing 1-12 of ${newcourses.size()} results</p>
									</c:if>
		                        </div>
        					</div>
        				</div>
        				<div class="tab__container">
							<c:if test="${courses == null}">
								<h2>无对应搜索结果，请尝试更换关键词</h2>
							</c:if>
							<c:if test="${courses != null}">
	        				<div class="shop-grid tab-pane fade" id="nav-grid" role="tabpanel">
	        					<div class="row">
                                    <c:forEach var="course" items="${newcourses}" varStatus="status">
	        						<!-- Start Single Product -->
		        					<div class="col-lg-4 col-md-4 col-sm-6 col-12">
			        					<div class="product">
			        						<div class="product__thumb">
			        							<a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
			        							<a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/product/2.jpg" alt="product image"></a>
			        							<div class="new__box">
			        								<span class="new-label">${course.grade}</span>
			        							</div>
			        							<ul class="prize position__right__bottom d-flex">
			        								<li>${course.teacher}</li>
			        							</ul>
                                            </div>
                                            <div class="product__content">
			        							<h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
			        						</div>
			        					</div>
		        					</div>
                                    <!-- End Single Product -->
                                    </c:forEach>
	        					</div>
	        					<ul class="wn__pagination">
	        						<li class="active"><a href="#">1</a></li>
	        						<li><a href="#">2</a></li>
	        						<li><a href="#">3</a></li>
	        						<li><a href="#">4</a></li>
	        						<li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
	        					</ul>
	        				</div>
	        				<div class="shop-grid tab-pane fade show active" id="nav-list" role="tabpanel">
	        					<div class="list__view__wrapper">
                                    <c:forEach var="course" items="${newcourses}" varStatus="status">
	        						<!-- Start Single Product -->
	        						<div class="list__view">
	        							<div class="thumb">
	        								<a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product images"></a>
	        								<a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/product/2.jpg" alt="product images"></a>
	        							</div>
	        							<div class="content">
	        								<h2><a href="course_info.do?id=${course.id}">${course.name}</a></h2>
	        								<ul class="prize__box">
	        									<li>${course.teacher}</li>
	        								</ul>
	        								<p>${course.context}</p>
	        								

	        							</div>
	        						</div>
                                    <!-- End Single Product -->
									</c:forEach>
	        					</div>
	        				</div>
							</c:if>
						</div>
        			</div>
        		</div>
        	</div>
        </div>
        <!-- End Shop Page -->
    </div>
    <!-- //Main wrapper -->
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

