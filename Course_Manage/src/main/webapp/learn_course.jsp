<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/15
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%><%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
    <meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>我的课程</title>
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
                        <h2 class="bradcaump-title">我的课程</h2>
                        <nav class="bradcaump-content">
                        <a class="breadcrumb_item" href="index.do">首页</a>
                        <span class="brd-separetor">/</span>
                        <span class="breadcrumb_item active">我的课程</span>
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
        			<div class="col-lg-9 col-12 order-1 order-lg-2">
        				<div class="row">
        					<div class="col-lg-12">
								<div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
									<div class="shop__list nav justify-content-center" role="tablist">
			                            <a class="nav-item nav-link" data-toggle="tab" href="#nav-grid" role="tab"><i class="fa fa-th"></i></a>
			                            <a class="nav-item nav-link active" data-toggle="tab" href="#nav-list" role="tab"><i class="fa fa-list"></i></a>
			                        </div>

									 <!--Regular list-->

		                        </div>
                                
        					</div>
        				</div>

        				<div class="tab__container">
	        				<div class="shop-grid tab-pane fade" id="nav-grid" role="tabpanel">
                                <div class="row">
                                    <c:forEach var="course" items="${mycourses}" varStatus="status">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-12">
	        						<!-- Start Single Product -->

                                        <div class="product product__style--3">
		        					<div class="col-lg-4 col-md-4 col-sm-6 col-12">
			        						<div class="product__thumb">
			        							<a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product image"></a>
			        							<a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/product/2.jpg" alt="product image"></a>
			        							<div class="new__box">
			        								<span class="new-label">${course.grade}</span>
			        							</div>

                                            </div>
                                            <div class="product__content content--center">
                                                <h4><a href="course_info.do?id=${course.id}">${course.name}</a></h4>
                                                <ul class="prize d-flex">
                                                    <li><a href="course_info.do?id=${course.id}">${course.name}</a></li>
                                                    <li>${course.teacher}</li>
                                                </ul>
                                                <div class="action">
                                                    <div class="actions_inner">
                                                        <ul class="add_to_links">
                                                            <li><a class="cart" href="javascript:deleteCourse(courseid='${course.id}')"><i class="zmdi zmdi-delete"></i></a></li>
                                                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link" href="#productmodal${course.id}"><i class="bi bi-search"></i></a></li>
                                                        </ul>
                                                    </div>

                                                </div>
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
                                    <!-- End Single Product -->

                                        </div>
                                        </div>
                                        <!-- QUICKVIEW PRODUCT -->
                                        <div id="quickview-wrapper">
                                            <!-- Modal -->
                                            <div class="modal fade" id="productmodal${course.id}" tabindex="-1" role="dialog">
                                                <div class="modal-dialog modal__container" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header modal__header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="modal-product">
                                                                <!-- Start product images -->
                                                                <div class="product-images">
                                                                    <div class="main-image images">
                                                                        <img alt="big images" src="${course.picture}">
                                                                    </div>
                                                                </div>
                                                                <!-- end product images -->
                                                                <div class="product-info">
                                                                    <h1>${course.name}</h1>
                                                                    <div class="rating__and__review">
                                                                        <ul class="rating">
                                                                            <li><span class="ti-star"></span></li>
                                                                            <li><span class="ti-star"></span></li>
                                                                            <li><span class="ti-star"></span></li>
                                                                            <li><span class="ti-star"></span></li>
                                                                            <li><span class="ti-star"></span></li>
                                                                        </ul>
                                                                        <div class="review">
                                                                            <a href="#">4 customer reviews</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="review">
                                                                        <a href="#">${course.teacher}</a>
                                                                    </div>
                                                                    <div class="price-box-3">
                                                                        <div class="s-price-box">
                                                                            <span class="new-price">${course.label}</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="quick-desc">
                                                                            ${course.context}</div>

                                                                    <div class="addtocart-btn">
                                                                        <a href="course_info.do?id=${course.id}">浏览详情</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END QUICKVIEW PRODUCT -->
                                    </c:forEach>
                                </div>
	        				</div>
	        				<div class="shop-grid tab-pane fade show active" id="nav-list" role="tabpanel">
	        					<div class="list__view__wrapper">
                                    <c:forEach var="course" items="${mycourses}" varStatus="status">
	        						<!-- Start Single Product -->
	        						<div class="list__view">
	        							<div class="thumb">
	        								<a class="first__img" href="course_info.do?id=${course.id}"><img src="${course.picture}" alt="product images"></a>
	        								<a class="second__img animation1" href="course_info.do?id=${course.id}"><img src="style/images/product/2.jpg" alt="product images"></a>
	        							</div>
	        							<div class="content">
	        								<h2><a href="course_info.do?id=${course.id}">${course.name}</a></h2>
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                            <ul class="prize__box">
	        									<li>${course.teacher}</li>
	        								</ul>
	        								<p>${course.context}</p>
                                            <ul class="cart__action d-flex">
                                                <li class="cart"><a href="javascript:deleteCourse(courseid='${course.id}')">撤销课程</a></li>
                                                <li class="cart"><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link" href="#productmodal1${course.id}">预览</a></li>

                                            </ul>

	        							</div>
	        						</div>
                                    <!-- End Single Product -->

                                        <!-- QUICKVIEW PRODUCT -->
                                        <div id="quickview-wrapper">
                                            <!-- Modal -->
                                            <div class="modal fade" id="productmodal1${course.id}" tabindex="-1" role="dialog">
                                                <div class="modal-dialog modal__container" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header modal__header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="modal-product">
                                                                <!-- Start product images -->
                                                                <div class="product-images">
                                                                    <div class="main-image images">
                                                                        <img alt="big images" src="${course.picture}">
                                                                    </div>
                                                                </div>
                                                                <!-- end product images -->
                                                                <div class="product-info">
                                                                    <h1>${course.name}</h1>
                                                                    <div class="rating__and__review">
                                                                        <ul class="rating">
                                                                            <li><span class="ti-star"></span></li>
                                                                            <li><span class="ti-star"></span></li>
                                                                            <li><span class="ti-star"></span></li>
                                                                            <li><span class="ti-star"></span></li>
                                                                            <li><span class="ti-star"></span></li>
                                                                        </ul>
                                                                        <div class="review">
                                                                            <a href="#">4 customer reviews</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="review">
                                                                        <a href="#">${course.teacher}</a>
                                                                    </div>
                                                                    <div class="price-box-3">
                                                                        <div class="s-price-box">
                                                                            <span class="new-price">${course.label}</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="quick-desc">
                                                                            ${course.context}</div>

                                                                    <div class="addtocart-btn">
                                                                        <a href="course_info.do?id=${course.id}">浏览详情</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END QUICKVIEW PRODUCT -->
									</c:forEach>
	        					</div>
	        				</div>
						</div>
        			</div>
        		</div>
        	</div>
        </div>
        <!-- End Shop Page -->
