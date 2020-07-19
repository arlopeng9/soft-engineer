<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/7
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>注册</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="style/css/course.css">
    <link  rel="stylesheet" href="style/css/bootstrap.min.css">
    <script src="style/js/jquery.min.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style/css/11.css">

</head>
<body>

<script type="application/javascript">
    function regist() {
        var username = $("#username").val();
        var password = $("#password").val();
        var email = $("#email").val();
        var reg =  /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        var sex = $('input:radio:checked').val();
        var okUsername = false;
        var okPassword = false;
        var okEmail = false;
        if (username == "") {
            $("#spanUsername").html("<b style='color:red;font-size:15px;margin-top:auto;'>用户名不能为空！</b>");
        } else {
            $("#spanUsername")
                .html(
                    "<div class='glyphicon glyphicon-ok' style='float:left'></div>");
            okUsername = true;
        }
        if (password == "") {
            $("#spanPassword").html("<b style='color:red;font-size:15px;margin-top:auto;'>密码不能为空！</b>");
        } else {
            $("#spanPassword")
                .html(
                    "<div class='glyphicon glyphicon-ok' style='float:left'></div>");
            okPassword = true;
        }
        if (email == "") {
            $("#spanEmail").html("<b style='color:red;font-size:15px;margin-top:auto;'>email不能为空！</b>");
        } else {
            if(reg.test(email)){

                $("#spanEmail").html(
                    "<div class='glyphicon glyphicon-ok' style='float:left'></div>");
                okEmail = true;
            }else{
                $("#spanEmail").html("<b style='color:red;font-size:15px;margin-top:auto;'>email格式错误！</b>");
            }
        }



        if (okUsername && okPassword && okEmail) {
            $("#form1").submit();
        }


    }
</script>

<div id="ui" style="text-align: center;">
    <div class="user ">
        <div class="logo">
            <a href=#> <img
                    src="${pageContext.request.contextPath }/style/image/1.jpg"
                    width="204px" class="img-rounded"></a>
        </div>
        <!-- uiView:  -->
        <div data-ui-view="" class="container">
            <nav class="navbar navbar-default" role="navigation"
                 style="border: 0px solid transparent !important;">



                <ul class="nav navbar-nav" style="width: auto; margin-left: 490px;">
                    <li><a href="login.jsp" style="font-size: 20px;">登录</a></li>
                    <li class="active"><a href="#" style="font-size: 20px;">注册</a></li>

                </ul>


            </nav>

            <div class="container-fluid full ">
                <form action="regist.do"
                      class="form-horizontal col-md-9 col-md-offset-2 " role="form"
                      method="post" id="form1">

                    <div class="form-group">
                        <label for="username" class="col-md-3 control-label">用户名</label>
                        <div class="col-md-6">
                            <input name="username" type="text" id="username" maxlength="10"
                                   placeholder="请输入用户名" class="input form-control"
                                    />
                        </div>
                        <label class="col-md-3 control-label" id="spanUsername"
                               style="text-align: left;"></label>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label">密码</label>
                        <div class="col-md-6">
                            <input name="password" type="password" id="password"
                                   maxlength="15" placeholder="请输入密码" class="input form-control">
                        </div>

                        <label class="col-md-3 control-label" id="spanPassword"
                               style="text-align: left;"></label>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-md-3 control-label">Email</label>
                        <div class="col-md-6">
                            <input name="email" type="email" id="email" placeholder="Email"
                                   class="form-control">
                        </div>
                        <label class="col-md-3 control-label" id="spanEmail"
                               style="text-align: left;"></label>
                    </div>

                    <div class="form-group">
                        <label for="age" class="col-md-3 control-label">年龄</label>
                        <div class="col-md-6">
                            <input name="age" type="text" id="age"
                                   class="form-control">
                        </div>
                        <label class="col-md-3 control-label" id="spanAge"
                               style="text-align: left;"></label>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">性别</label>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label class="radio-inline"> <input name="sex"
                                                                        class="gender" type="radio" id="femaleRadio" value="女"
                                                                        checked=true />女
                                    </label>
                                </div>
                                <div class="col-sm-6">
                                    <label class="radio-inline"> <input name="sex"
                                                                        class="gender" type="radio" id="maleRadio" value="男" />男
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
                        <div class="col-md-9 col-md-offset-1">
                            <button type="button" id="submit1"
                                    class="btn btn-primary btn-block" onclick="regist()">立即注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="footer">
            <a id="back_home" href="index.do"> 返回首页</a>

        </div>
    </div>
</div>
</body>
</html>
