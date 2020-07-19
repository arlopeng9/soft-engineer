<%--
  Created by IntelliJ IDEA.
  User: pyj
  Date: 2020/5/18
  Time: 20:12
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
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><c:choose><c:when test="${course!=null }">课程详情</c:when><c:otherwise>新增课程</c:otherwise></c:choose></title>
</head>
<body>

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>

<div class="container" style="margin-top: 150px;">
    <div class="row clearfix">
        <div class="col-md-6 column">
            <c:if test="${course!=null}">
                <img alt="" src=${course.picture}>
            </c:if>
            <form id="form1" role="form" action="courseop.do" method="post" enctype="multipart/form-data">
                <c:if test="${course!=null}">
                <input type="hidden" name="id" value="${course.id }">
                </c:if>
                <div class="form-group">
                    <label for="name">课程名</label>
                    <input type="text" name="name" value="${course.name }" class="form-control" id="name" />
                    <div class="form-group">
                        <div id="spanname"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="context">简介</label>
                    <input type="text" name="context" value="${course.context }" class="form-control" id="context" />
                    <div class="form-group">
                        <div id="spancontext"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="type">课程类型</label>
                    <select name="type" class="form-control" id="type">


                        <option value="1">-请选择-</option>
                        <option value="计算机" selected >计算机</option>
                        <option value="数理化" selected >数理化</option>
                        <option value="经济学" selected >经济学</option>
                        <option value="工业技术" selected >工业技术</option>
                        <option value="生物学" selected >生物学</option>
                        <c:if test="${course!=null }">
                            <option value="${course.type}" selected="selected">${course.type}</option>
                        </c:if>
                    </select>
                    <div class="form-group">
                        <div id="spantype"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="teacher">授课教师</label>
                    <input type="text" name="teacher" value="${course.teacher}" class="form-control" id="teacher" />
                    <div class="form-group">
                        <div id="spanteacher"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="label">课程状态</label>
                    <input type="text" name="label" value="${course.label}" class="form-control" id="label" />
                    <div class="form-group">
                        <div id="spanlabel"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="people">上课人数</label>
                    <input type="text" name="people" value="${course.people}" class="form-control" id="people" />
                    <div class="form-group">
                        <div id="spanpeople"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">文件上传</label>
                    <input type="file" id="exampleInputFile" multiple="multiple" name="file" accept=".png,.jpg,.jpeg,.ogg"/>
                    <p class="help-block">
                        将封面图片（jpg,如上传多个图片或多个视频只按照最后一个处理）和视屏文件一起上传或单个上传，视屏文件只支持OGG格式，请转换格式之后在上传，避免客户端播放不了，视频文件上传限制500MB.
                    </p>
                </div>
                <div class="form-group">
                    <label for="grade">课程评级</label>
                    <select name="grade" class="form-control" id="grade">


                        <option value="1">-请选择-</option>
                        <option value="初级" selected >初级</option>
                        <option value="中级" selected >中级</option>
                        <option value="高级" selected >高级</option>
                        <option value="国家精品" selected >国家精品</option>
                        <c:if test="${course!=null }">
                            <option value="${course.grade}" selected="selected">${course.grade}</option>
                        </c:if>
                    </select>
                        <div class="form-group">
                            <div id="spangrade"></div>
                        </div>
                </div>
                <div class="form-group">
                    <label for="school">课程所属院校</label>
                    <select name="school" class="form-control" id="school">


                        <option value="1">-请选择-</option>
                        <option value="Mooc大学" selected >Mooc大学</option>
                        <option value="武汉大学" selected >武汉大学</option>
                        <option value="北京大学" selected >北京大学</option>
                        <option value="清华大学" selected >清华大学</option>
                        <option value="华中科技大学" selected >华中科技大学</option>
                        <option value="同济大学" selected >同济大学</option>
                        <option value="复旦大学" selected >复旦大学</option>
                        <option value="厦门大学" selected >厦门大学</option>
                        <option value="哈尔滨工业大学" selected >哈尔滨工业大学</option>
                        <option value="浙江大学" selected >浙江大学</option>
                        <option value="南京大学" selected >南京大学</option>
                        <option value="西北工业大学" selected >西北工业大学</option>
                        <option value="北京邮电大学" selected >北京邮电大学</option>
                        <c:if test="${course!=null }">
                            <option value="${course.school}" selected="selected">${course.school}</option>
                        </c:if>
                    </select>
                    <div class="form-group">
                        <div id="spanschool"></div>
                    </div>
                </div>

                <div class="form-group">
                <c:if test="${course!=null }">
                    <button id="submit"type="submit" class="btn btn-default" >提交修改</button>

                    </c:if>
                <c:if test="${course==null }">
                    <button id="submit"type="submit" class="btn btn-default" >生成课程</button>

                    </c:if>
                </div>
                ${msg }
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function addcheck(){
        var name = $("#name").val();
        var context = $("#context").val();
        var type = $("#type").val();
        var teacher = $("#teacher").val();
        var label = $("#label").val();
        var people = $("#people").val();
        var grade = $("#grade").val();
        var school = $("#school").val();
        var isok = true;
        /* 判断表格是否为空 */
        if (name == "") {
            $("#spanname").html("<b style='color:red;font-size:15px;margin-top:auto;'>课程名不能为空！</b>");
            isok = false;
        }
        if (context == "") {
            $("#spancontext").html("<b style='color:red;font-size:15px;margin-top:auto;'>课程简介不能为空！</b>");
            isok = false;
        }
        if (type == "1") {
            $("#spantype").html("<b style='color:red;font-size:15px;margin-top:auto;'>课程类型不能为空！</b>");
            isok = false;
        }
        if (teacher == "") {
            $("#spanteacher").html("<b style='color:red;font-size:15px;margin-top:auto;'>授课老师不能为空！</b>");
            isok = false;
        }
        if (label == "") {
            $("#spanlabel").html("<b style='color:red;font-size:15px;margin-top:auto;'>课程状态不能为空！</b>");
            isok = false;
        }
        if (people == "") {
            $("#spanpeople").html("<b style='color:red;font-size:15px;margin-top:auto;'>课程人数不能为空！</b>");
            isok = false;
        }
        if (grade == "1") {
            $("#spangrade").html("<b style='color:red;font-size:15px;margin-top:auto;'>课程评级不能为空！</b>");
            isok = false;
        }
        if (school == "1") {
            $("#spanschool").html("<b style='color:red;font-size:15px;margin-top:auto;'>课程院校不能为空！</b>");
            isok = false;
        }

        if(isok == true) {
            alert("cshbsd");
            document.forms[0].action = "courseop.do";
            document.forms[0].submit();
        }
    }
</script>
</body>
</html>
