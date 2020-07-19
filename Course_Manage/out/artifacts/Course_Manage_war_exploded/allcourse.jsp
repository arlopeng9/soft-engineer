<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/18
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String jsUrl = request.getContextPath() + "/style/js/";
    String cssUrl = request.getContextPath() + "/style/css/";
    String imgUrl = request.getContextPath() + "/style/img/";
%>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理</title>
</head><%--
<%@include file="leftmeun.jsp"%> --%>

<body>
<div>
    <div class="container"
         style="max-height: 100%; max-width:100%; margin-left: 0px; float: left; margin-right: 0px;">
        <p style="font-size: 50px;text-align: center;">课程管理</p>
        <div class="container"
             style="max-height: 100%; max-width:100%; margin-top: 50px; margin-right: 0px; padding-left: 0px; padding-right: 0px;">
            <table class="table table-striped" width="950">
                <tr>
                    <td class="col-md-2 text-center">课程ID</td>
                    <td class="col-md-2 text-center">课程名</td>
                    <td class="col-md-2 text-center">课程院校</td>
                    <td class="col-md-2 text-center">课程介绍</td>
                    <td class="col-md-2 text-center">课程类型</td>
                    <td class="col-md-2 text-center">授课老师</td>
                    <td class="col-md-2 text-center">课程人数</td>
                    <td class="col-md-2 text-center">课程评级</td>
                    <td class="col-md-2 text-center">课程状态</td>
                    <td class="col-md-2 text-center">操作</td>
                    <td class="col-md-2 text-center">详情</td>
                    <td class="col-md-2 text-center">删除课程</td>
                </tr>
                <c:if test="${courses.size()==0 }">
                    <tr>
                        <td colspan="5" style="font-size: 35px; text-align: center;">暂无课程
                        </td>
                    </tr>
                </c:if>
                <c:forEach items="${courses }" var="course">
                    <tr>
                        <td class="col-md-2 text-center ">${course.id }</td>
                        <td class="col-md-2 text-center" style="">${course.name }</td>
                        <td class="col-md-2 text-center">${course.school }</td>
                        <td class="col-md-2 text-center">${course.context }</td>
                        <td class="col-md-2 text-center">${course.type }</td>
                        <td class="col-md-2 text-center">${course.teacher }</td>
                        <td class="col-md-2 text-center">${course.people}</td>
                        <td class="col-md-2 text-center">${course.grade}</td>
                        <td class="col-md-2 text-center ">${course.label}</td>
                        <td class="col-md-2 text-center ">
                            <c:if test="${course.label == '下架'}">
                                <a class="btn btn-danger delete"
                                   style="background-color: gray;"
                                   href="javascript:bancourse(coursename='${course.name }',courseid ='${course.id}',a = 1)">上架</a>
                            </c:if>
                            <c:if test="${course.label == '上架'}">
                                <a class="btn btn-danger delete"
                                   href="javascript:bancourse(coursename='${course.name }',courseid ='${course.id}',a = 2)">下架</a>
                            </c:if>
                        </td>
                        <td class="col-md-2 text-center ">
                            <a class="btn btn-danger delete"
                               style="background-color: green;"
                               href="coursedetail.do?courseid=${course.id }">查看详情</a>
                        </td>
                        <td class="col-md-2 text-center ">
                            <a class="btn btn-danger delete"
                               style="background-color: red;"
                               href="javascript:removecourse(coursename='${course.name }',courseid ='${course.id}')">删除课程</a>
                        </td>
                    </tr>


                </c:forEach>
            </table>
                <c:if test="${page!=0 }">
                    <button onclick="prevpage()">上一页</button>
                </c:if>
                <button onclick="reflash()">刷新</button>
                <c:if test="${page != maxpage }">
                    <button onclick="nextpage()">下一页</button>
                </c:if>

        </div>
    </div>
</div>
<script type="text/javascript">
    function reflash(){
        window.location.reload(true);
    }
    function prevpage(){
        var page = ${page}-1;
        window.location.href="allcourse.do?page="+page;
    }
    function nextpage(){
        var maxpage = ${maxpage};
        var page = ${page}+1;
        if(page>maxpage){
            alert("这是最后一页！");
        }else{
            window.location.href="allcourse.do?page="+page;
        }
    }
    function removecourse(coursename,courseid){
        var r=confirm("确认要删除课程："+coursename+"?");
        if (r==true){
            var removepassword=prompt("请输入管理员密码","");
            if (removepassword==null || removepassword==""){
                alert("删除密码不能为空！");
                return;
            }else{
                $.ajax({
                    type : "post",
                    url : "deletecourse.do",
                    data : {
                        "courseid" : courseid,
                        "removepassword" : removepassword
                    },
                    async : true,
                    dataType : 'text',
                    success : function(data) {
                        if (data == "0") {
                            alert("删除密码错误！");
                            return;
                        }
                        alert(data);
                        location.reload(true);
                    },
                    error : function(data) {
                        alert("出错！请联系管理员" + data);
                    }
                });}
        }
    }
    function bancourse(coursename,courseid,a) {
        var r=false;
        if(a == 1)
            r=confirm("确认上架课程："+coursename+"?");
        if(a == 2)
            r=confirm("确认下架课程："+coursename+"?");
        if (r==true){
            var removepassword=prompt("请输入管理员密码","");
            if (removepassword==null || removepassword==""){
                alert("删除密码不能为空！");
                return;
            }else{
                $.ajax({
                    type : "post",
                    url : "bancourse.do",
                    data : {
                        "courseid" : courseid,
                        "removepassword":removepassword
                    },
                    async : true,
                    dataType : 'text',
                    success : function(data) {
                        if (data == "0") {
                            alert("删除密码错误！");
                            return;
                        }
                        alert(data);
                        location.reload(true);
                    },
                    error : function(data) {
                        alert("出错！请联系管理员" + data);
                    }
                });}
    }
    }
</script>
</body>
</html>
