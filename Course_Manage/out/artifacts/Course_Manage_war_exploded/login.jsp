<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/7
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <title>登录</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style/css/course.css">
    <link  rel="stylesheet" href="style/css/bootstrap.min.css">
    <script src="style/js/jquery.min.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style/css/11.css">

</head>

<body>

<div id="ui" style="text-align:center;">
    <div class="user ">
        <div class="logo" style="margin-bottom: 50px;margin-top: 50px;">
            <a href=#>
                <img src="${pageContext.request.contextPath }/style/image/1.jpg" width="204px" class="img-rounded"></a>
        </div>
        <!-- uiView:  -->
        <div data-ui-view="" class="container">
            <nav class="navbar navbar-default" role="navigation"
                 style="border: 0px solid transparent !important;">
                <ul class="nav navbar-nav" style="width: auto; margin-left: 490px;">
                    <li class="active"><a href="#" style="font-size: 20px;">登录</a></li>
                    <li><a href="regist.jsp" style="font-size: 20px;">注册</a></li>

                </ul>
            </nav>


            <div class="container-fluid full ">
                <form id="loginform"  method="post"
                      class="form col-md-4 col-md-offset-4 ">
                    <label for="username" class="col-md-3 control-label">用户名</label>
                    <div class="form-group" >
                        <input id="username" name="username" type="text"
                               class="form-control input-lg" placeholder="用户名">
                    </div>
                    <label for="password" class="col-md-3 control-label">密码</label>
                    <div class="form-group">
                        <input id="password" name="password" type="password"
                               class="form-control input-lg" placeholder="登录密码">
                    </div>
                    <label class="col-md-3 control-label"
                           for="varcode">验证码</label> <br><input class="form-control input-lg" id="varcode"
                                                                type="text" name="varcode" ><img onclick="createvarcode()" id="varcodeimg" alt="验证码" src="createvarcode.do"> <br>
                    <div class="form-group" id ="email">

                    </div>
                    <div class="form-group" id="phone">

                    </div>
                    <div class="form-group" id="nickname">

                    </div>
                    <div class="form-group" id="sex">

                    </div>

                    <div class="form-group">
                        <div id="loginInfo"></div>
                    </div>

                    <div class="form-group">
                        <button id="submit1" class="btn btn-primary btn-lg btn-block"
                                type="button" onclick="login()">立刻登陆</button>
                        <button id="submit2" class="btn btn-primary btn-lg btn-block"
                                type="button" onclick="adminlogin()">管理员登陆</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="footer">
            <a class="icon-ic_login_backhome" href="index.do">
                返回首页</a>
        </div>
    </div>
</div>

<script type="text/javascript">
/*点击刷新验证码*/
    function createvarcode(){
        var src = "createvarcode.do?"+new Date().getTime();
        //加时间戳，防止浏览器利用缓存
        $('.verifyCode').attr("src",src);
    }


    <!--实现动态改变页面进行注册操作 -->


    function login() {
        var username = $("#username").val();
        var password = $("#password").val();
        var varcode = $("#varcode").val();
        var isok = true;
        /* 判断用户名密码是否为空 */
        if (username == "") {
            $("#loginInfo").html(
                "<b style='color:red;font-size:15px;'>用户名不能为空！</b>");
            $("#username").focus();
            isok = false;
            return;
        }
        if (password == "") {
            $("#loginInfo").html(
                "<b style='color:red;font-size:15px;'>密码不能为空！</b>");
            $("#password").focus();
            isok = false;
            return;
        }
        if (varcode == "") {
            $("#loginInfo").html(
                "<b style='color:red;font-size:15px;'>验证码不能为空！</b>");
            $("#varcode").focus();
            isok = false;
            return;
        }
        $.ajax({
                type: "post",
                url: "varcodecheck.do",
                data: {
                    "varcode": varcode
                },
                async: false,
                dataType: 'text',
                success: function (data) {
                    if (data == "0") {
                        $("#loginInfo")
                            .html(
                                "<b style='color:red;font-size:15px;'>验证码错误!</b>");
                        isok = false;
                        return;
                    } else {
                        document.forms[0].action = "login.do";
                        document.forms[0].submit();

                    }
                }
            });
    }

function adminlogin() {
    var username = $("#username").val();
    var password = $("#password").val();
    var varcode = $("#varcode").val();
    var isok = true;
    /* 判断用户名密码是否为空 */
    if (username == "") {
        $("#loginInfo").html(
            "<b style='color:red;font-size:15px;'>用户名不能为空！</b>");
        $("#username").focus();
        isok = false;
        return;
    }
    if (password == "") {
        $("#loginInfo").html(
            "<b style='color:red;font-size:15px;'>密码不能为空！</b>");
        $("#password").focus();
        isok = false;
        return;
    }
    if (varcode == "") {
        $("#loginInfo").html(
            "<b style='color:red;font-size:15px;'>验证码不能为空！</b>");
        $("#varcode").focus();
        isok = false;
        return;
    }
    $.ajax({
        type: "post",
        url: "varcodecheck.do",
        data: {
            "varcode": varcode
        },
        async: false,
        dataType: 'text',
        success: function (data) {
            if (data == "0") {
                $("#loginInfo")
                    .html(
                        "<b style='color:red;font-size:15px;'>验证码错误!</b>");
                isok = false;
                return;
            } else {
                document.forms[0].action = "adminlogin.do";
                document.forms[0].submit();
            }
        }
    });
}
</script>

</body>
</html>
