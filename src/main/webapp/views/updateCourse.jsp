<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  course: Haoge
  Date: 2018/9/1
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        更新课程信息
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 96px;">课程ID：</div>
                    <input style="width: 300px" type="text" class="form-control" id="courseId" value="${oldCourse.id}"
                           name="id" placeholder="请输入课程名">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">课程名称：</div>
                    <input style="width: 300px" type="text" class="form-control" id="newName" value="${oldCourse.courseName}"
                           name="courseName" placeholder="请输入课程名">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">
        关闭
    </button>
    <button id="updateBtn" type="button" class="btn btn-primary">
        提交更改
    </button>
</div>

<script>
    $(function () {
        $("#updateBtn").click(function () {
            var course = $("#updateForm").serialize();
            $.post("category/updateCourse", course, function (json) {
                $("#tr_" + $("#courseId").val() + " td:eq(1)").text($("#newName").val());

               // console.dirxml("#tr_" + $("#courseId").val() + " td:eq(1)");

                console.dirxml($("#tr_" + $("#courseId").val())[0]);

                if (json.actionFlag) {
                    $('#successAlert').show();
                    setTimeout("$('#successAlert').hide()", 3000);
                } else {
                    $('#failAlert').show();
                    setTimeout("$('#failAlert').hide()", 3000);
                }
                $('#updateModal').modal("hide");
            },"json");

        });
    });
</script>