</div>







<div id="loginModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    你确定放弃学习？
                </h4>
            </div>
            <div class="modal-body">
                放弃学习将不再收到相关的课件更新和教学服务通知，你可以在课程有效期内免费重新参加。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" onclick="deleteCourse()">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- Modernizer js -->
<script src="style/js/modernizr-3.5.0.min.js" ></script>
<!-- JS Files -->
<script src="style/js/jquery-3.2.1.min.js"></script>
<script src="style/js/popper.min.js"></script>
<script src="style/js/repeat/bootstrap.min.js"></script>
<script src="style/js/plugins.js"></script>
<script src="style/js/active.js"></script>
<script>
    $(document).ready(function(){
        $(".uc-ykt-coursecard-wrap_box").mouseenter(function(){
            $(this).children(".uc-ykt-course-card_closewrap").children(".f-dn").show();

        });
    });
    $(document).ready(function(){
        $(".uc-ykt-coursecard-wrap_box").mouseleave(function(){
            $(this).children(".uc-ykt-course-card_closewrap").children(".f-dn").hide();
        });
    });


    $(document).ready(function(){
        function check(courseid){
            id =courseid;


            $('#loginModal').modal('show');
            return false;

        }
    });

    function deleteCourse(courseid) {
        var r = confirm("确定撤销该课程吗？")
        if(r == true){
        $.ajax({
                type : "post",
                url : "withdrawcourse.do",
                data : {
                    "courseid" : courseid ,
                    "userid" :  "${loginUser.id}"
                },
                async : true,
                success : function(data) {
                    /* alert(password==data); */
                    if (data == "撤销课程成功") {
                        alert(data);
                        location.reload(true);
                    } else {
                        alert(data);
                        return;
                    }
                    /* alert(data); */
                },
                error : function(data){
                    //alert("进入了error方法");
                    location.reload(true) ;
                }
            });
        }
    }
</script>
</body>
</html>

