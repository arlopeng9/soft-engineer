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
    <title><c:choose><c:when test="${user!=null }">用户详情</c:when><c:otherwise>新建用户</c:otherwise></c:choose></title>
</head><%--
<%@include file="leftmeun.jsp" %> --%>
<body>
<div class="container-fluid full " style="float: left;width: 1500px;height: 2000px;margin-top: 100px;">
        <form action="userop.do"
              class="form-horizontal col-md-9 col-md-offset-2 " role="form"
              method="post" id="form1">
            <c:if test="${user!=null}">
            <input type="hidden" id="id" name="id" value="${user.id}" />
            </c:if>
            <div class="form-group">
                <label for="username" class="col-md-3 control-label">用户名</label>
                <div class="col-md-6">
                    <input name="username" type="text" id="username" maxlength="10"
                           value="${user.username }" class="input form-control"
                           >
                </div>
                <div class="form-group">
                    <div id="spanUsername"></div>
                </div>
            </div>

            <div class="form-group">
                <label for="password" class="col-md-3 control-label">密码</label>
                <div class="col-md-6">
                    <input name="password" type="text" id="password"
                           maxlength="15" value="${user.password }" class="input form-control">
                </div>

                <div class="form-group">
                    <div id="spanPassword"></div>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-md-3 control-label">Email</label>
                <div class="col-md-6">
                    <input name="email" type="email" id="email" value="${user.email }"
                           class="form-control">
                </div>
                <div class="form-group">
                    <div id="spanEmail"></div>
                </div>
            </div>

            <div class="form-group">
                <label for="age" class="col-md-3 control-label">年龄</label>
                <div class="col-md-6">
                    <input name="age" type="text" id="age" value="${user.age }"
                           class="form-control">
                </div>
                <div class="form-group">
                    <div id="spanAge"></div>
                </div>
            </div>
           
            <div class="form-group">
                <label class="control-label col-md-3">性别</label>
                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-6">
                            <label class="radio-inline"> <input name="sex"
                                                                class="gender" type="radio" id="femaleRadio" value="女"
                                    <c:if test="${user.sex == '女'}"> checked </c:if> />女
                            </label>
                        </div>
                        <div class="col-sm-6">
                            <label class="radio-inline"> <input name="sex"
                                                                class="gender" type="radio" id="maleRadio" value="男"
                                    <c:if test="${user.sex == '男'}"> checked </c:if> />男
                            </label>
                        </div>

                    </div>
                </div>
            </div>
            <!-- /.form-group -->

            <div class="form-group">
                <div class="col-sm-9 col-sm-offset-3"></div>
            </div>
            <!-- /.form-group -->
            <div class="form-group">
                <c:if test="${user!=null}">
                    <button type="button" id="button"
                            class="btn btn-primary btn-block" onclick="check()">确认修改</button>
                </c:if>
                <c:if test="${user == null}">
                    <button type="button" id="button"
                            class="btn btn-primary btn-block" onclick="check()">新建用户</button>
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
        var email = $("#email").val();
        var reg =  /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        var sex = $('input:radio:checked').val();
        var isok = true;
        if (username == "") {
            $("#spanUsername").html("<b style='color:red;font-size:15px;margin-top:auto;'>用户名不能为空！</b>");
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
        if (email == "") {
            $("#spanEmail").html("<b style='color:red;font-size:15px;margin-top:auto;'>email不能为空！</b>");
            isok = false;
        } else {
            if(reg.test(email)){

                $("#spanEmail").html(
                    "<div class='glyphicon glyphicon-ok' style='float:left'></div>");
            }else{
                $("#spanEmail").html("<b style='color:red;font-size:15px;margin-top:auto;'>email格式错误！</b>");
                isok = false;
            }
        }



        if (isok) {
            $("#form1").submit();
        }
    }
</script>
</html>