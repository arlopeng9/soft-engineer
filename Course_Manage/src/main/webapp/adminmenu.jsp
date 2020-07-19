<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/18
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理</title>
    <script src="style/js/adapter.js"></script> <!--rem适配js-->
    <script src="style/js/jquery-2.1.4.min.js"></script>
    <link rel="stylesheet" href="style/css/base.css"> <!--初始化文件-->
    <link rel="stylesheet" href="style/css/menu.css"> <!--主样式-->
</head>
<body>
<div id="menu" style="float: left;">
    <!--隐藏菜单-->
    <div id="ensconce">
        <h2>
            <img src="style/image/show.png" alt="">
            后台管理
        </h2>
    </div>

    <!--显示菜单-->
    <div id="open">
        <div class="navH">
            <p target="rigt_main" style="color: white;font-size: 20px;">后台管理</p>
            <span><img class="obscure" src="style/image/obscure.png" alt=""></span>
        </div>
        <div class="navBox">
            <ul>
                <li>
                    <h2 class="obtain">用户管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="alluser.do?page=0" target="rigt_main" style="color: white;font-size: 13px;">查看所有用户信息</a></h3>
                        <h3><a href="userdetail.do?userid=-1" target="rigt_main" style="color: white;font-size: 13px;">新增用户</a></h3>
                    </div>
                </li>
                <li>
                    <h2 class="obtain">课程管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="allcourse.do?page=0" target="rigt_main" style="color: white;font-size: 13px;">查看所有课程信息</a></h3>
                        <h3><a href="coursedetail.do?courseid=-1" target="rigt_main" style="color: white;font-size: 13px;">添加课程信息</a></h3>
                    </div>
                </li>
                <li>
                    <h2 class="obtain">评论管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="allreview.do?page=0" target="rigt_main" style="color: white;font-size: 13px;">查看所有评论信息</a></h3>
                    </div>
                </li>
                <c:if test="${Admin.type == '超级管理员'}">
                <li>
                    <h2 class="obtain">管理员管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="alladmin.do?page=0" target="rigt_main" style="color: white;font-size: 13px;">查看所有管理员信息</a></h3>
                        <h3><a href="admindetail.do?adminid=-1" target="rigt_main" style="color: white;font-size: 13px;">新增管理员</a></h3>
                    </div>
                </li>
                </c:if>
            </ul>
            <div style="margin-top: 50px;text-align: center;">
                <h3><a href="adminlogout.do" style="font-size: 15px;color: white;">退出后台管理</a></h3>
            </div>
        </div>
    </div>
</div>
<script src="style/js/menu.js"></script> <!--控制js-->
<script type="text/javascript">

</script>
</body>
</html>