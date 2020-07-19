<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/18
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String jsUrl=request.getContextPath()+"/style/js/";
    String cssUrl=request.getContextPath()+"/style/css/";
    String imgUrl=request.getContextPath()+"/style/img/";
%>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><c:choose><c:when test="${admin!=null }">管理员详情</c:when><c:otherwise>新建管理员</c:otherwise></c:choose></title>
</head><%--
<%@include file="leftmeun.jsp" %> --%>
<body>
<div class="container-fluid full " style="float: left;width: 1500px;height: 2000px;margin-top: 100px;">
    <form action="adminop.do"
          class="form-horizontal col-md-9 col-md-offset-2 " role="form"
          method="post" id="form1">
        <c:if test="${admin!=null}">
        <input type="hidden" id="id" name="id" value="${admin.id}" >
        </c:if>
        <div class="form-group">
            <label for="username" class="col-md-3 control-label">管理员名</label>
            <div class="col-md-6">
                <input name="username" type="text" id="username" maxlength="10"
                       value="${admin.username }" class="input form-control">
            </div>
            <div class="form-group">
                <div id="spanUsername"></div>
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="col-md-3 control-label">密码</label>
            <div class="col-md-6">
                <input name="password" type="text" id="password"
                       maxlength="15" value="${admin.password }" class="input form-control">
            </div>

            <div class="form-group">
                <div id="spanPassword"></div>
            </div>
        </div>
        <div class="form-group">
            <label for="type" class="col-md-3 control-label">管理员类型</label>
            <div class="col-md-6">
                <input name="type" type="text" id="type" value="${admin.type }"
                       class="form-control" <c:if test="${admin!=null}">disabled</c:if>>
            </div>
            <div class="form-group">
                <div id="spanType"></div>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-9 col-sm-offset-3"></div>
        </div>
        <!-- /.form-group -->
        <div class="form-group">
            <c:if test="${admin!=null}">
                <button type="button" id="button"
                        class="btn btn-primary btn-block" onclick="check()">确认修改</button>
            </c:if>
            <c:if test="${admin == null}">
                <button type="button" id="button"
                        class="btn btn-primary btn-block" onclick="check()">新建管理员</button>
            </c:if>
        </div>
        ${msg}
    </form>
</div>
</body>
<script type="text/javascript">
    function check(){
        var username = $("#username").val();
        var password = $("#password").val();
        var type = $("#type").val();
        var isok = true;
        if (username == "") {
            $("#spanUsername").html("<b style='color:red;font-size:15px;margin-top:auto;'>管理员名不能为空！</b>");
            isok = false;
        } else {
            $("#spanUsername")
                .html(
                    "<div class='glyphicon glyphicon-ok' style='float:left'></div>");
        }
        if (password == "") {
            $("#spanPassword").html("<b style='color:red;font-size:15px;margin-top:auto;'>密码不能为空！</b>");
            isok = false;
        } else {
            $("#spanPassword")
                .html(
                    "<div class='glyphicon glyphicon-ok' style='float:left'></div>");
        }
        if (type == "" || (type != "超级管理员" && type != "管理员")) {
            $("#spanType").html("<b style='color:red;font-size:15px;margin-top:auto;'>管理员类型不能为空或填写不规范，不为超级管理员或管理员！</b>");
            isok = false;
        } else {
            $("#spanType")
                .html(
                    "<div class='glyphicon glyphicon-ok' style='float:left'></div>");
        }



        if (isok) {
            $("#form1").submit();
        }
    }
</script>
</html>