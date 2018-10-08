<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>模板-在线考试后台管理系统</title>

    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <link href="vendor/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="vendor/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="vendor/css/plugins/footable/footable.core.css" rel="stylesheet">

</head>

<body>

<div id="wrapper">
    <%@include file="navigation.jsp" %>

    <div id="page-wrapper" class="gray-bg">
        <!-- header 顶部包装区域 -->
        <%@include file="header.jsp" %>
        <!-- 顶部导航 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>主页</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <!-- main 主体区域 -->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-lg-2">
                </div>
                <div class="col-lg-8">
                    <form action="ques/searchCheckBox" method="post">
                        <div class="form-group">
                            <label class="col-sm-1 control-label" style="margin-left: 15px">单选题题干：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="question">
                                <span class="help-block m-b-none">（模糊查询）</span>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">课程</label>
                                </div>
                                <div class="col-lg-12 m-l-n">
                                    <select class="form-control" multiple="" id="courseId" name="courseId">
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">

                                <div class="form-group">
                                    <label class="col-lg-4 control-label">知识点</label>
                                </div>
                                <div class="col-lg-12 m-l-n">
                                    <select class="form-control" multiple="" id="techCateId" name="techCateId">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">查询</button>
                        <button class="btn btn-white" type="reset">重置</button>
                    </form>
                    <div class="col-lg-12">
                        <h2>查询结果</h2>
                        <ol class="breadcrumb">
                            <li style="color:red">
                                (点击题目可以展开并操作)
                            </li>
                        </ol>
                    </div>
                    <c:forEach var="questions" items="${ques.getResult()}" varStatus="status">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins border-bottom">
                                <div class="ibox-title">
                                    <div class="ibox-tools" style="text-align: left">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span><input type="checkbox" name="id" value="${questions.id}">
                                        <strong>
                                    <i>
                                        <span>${status.index+1}.</span>
                                    <span style="color:blue">${questions.question}</span>
                                    </i>
                                        </strong>
                                </span>
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="ibox-content" style="display: none">
                                    <table class="table table-hover no-margins">
                                            <%--<thead>--%>
                                            <%--<tr>--%>
                                            <%--<th style="font-size: 16px"><strong><i>(一) 简答题 每题5分</i></strong></th>--%>
                                            <%--</tr>--%>
                                            <%--</thead>--%>
                                        <tbody>
                                        <tr>
                                            <td>&nbsp;&nbsp;A.&nbsp;&nbsp;
                                                <span style="color: black">${optList.get(questions.id).optionA}</span></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;&nbsp;B.&nbsp;&nbsp;
                                                <span style="color: black">${optList.get(questions.id).optionB}</span></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;&nbsp;C.&nbsp;&nbsp;
                                                <span style="color: black">${optList.get(questions.id).optionC}</span></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;&nbsp;D.&nbsp;&nbsp;
                                                <span style="color: black">${optList.get(questions.id).optionD}</span></td>
                                        </tr>
                                        <tr>
                                            <td>答案是：&nbsp;&nbsp;&nbsp;
                                                <span style="color: black">${questions.correct}</span>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="button" class="btn btn-w-m btn-info">
                                                    更新
                                                </button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="button" class="btn btn-w-m btn-info">
                                                    删除
                                                </button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                            <li style="margin-left: 37px">
                                <input type="checkbox" name="id" value="" onclick="selectAll(this);">全选
                            </li>
                            <li style="">
                                <span style="color: black">考卷编号：</span>
                                <input type="text" name="" id="">
                                <input type="button" value="选择">
                                <button class="btn btn-primary" type="submit">加入试卷</button>
                            </li>
                        </ol>
                    </div>
                    <div class="col-lg-12">
                        <ol class="breadcrumb">

                        </ol>
                    </div>
                    <table class="table table-hover no-margins">
                        <tr class="page-nav" style="text-align: center">
                            <td colspan='5'>
                                总记录：${ques.getTotal()} &nbsp;&nbsp;
                                第${ques.getPageNum()}页/共${ques.getPages()}页
                                &nbsp;&nbsp; &nbsp;&nbsp;
                                <c:if test="${ques.getPageNum() gt 1}">
                                    <a href="ques/searchRadio?pageNum=1">第一页</a> &nbsp;
                                </c:if>
                                <c:if test="${ques.getPageNum() gt 1}">
                                    <a href="ques/searchRadio?pageNum=${ques.getPageNum()-1}">上一页</a>&nbsp;
                                </c:if>
                                <c:if test="${ques.getPageNum() lt ques.getPages()}">
                                    <a href="ques/searchRadio?pageNum=${ques.getPageNum()+1}">下一页</a>&nbsp;
                                </c:if>
                                <c:if test="${ques.getPageNum() lt ques.getPages()}">
                                    <a href="ques/searchRadio?pageNum=${ques.getPages()}">末页</a>&nbsp;
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-2"></div>

            </div>
        </div>
        <!-- footer 底部包装区域 -->
        <%@include file="footer.jsp" %>
    </div>

</div>


<!-- Mainly scripts -->
<script src="js/jquery-2.2.4.js"></script>
<script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="vendor/js/inspinia.js"></script>
<script src="vendor/js/plugins/pace/pace.min.js"></script>

<!-- DROPZONE -->
<script src="vendor/js/plugins/dropzone/dropzone.js"></script>


<script>
    $(document).ready(function () {

        Dropzone.options.myAwesomeDropzone = {

            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            maxFiles: 100,

            // Dropzone settings
            init: function () {
                var myDropzone = this;

                this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function () {

                });
                this.on("successmultiple", function (files, response) {
                    console.log("successmultiple>>>>>" + response);
                });
                this.on("errormultiple", function (files, response) {
                    console.log(response);
                });
            }
        }

    });
</script>
<script>
    $(function () {
        // 加载课程名下拉列表
        $.get("ques/load_courses", function (resp) {
            // console.log(resp);
            $("#courseId").empty();
            $.each(resp, function (i, v) {
                var option = new Option(v.courseName, v.id);
                $("#courseId").append(option);
            });
        }, "json");

        $("#courseId").change(function () {
            var courseId = this.options[this.selectedIndex].value;
            console.log(courseId);

            $.get("ques/load_tech_by_id", {"courseId": courseId}, function (resp) {
                console.log(resp);

                $("#techCateId").empty();

                $.each(resp, function (i, v) {
                    var option = new Option(v.techCtgr, v.id);
                    $("#techCateId").append(option);
                });
            }, "json");
        });
    })
    function selectAll(checkbox) {
        $('input[type=checkbox]').prop('checked', $(checkbox).prop('checked'));
    }
</script>

</body>

</html>
