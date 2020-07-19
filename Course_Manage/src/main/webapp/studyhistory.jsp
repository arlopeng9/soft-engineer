<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/29
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%><%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>学习历史</title>
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
                        <h2 class="bradcaump-title">学习轨迹</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.do">首页</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">学习轨迹</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        <div class="container">
            <div class="row">
                <div ><h4><label>课程学习记录</label></h4></div>

            </div>
    <script src="https://magicbox.bk.tencent.com/static_api/v3/assets/js/jquery-1.10.2.min.js"></script>

    <script src="https://magicbox.bk.tencent.com/static_api/v3/assets/echarts-2.0/echarts-all.js"></script>



    <div id="chart8_demo1" style="height: 500px; padding: 10px; -webkit-tap-highlight-color: transparent; user-select: none; background-color: rgba(0, 0, 0, 0); cursor: default;" _echarts_instance_="1562644559670">

        <div style="position: relative; overflow: hidden; width: 1268px; height: 500px;">

            <div data-zr-dom-id="bg" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1268px; height: 500px; user-select: none;"></div>

            <canvas width="1268" height="500" data-zr-dom-id="0" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1268px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas>

            <canvas width="1268" height="500" data-zr-dom-id="1" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1268px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas>

            <canvas width="1268" height="500" data-zr-dom-id="_zrender_hover_" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1268px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas>

            <div class="echarts-dataview" style="position: absolute; display: block; overflow: hidden; transition: height 0.8s ease 0s, background-color 1s ease 0s; z-index: 1; left: 0px; top: 0px; width: 1268px; height: 0px; background-color: rgb(240, 255, 255);"></div>

            <div class="echarts-tooltip zr-element" style="position: absolute; display: none; border-style: solid; white-space: nowrap; transition: left 0.4s ease 0s, top 0.4s ease 0s; background-color: rgba(0, 0, 0, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); padding: 5px; left: 1014px; top: 261px;">周六

            </div>

        </div>

    </div>

    <script>

        // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径

        function createEAreaChart(conf){

            //--- 区域图 ---

            var myChart = echarts.init(document.getElementById(conf.selector));

            var legendData = []

            for(var i = 0; i < conf.data.series.length;i++){

                legendData.push(conf.data.series[i].name)

            }

            myChart.setOption({

                title : {

                    text: conf.data.text

                },

                tooltip : {

                    trigger: 'axis'

                },

                legend: {

                    data:legendData

                },

                xAxis : [

                    {

                        type : 'category',

                        boundaryGap : false,

                        data : conf.data.xAxis

                    }

                ],

                toolbox: {

                    show : true,

                    y:'bottom',

                    feature : {

                        mark : {show: true},

                        dataView : {show: true, readOnly: false},

                        magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},

                        restore : {show: true},

                        saveAsImage : {show: true}

                    }

                },

                calculable : true,

                yAxis : [

                    {

                        type : 'value'

                    }

                ],

                series : conf.data.series

            });

        }

        function initEAreaChart(conf){
            $.ajax({
                url: conf.url,
                type: 'GET',
                success: function(res){
                    var jsondata = eval("("+ res+ ")");
                    if (jsondata.result){
                        var data = jsondata.data;
                        console.log(data);
                        createEAreaChart({
                            selector: conf.containerId, // 图表容器
                            data: data, // 图表数据
                        });                    }
                },
                error:function(res){
                    console.log(res);
                    alert("shibai")
                }            });

        }

        $(function(){
            initEAreaChart({
                url: 'echart.do',
                containerId: 'chart8_demo1'
            });
        });

        //chart8_demo1_js_end

    </script>
            </div>
            </div>
</div>







</body>
</html>
