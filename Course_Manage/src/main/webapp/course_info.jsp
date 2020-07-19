<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/17
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>课程详情</title>

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

<body <c:if test="${loginUser!=null}"><c:if test="${isSelect == true }">onload="timer()"</c:if></c:if>>
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
         <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">课程详情</h2>
                        <nav class="bradcaump-content">
                        <a class="breadcrumb_item" href="index.do">首页</a>
                        <span class="brd-separetor">/</span>
                        <span class="breadcrumb_item active">课程详情</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start main Content -->
    <div class="maincontent bg--white pt--80 pb--55">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-12">
                    <div class="wn__single__product">
                        <div class="row">
                            <div class="col-lg-6 col-12">
                                <div class="wn__fotorama__wrapper">
                                    <div class="fotorama wn__fotorama__action" data-nav="thumbs">
                                          <a href="1.jpg"><img src="${course.picture}" alt=""></a>
                                          <a href="2.jpg"><img src="style/images/product/2.jpg" alt=""></a>
                                          <a href="3.jpg"><img src="style/images/product/3.jpg" alt=""></a>
                                          <a href="4.jpg"><img src="style/images/product/4.jpg" alt=""></a>
                                          <a href="5.jpg"><img src="style/images/product/5.jpg" alt=""></a>
                                          <a href="6.jpg"><img src="style/images/product/6.jpg" alt=""></a>
                                          <a href="7.jpg"><img src="style/images/product/7.jpg" alt=""></a>
                                          <a href="8.jpg"><img src="style/images/product/8.jpg" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="product__info__main">
                                    <h1>${course.name}</h1>
                                    <div class="product-info-stock-sku d-flex">
                                        <p>状态:<span> ${course.label}</span></p>
                                        <p>参加人数:<span> ${course.people}</span></p>
                                    </div>
                                    <div class="product-reviews-summary d-flex">
                                        <ul class="rating-summary d-flex">
                                            <li><i class="zmdi zmdi-star-outline"></i></li>
                                            <li><i class="zmdi zmdi-star-outline"></i></li>
                                            <li><i class="zmdi zmdi-star-outline"></i></li>
                                            <li class="off"><i class="zmdi zmdi-star-outline"></i></li>
                                            <li class="off"><i class="zmdi zmdi-star-outline"></i></li>
                                        </ul>
                                        <div class="reviews-actions d-flex">
                                            <a href="#">(1 Review)</a>
                                            <a href="#">Add Your Review</a>
                                        </div>
                                    </div>
                                    <div class="box-tocart d-flex">
                                        <c:if test="${course.school != null}">
                                            <span>学校：</span>
                                            <span>${course.school}</span>
                                        </c:if>
                                    </div>
                                    <div class="box-tocart d-flex">
                                        <c:if test="${course.teacher != null}">
                                            <span>教师：</span>
                                            <span>${course.teacher}</span>
                                        </c:if>
                                    </div>
                                    <div class="box-tocart d-flex">
                                        <c:if test="${course.type != null}">
                                        <span>类型：</span>
                                        <span>${course.type}类</span>
                                        </c:if>
                                    </div>
                                    <div class="box-tocart d-flex">
                                        <c:if test="${course.grade != null}">
                                            <span>${course.grade}课程</span>
                                        </c:if>
                                    </div>
                                    <c:if test="${loginUser != null}">
                                        
                                    <div class="box-tocart d-flex"> 
                                        <c:if test="${isSelect == false }">
                                            <c:choose>
                                                <c:when test="${course.label=='上架' }">
                                                    <div class="addtocart__actions">
                                                        <button class="tocart" type="button" onclick="insertCourse()" title="立即参加">立即参加</button>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${isSelect == true }">
                                            <div class="addtocart__actions">
                                                <button class="tocart" type="button" onclick="deleteCourse()" title="取消课程">取消课程</button>
                                            </div><c:choose>
                                                <c:when test="${course.label=='上架' }">
                                                    </c:when>
                                                <c:otherwise>
                                                    </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </div>
                                    </c:if>
                                    <div class="product__overview">
                                        <p>${course.context}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product__info__detailed">
                        <div class="pro_details_nav nav justify-content-start" role="tablist">
                            <a class="nav-item nav-link active" data-toggle="tab" href="#nav-details" role="tab">课程细节</a>
                            <a class="nav-item nav-link" data-toggle="tab" href="#nav-review" role="tab">评论</a>
                        </div>
                        <div class="tab__container">
                            <!-- Start Single Tab Content -->
                            <div class="pro__tab_label tab-pane fade show active" id="nav-details" role="tabpanel">
                                <div class="description__attribute">
                                    <p>${course.context}</p>
                                    
                                </div>
                            </div>
                            <!-- End Single Tab Content -->
                            <!-- Start Single Tab Content -->
                            <div class="pro__tab_label tab-pane fade" id="nav-review" role="tabpanel">
                                <div class="review__attribute">
                                    <h1>用户评论</h1>
                                    <c:forEach items="${reviews}" var="review">
                                    <h2>${review.userName}</h2>
                                    <div class="review__ratings__type d-flex">
                                        <div class="review-ratings">
                                            <div class="rating-summary d-flex">
                                                <span>质量</span>
                                                <ul class="rating d-flex">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>

                                            <div class="rating-summary d-flex">
                                                <span>评论内容</span>
                                                <ul class="rating d-flex">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>
                                            <div class="rating-summary d-flex">
                                                <span>评论时间</span>
                                                <ul class="rating d-flex">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="review-content">
                                            <p>${review.evaluate}</p>
                                            <p>${review.review}</p>
                                            <p>${review.date}</p>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                                <c:if test="${loginUser != null}">
                                <div class="review-fieldset">
                                    <h2>你的评论:</h2>
                                    <h3>${loginUser.username}</h3>
                                    <div class="review_form_field">
                                        <div class="input__box">
                                            <span>质量</span>
                                            <input id="quality_field" type="text" name="quality">
                                        </div>
                                        <div class="input__box">
                                            <span>评论内容</span>
                                            <input id="review_field" type="text" name="review">
                                        </div>
                                        <div class="review-form-actions">
                                            <button type="button" onclick="addReview()">提交评论</button>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                            </div>
                            <!-- End Single Tab Content -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
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
                
            </div>
        </div>
    </div>
    <!-- End main Content -->
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
    function insertCourse() {

        $.ajax({
            type : "post",
            url : "selectcourse.do",
            data : {
                "courseid" : ${course.id},
                "coursename":"${course.name}",
                "userid" : ${loginUser.id},
                "username":"${loginUser.username}"
            },
            async : false,
            method : 'post',
            dataType : "text",
            success : function(data) {
                alert(data);
                /* alert(password==data); */
                location.reload(true);

            },
            error : function(data) {
                //alert("进入了error方法");
                location.reload(true);
            }
        });
        //location.reload() ;
    }
    function deleteCourse() {

        $.ajax({
            type : "post",
            url : "withdrawcourse.do",
            data : {
                "courseid" : ${course.id},
                "userid" : ${loginUser.id}
            },
            async : true,
            success : function(data) {
                alert(data);
                /* alert(password==data); */
                location.reload(true);

            },
            error : function(data) {
                //alert("进入了error方法");
                location.reload(true);
            }
        });
    }
    function addReview() {
        var evaluate = $("#quality_field").val();
        var review = $("#review_field").val();
        $.ajax({
            type : "post",
            url : "addreview.do",
            data : {
                "courseId" : ${course.id},
                "courseName" : "${course.name}",
                "userName" : "${loginUser.username}",
                "review": review,
                "evaluate":evaluate
            },
            async : true,
            success : function(data) {
                /* alert(password==data); */
                location.reload(true);

            },
            error : function(data) {
                //alert("进入了error方法");
                location.reload(true);
            }
        });
    }
    function timer(){

        window.setInterval(function () {


            console.log("开始计时");

            $.ajax({
                url:"historyrecord.do",
                data: {
                    "courseId":${course.id},
                    "userId":${loginUser.id},
                },
                type:"POST",
                success:function(data){
                    console.log("传值成功");
                },
                error:function(){
                    console.log("传值失败");
                }});

        }, 5000);

    }
</script>
</body>
</html>

